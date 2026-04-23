from __future__ import annotations

from dataclasses import dataclass
from typing import Iterable, List, Set, Tuple

import math

from .config import Config
from .observables import basin_membership, f_cryst, local_minimum
from .state import State

Coord = Tuple[int, int]


@dataclass
class EscapeResult:
    local_minimum: bool
    barrier: float
    escape_rate: float
    tau_meta: float
    escape_prob: float
    candidate_count: int


def detach_neighbors(cfg: Config, state: State) -> List[State]:
    out = []
    for s in state.ideal:
        ideal = set(state.ideal)
        ideal.remove(s)
        out.append(State(frozenset(ideal), state.strained, state.external, label=f"Detach{s}"))
    for s in state.strained:
        strained = set(state.strained)
        strained.remove(s)
        out.append(State(state.ideal, frozenset(strained), state.external, label=f"DetachStrained{s}"))
    return out


def slip_neighbors(cfg: Config, state: State) -> List[State]:
    out = []
    for s in state.ideal:
        x, y = s
        candidates = [(x+1,y), (x-1,y), (x,y+1), (x,y-1)]
        for t in candidates:
            if t in cfg.strained_sites and t not in state.strained:
                ideal = set(state.ideal)
                ideal.remove(s)
                strained = set(state.strained)
                strained.add(t)
                out.append(State(frozenset(ideal), frozenset(strained), state.external, label=f"Slip{s}->{t}"))
    return out


def spill_neighbors(cfg: Config, state: State) -> List[State]:
    out = []
    ring = [(3,8),(8,3),(12,8),(8,12),(3,6),(6,3),(12,10),(10,12)]
    ring = [r for r in ring if r in cfg.external_sites]
    for s in state.ideal:
        for t in ring:
            if t not in state.external:
                ideal = set(state.ideal)
                ideal.remove(s)
                external = set(state.external)
                external.add(t)
                out.append(State(frozenset(ideal), state.strained, frozenset(external), label=f"Spill{s}->{t}"))
                break
    return out


def escape_neighbors(cfg: Config, state: State) -> List[State]:
    seen = set()
    out = []
    for nbr in detach_neighbors(cfg, state) + slip_neighbors(cfg, state) + spill_neighbors(cfg, state):
        key = (nbr.ideal, nbr.strained, nbr.external)
        if key not in seen:
            seen.add(key)
            out.append(nbr)
    return out


def path_barrier(cfg: Config, state: State, q_star: float, depth: int = 2) -> Tuple[float, int]:
    f0 = f_cryst(cfg, state, q_star)
    best = math.inf
    count = 0

    level1 = escape_neighbors(cfg, state)
    all_first = level1
    if not local_minimum(cfg, state, q_star, level1):
        # if not a local minimum the barrier is zero in the effective sense
        return 0.0, len(level1)

    for s1 in level1:
        count += 1
        h1 = max(0.0, f_cryst(cfg, s1, q_star) - f0)
        if not basin_membership(cfg, s1, q_star):
            best = min(best, h1)
        if depth >= 2:
            for s2 in escape_neighbors(cfg, s1):
                count += 1
                h2 = max(h1, f_cryst(cfg, s2, q_star) - f0)
                if not basin_membership(cfg, s2, q_star):
                    best = min(best, h2)
    if best is math.inf:
        best = 0.0
    return best, count


def estimate_metastability(cfg: Config, state: State, q_star: float, depth: int = 2) -> EscapeResult:
    nbrs = escape_neighbors(cfg, state)
    is_local_min = local_minimum(cfg, state, q_star, nbrs)
    barrier, count = path_barrier(cfg, state, q_star, depth=depth)
    k_esc = cfg.A_esc * math.exp(-cfg.beta * barrier)
    tau_meta = math.inf if k_esc == 0 else 1.0 / k_esc
    p_esc = 1.0 - math.exp(-k_esc * cfg.tau_o)
    return EscapeResult(
        local_minimum=is_local_min,
        barrier=barrier,
        escape_rate=k_esc,
        tau_meta=tau_meta,
        escape_prob=p_esc,
        candidate_count=count,
    )
