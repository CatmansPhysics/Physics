from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, List

import pandas as pd

from .config import Config
from .escape import EscapeResult, estimate_metastability
from .growth import GrowthResult, run_growth
from .observables import basin_membership, defect_norm, f_cryst, q_lambda, summarize_state, V
from .state import Reservoir, State


@dataclass
class VerdictResult:
    verdict: str
    growth: GrowthResult
    escape: EscapeResult | None
    metrics: dict


def verdict_for_run(cfg: Config, final_state: State, term: str, q_star: float, escape: EscapeResult | None) -> str:
    v_ok = V(cfg, final_state) >= cfg.v_star
    q_ok = q_lambda(cfg, final_state) >= q_star
    d_ok = defect_norm(cfg, final_state) <= cfg.eps_o
    complete = v_ok and d_ok and q_ok
    if term == "RESERVOIR_FAIL":
        return "FAIL_RESERVOIR"
    if not complete:
        if v_ok and len(final_state.strained) > 0 and (not q_ok or not d_ok):
            return "GLASS_CAPTURE"
        if V(cfg, final_state) >= int(0.7 * cfg.v_star) and q_lambda(cfg, final_state) < q_star and len(final_state.strained) > 0:
            return "GLASS_CAPTURE"
        return "FAIL_GROWTH"
    if escape is None:
        return "SOFT_SUCCESS"
    if escape.escape_prob <= cfg.delta_rel and escape.local_minimum:
        return "HARD_SUCCESS"
    return "SOFT_SUCCESS"


def execute_run(cfg: Config, seed: State, reservoir_units: int, q_star: float) -> VerdictResult:
    reservoir = Reservoir(total_units=reservoir_units, label=f"res_{reservoir_units}")
    growth = run_growth(cfg, seed, reservoir, q_star)
    final_state = growth.final_state
    escape = None
    if V(cfg, final_state) >= cfg.v_star and q_lambda(cfg, final_state) >= q_star:
        escape = estimate_metastability(cfg, final_state, q_star)
    verdict = verdict_for_run(cfg, final_state, growth.termination_mode, q_star, escape)
    metrics = summarize_state(cfg, final_state, q_star)
    if escape:
        metrics.update({
            "barrier": escape.barrier,
            "escape_rate": escape.escape_rate,
            "tau_meta": escape.tau_meta,
            "escape_prob": escape.escape_prob,
            "local_minimum": escape.local_minimum,
            "escape_candidates": escape.candidate_count,
        })
    else:
        metrics.update({
            "barrier": None,
            "escape_rate": None,
            "tau_meta": None,
            "escape_prob": None,
            "local_minimum": None,
            "escape_candidates": None,
        })
    metrics.update({
        "termination_mode": growth.termination_mode,
        "units_used": growth.units_used,
        "verdict": verdict,
        "seed": seed.label,
        "reservoir_units": reservoir_units,
        "mu_star": cfg.mu_star,
        "delta_star": cfg.delta_star,
        "beta": cfg.beta,
    })
    return VerdictResult(verdict=verdict, growth=growth, escape=escape, metrics=metrics)
