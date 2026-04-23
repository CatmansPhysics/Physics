from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, List, Optional, Tuple

from .config import Config
from .observables import defect_norm, hole_count, q_lambda, summarize_state, V
from .state import Reservoir, State

Coord = Tuple[int, int]


@dataclass
class GrowthStep:
    step: int
    move_type: str
    site: Coord | None
    mu: float | None
    delta_loc: float | None
    volume: int
    defect: float
    q: float
    holes: int
    label: str


@dataclass
class GrowthResult:
    final_state: State
    steps: List[GrowthStep]
    termination_mode: str
    l_grow: float
    units_used: int


def ideal_frontier(cfg: Config, state: State) -> List[Coord]:
    occ = set(state.ideal)
    frontier = []
    for s in cfg.ideal_sites:
        if s in occ:
            continue
        if any(u in occ for u in cfg.neighbors[s]):
            frontier.append(s)
    return sorted(frontier)


def strained_frontier(cfg: Config, state: State) -> List[Coord]:
    if not state.ideal:
        return []
    frontier_i = set(ideal_frontier(cfg, state))
    cand = []
    for s in cfg.strained_sites:
        if s in state.strained:
            continue
        if min(abs(s[0] - u[0]) + abs(s[1] - u[1]) for u in frontier_i) <= 1:
            cand.append(s)
    return sorted(cand)


def add_site(state: State, site: Coord, kind: str, label: str) -> State:
    if kind == "ideal":
        new_ideal = set(state.ideal)
        new_ideal.add(site)
        return state.copy_with(ideal=new_ideal, label=label)
    elif kind == "strained":
        new_strained = set(state.strained)
        new_strained.add(site)
        return state.copy_with(strained=new_strained, label=label)
    raise ValueError(kind)


def local_mismatch_ideal(cfg: Config, state: State, site: Coord) -> float:
    new_state = add_site(state, site, "ideal", label=state.label)
    z_after = sum((u in new_state.ideal) for u in cfg.neighbors[site])
    z_target = len(cfg.neighbors[site])
    h_before = hole_count(cfg, state)
    h_after = hole_count(cfg, new_state)
    return (
        cfg.c_iso * int(sum((u in state.ideal) for u in cfg.neighbors[site]) == 0)
        + cfg.c_coord * (abs(z_after - z_target) / max(1, z_target))
        + cfg.c_hole * int(h_after > h_before)
    )


def local_mismatch_strained(cfg: Config, state: State, site: Coord) -> float:
    nearby_ideal = 0
    for u in state.ideal:
        if abs(site[0] - u[0]) + abs(site[1] - u[1]) <= 2:
            nearby_ideal += 1
    return cfg.c_reg + cfg.c_near * (1.0 / (1 + nearby_ideal))


def delta_loc(cfg: Config, state: State, site: Coord, kind: str) -> float:
    new_state = add_site(state, site, kind, label=state.label)
    return defect_norm(cfg, new_state) - defect_norm(cfg, state)


def growth_score(cfg: Config, state: State, site: Coord, kind: str, mu: float) -> float:
    new_state = add_site(state, site, kind, label=state.label)
    delta_d = defect_norm(cfg, new_state) - defect_norm(cfg, state)
    delta_v = V(cfg, new_state) - V(cfg, state)
    delta_h_pos = max(0, hole_count(cfg, state) - hole_count(cfg, new_state))
    return cfg.lambda_mu * mu + cfg.lambda_d * delta_d - cfg.lambda_v * delta_v - cfg.lambda_h * delta_h_pos


def candidate_moves(cfg: Config, state: State) -> List[Tuple[str, Coord, float, float, float]]:
    moves = []
    for s in ideal_frontier(cfg, state):
        mu = local_mismatch_ideal(cfg, state, s)
        dloc = delta_loc(cfg, state, s, "ideal")
        if mu <= cfg.mu_star and dloc <= cfg.delta_star:
            score = growth_score(cfg, state, s, "ideal", mu)
            moves.append(("ideal", s, mu, dloc, score))
    for s in strained_frontier(cfg, state):
        mu = local_mismatch_strained(cfg, state, s)
        dloc = delta_loc(cfg, state, s, "strained")
        if mu <= cfg.mu_star and dloc <= cfg.delta_star:
            score = growth_score(cfg, state, s, "strained", mu)
            moves.append(("strained", s, mu, dloc, score))
    moves.sort(key=lambda t: (t[4], t[0], t[1]))
    return moves


def run_growth(cfg: Config, seed: State, reservoir: Reservoir, q_star: float) -> GrowthResult:
    required_capacity = max(0, cfg.v_star - V(cfg, seed)) + cfg.l_res
    if reservoir.capacity < required_capacity:
        return GrowthResult(final_state=seed, steps=[], termination_mode="RESERVOIR_FAIL", l_grow=0.0, units_used=0)

    state = seed
    steps: List[GrowthStep] = []
    used = 0

    for n in range(cfg.max_steps):
        if V(cfg, state) >= cfg.v_star:
            term = "COMPLETE"
            break
        if used >= reservoir.capacity:
            term = "CAPACITY_EXHAUSTED"
            break
        moves = candidate_moves(cfg, state)
        if not moves:
            term = "NO_COMPATIBLE_STEP"
            break
        kind, site, mu, dloc, _score = moves[0]
        state = add_site(state, site, kind, label=f"{seed.label}|step{n+1}")
        used += 1
        steps.append(
            GrowthStep(
                step=n + 1,
                move_type=f"Attach{kind.title()}",
                site=site,
                mu=mu,
                delta_loc=dloc,
                volume=V(cfg, state),
                defect=defect_norm(cfg, state),
                q=q_lambda(cfg, state),
                holes=hole_count(cfg, state),
                label=state.label,
            )
        )
    else:
        term = "STEP_LIMIT_REACHED"

    l_grow = 0.0
    return GrowthResult(final_state=state, steps=steps, termination_mode=term, l_grow=l_grow, units_used=used)
