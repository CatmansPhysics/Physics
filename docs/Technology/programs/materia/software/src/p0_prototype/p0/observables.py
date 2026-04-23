from __future__ import annotations

from dataclasses import dataclass
from math import exp
from typing import Dict, Iterable, List, Tuple

import numpy as np

from .config import Config
from .state import State

Coord = Tuple[int, int]


def state_to_occ(state: State):
    return set(state.ideal) | set(state.strained)


def V(cfg: Config, state: State) -> int:
    return len(state.ideal)


def z_x(cfg: Config, state: State, site: Coord) -> int:
    return sum((u in state.ideal) for u in cfg.neighbors[site])


def e_x(cfg: Config, state: State, site: Coord) -> float:
    if site not in state.ideal:
        return 0.0
    zt = len(cfg.neighbors[site])
    return abs(z_x(cfg, state, site) - zt) / max(1, zt)


def hole_indicator(cfg: Config, state: State, site: Coord) -> int:
    zt = len(cfg.neighbors[site])
    return int((site not in state.ideal) and z_x(cfg, state, site) >= max(0, zt - 1))


def hole_count(cfg: Config, state: State) -> int:
    return sum(hole_indicator(cfg, state, s) for s in cfg.ideal_sites)


def defect_components(cfg: Config, state: State):
    d_coord = sum(e_x(cfg, state, s) for s in cfg.ideal_sites)
    d_hole = sum(hole_indicator(cfg, state, s) for s in cfg.ideal_sites)
    d_off = len(state.strained & cfg.strained_sites)
    d_out = len(state.external & cfg.external_sites)
    return dict(D_coord=d_coord, D_hole=d_hole, D_off=d_off, D_out=d_out)


def defect_norm(cfg: Config, state: State) -> float:
    comps = defect_components(cfg, state)
    val = (
        cfg.w_coord * comps["D_coord"]
        + cfg.w_hole * comps["D_hole"]
        + cfg.w_off * comps["D_off"]
        + cfg.w_out * comps["D_out"]
    ) / cfg.v_star
    return float(val)


def _phase(x: int, y: int, kx: float, ky: float) -> float:
    sx = -1.0 if abs(kx - np.pi) < 1e-9 and x % 2 == 1 else 1.0
    sy = -1.0 if abs(ky - np.pi) < 1e-9 and y % 2 == 1 else 1.0
    return sx * sy


def bragg_amplitudes(cfg: Config, state: State) -> Dict[Tuple[float, float], float]:
    occ = (set(state.ideal) | set(state.strained)) & cfg.target_sites
    denom = max(cfg.v_star, len(occ), 1)
    amps = {}
    for k in cfg.k_lambda:
        kx, ky = k
        total = 0.0
        for x, y in occ:
            total += _phase(x, y, kx, ky)
        amps[k] = total / denom
    return amps


def q_bragg(cfg: Config, state: State) -> float:
    amps = bragg_amplitudes(cfg, state)
    return max(abs(v) ** 2 for v in amps.values()) if amps else 0.0


def q_lambda(cfg: Config, state: State) -> float:
    # Phase-anchored score used by the prototype: Bragg shell score times ideal occupancy purity.
    total_in_target = len(state.ideal) + len(state.strained)
    ideal_purity = len(state.ideal) / total_in_target if total_in_target else 0.0
    return q_bragg(cfg, state) * ideal_purity


def boundary_roughness(cfg: Config, state: State) -> float:
    if not cfg.boundary_sites:
        return 0.0
    val = 0.0
    for s in cfg.boundary_sites:
        zt = len(cfg.neighbors[s])
        if s in state.ideal:
            val += abs(z_x(cfg, state, s) - zt) / max(1, zt)
        else:
            val += 1.0
    return val / len(cfg.boundary_sites)


def contamination_score(cfg: Config, state: State) -> float:
    return (len(state.strained) + len(state.external)) / cfg.v_star


def phi_v(cfg: Config, state: State) -> float:
    return max(0.0, cfg.v_star - V(cfg, state))


def phi_q(cfg: Config, state: State, q_star: float) -> float:
    return max(0.0, q_star - q_lambda(cfg, state))


def phi_d(cfg: Config, state: State) -> float:
    return max(0.0, defect_norm(cfg, state) - cfg.eps_o)


def f_cryst(cfg: Config, state: State, q_star: float) -> float:
    return (
        cfg.alpha_v * phi_v(cfg, state)
        + cfg.alpha_q * phi_q(cfg, state, q_star)
        + cfg.alpha_d * phi_d(cfg, state)
        + cfg.alpha_boundary * boundary_roughness(cfg, state)
        + cfg.alpha_contam * contamination_score(cfg, state)
    )


def basin_membership(cfg: Config, state: State, q_star: float) -> bool:
    return V(cfg, state) >= cfg.v_star and q_lambda(cfg, state) >= q_star and defect_norm(cfg, state) <= cfg.eps_o


def local_minimum(cfg: Config, state: State, q_star: float, neighbors: List[State]) -> bool:
    f0 = f_cryst(cfg, state, q_star)
    return all(f_cryst(cfg, nbr, q_star) >= f0 - 1e-12 for nbr in neighbors)


def summarize_state(cfg: Config, state: State, q_star: float) -> dict:
    comps = defect_components(cfg, state)
    return {
        "label": state.label,
        "V": V(cfg, state),
        "Q": q_lambda(cfg, state),
        "Q_bragg": q_bragg(cfg, state),
        "d": defect_norm(cfg, state),
        "B_boundary": boundary_roughness(cfg, state),
        "C_res": contamination_score(cfg, state),
        "F_cryst": f_cryst(cfg, state, q_star),
        **comps,
    }
