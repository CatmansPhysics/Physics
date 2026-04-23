from __future__ import annotations

from dataclasses import dataclass, asdict
from pathlib import Path
from typing import Dict, List
import json
import math

import numpy as np
import pandas as pd


@dataclass
class HardH1M2Params:
    """Medium-specific H1 simulator for a topological / defect-protected carrier medium.

    This is a reduced pre-engineering model for composite bound transport in a gapped,
    defect-structured medium. It extends the earlier reduced H1 ansatz by adding:
    - topological protection factor,
    - defect pinning support,
    - disorder/fatigue induced erosion,
    - refresh after each cycle.
    """

    # One-pole carrier core
    m: float = 1.0
    c_l: float = 1.0
    delta: float = 0.18
    v_t: float = 1.42
    delta0: float = 0.50

    # Composite sector
    q_total0: float = 2.1
    b0: float = 0.92
    q_c: float = 3.8
    bind_scale: float = 0.12

    # Topological / defect medium
    top_gap: float = 0.95
    pin_strength: float = 0.82
    topo_threshold: float = 0.35
    defect_noise0: float = 0.08
    disorder_growth_per_cycle: float = 0.020
    topo_decay_per_fatigue: float = 0.22
    pin_decay_per_fatigue: float = 0.12

    # Control schedule
    tau_sw: float = 7.2
    tau_hold: float = 2.8
    dt: float = 0.01
    alpha_ad_target: float = 1.8

    # Spectral / loss surrogates
    gamma0: float = 0.003
    gamma_nonad: float = 0.005
    gamma_unbound: float = 0.009
    gamma_defect: float = 0.005
    gamma_max: float = 0.11

    k_bind_in: float = 2.4
    k_bind_out: float = 1.7
    k_ad_loss: float = 0.002
    k_gamma_loss: float = 0.003
    k_bind_drift_loss: float = 0.005
    k_topo_loss: float = 0.004

    # Repeatability
    refresh_strength: float = 0.80
    fatigue_from_loss: float = 0.34
    fatigue_from_gamma: float = 0.09
    q_drift_per_cycle: float = 0.010

    # Targets
    fidelity_target: float = 0.94
    epsilon_comp_target: float = 0.06
    bind_margin_target: float = 0.18
    topo_support_target: float = 0.70
    protection_target: float = 0.65

    def validate(self) -> None:
        if self.m <= 0 or self.c_l <= 0 or self.v_t <= 0 or self.delta0 <= 0:
            raise ValueError("Core transport parameters must be positive.")
        if self.q_c <= 0 or self.bind_scale <= 0:
            raise ValueError("q_c and bind_scale must be positive.")
        if self.top_gap <= 0 or self.pin_strength <= 0:
            raise ValueError("top_gap and pin_strength must be positive.")
        if self.tau_sw <= 0 or self.tau_hold < 0 or self.dt <= 0:
            raise ValueError("tau_sw and dt must be positive; tau_hold non-negative.")
        if self.alpha_ad_target <= 0:
            raise ValueError("alpha_ad_target must be positive.")
        if not (0.0 <= self.refresh_strength <= 1.0):
            raise ValueError("refresh_strength must be in [0, 1].")
        if self.gamma0 < 0 or self.gamma_nonad < 0 or self.gamma_unbound < 0 or self.gamma_defect < 0:
            raise ValueError("linewidth parameters must be non-negative.")


@dataclass
class H1M2Metrics:
    fidelity: float
    epsilon_id_comp: float
    min_onepole_gap: float
    tau_sw_min: float
    carrier_margin: float
    hold_min_bind_margin: float
    hold_mean_gamma: float
    hold_mean_topo_protection: float
    max_bound_support: float
    min_track_survival: float
    mean_topo_support: float
    feasible: float


def save_json(path: str | Path, obj: Dict) -> None:
    with open(path, "w", encoding="utf-8") as f:
        json.dump(obj, f, ensure_ascii=False, indent=2)


def e_l(q: float, p: HardH1M2Params) -> float:
    return math.sqrt(p.m * p.m + (p.c_l * q) ** 2)


def e_t(q: float, p: HardH1M2Params) -> float:
    return p.delta + p.v_t * abs(q)


def branch_energies(q: float, lam: float, p: HardH1M2Params) -> tuple[float, float]:
    el = e_l(q, p)
    et = e_t(q, p)
    s = math.sqrt(0.25 * (el - et) ** 2 + (lam * p.delta0) ** 2)
    return 0.5 * (el + et) - s, 0.5 * (el + et) + s


def upper_branch_energy(q: float, lam: float, p: HardH1M2Params) -> float:
    return branch_energies(q, lam, p)[1]


def onepole_gap(q: float, lam: float, p: HardH1M2Params) -> float:
    lo, hi = branch_energies(q, lam, p)
    return hi - lo


def lambda_schedule(t: float, p: HardH1M2Params) -> float:
    total = 2.0 * p.tau_sw + p.tau_hold
    if t < 0.0:
        return 0.0
    if t < p.tau_sw:
        return t / p.tau_sw
    if t < p.tau_sw + p.tau_hold:
        return 1.0
    if t < total:
        return 1.0 - (t - (p.tau_sw + p.tau_hold)) / p.tau_sw
    return 0.0


def smooth_step(x: float, x0: float, k: float = 6.0) -> float:
    return 1.0 / (1.0 + math.exp(-k * (x - x0)))


def topo_protection(lam: float, fatigue: float, disorder: float, p: HardH1M2Params) -> float:
    gap_gate = smooth_step(p.top_gap, p.topo_threshold, 10.0)
    pin = p.pin_strength * max(0.0, 1.0 - p.pin_decay_per_fatigue * fatigue)
    defect = math.exp(-disorder / max(p.top_gap, 1e-9))
    fatigue_factor = math.exp(-p.topo_decay_per_fatigue * fatigue)
    return max(0.0, min(1.0, gap_gate * pin * defect * fatigue_factor * (0.25 + 0.75 * lam)))


def binding_profile(q_total: float, lam: float, fatigue: float, disorder: float, p: HardH1M2Params) -> float:
    base = p.b0 * (lam ** 2) * math.exp(-((q_total / p.q_c) ** 2))
    return base * topo_protection(lam, fatigue, disorder, p)


def separation_threshold(q_total: float, lam: float, p: HardH1M2Params) -> float:
    return 2.0 * upper_branch_energy(0.5 * q_total, lam, p)


def composite_branch_energy(q_total: float, lam: float, fatigue: float, disorder: float, p: HardH1M2Params) -> float:
    return separation_threshold(q_total, lam, p) - binding_profile(q_total, lam, fatigue, disorder, p)


def numerical_derivative(func, x: float, eps: float = 1e-5) -> float:
    return (func(x + eps) - func(x - eps)) / (2.0 * eps)


def simulate_cycle(
    p: HardH1M2Params,
    q_total: float | None = None,
    fatigue: float = 0.0,
    disorder: float = 0.0,
) -> Dict[str, object]:
    p.validate()
    q_total = p.q_total0 if q_total is None else q_total
    total_time = 2.0 * p.tau_sw + p.tau_hold
    times = np.arange(0.0, total_time + 0.5 * p.dt, p.dt)
    lambdas = np.array([lambda_schedule(float(t), p) for t in times])
    q_half = 0.5 * q_total

    gaps = np.array([onepole_gap(q_half, lam, p) for lam in lambdas])
    seps = np.array([separation_threshold(q_total, lam, p) for lam in lambdas])
    topo = np.array([topo_protection(lam, fatigue, disorder, p) for lam in lambdas])
    bind = np.array([binding_profile(q_total, lam, fatigue, disorder, p) for lam in lambdas])
    e_comp = seps - bind

    dot_lambda = np.gradient(lambdas, p.dt)
    ad_score = np.abs(dot_lambda) * p.delta0 / np.maximum(gaps**2, 1e-12)

    target_bound = 1.0 - np.exp(-bind / p.bind_scale)
    target_bound = np.clip(target_bound, 0.0, 1.0)

    gamma = p.gamma0 + p.gamma_nonad * ad_score + p.gamma_unbound * (1.0 - target_bound) + p.gamma_defect * (1.0 - topo)

    bound_support = np.zeros_like(times)
    topo_support = np.zeros_like(times)
    track_survival = np.ones_like(times)
    epsilon_comp = np.zeros_like(times)

    for i in range(len(times) - 1):
        lam = lambdas[i]
        d_bind = abs(bind[i + 1] - bind[i]) / p.dt

        ds = (
            p.k_bind_in * target_bound[i] * topo[i] * (1.0 - bound_support[i])
            - p.k_bind_out * (1.0 - lam) * bound_support[i]
            - gamma[i] * bound_support[i]
        )
        bound_support[i + 1] = np.clip(bound_support[i] + p.dt * ds, 0.0, 1.0)

        dtopo = topo[i] * (1.0 - topo_support[i]) - 0.6 * (1.0 - topo[i]) * topo_support[i]
        topo_support[i + 1] = np.clip(topo_support[i] + p.dt * dtopo, 0.0, 1.0)

        de = (
            p.k_ad_loss * ad_score[i]
            + p.k_gamma_loss * gamma[i]
            + p.k_bind_drift_loss * d_bind
            + p.k_topo_loss * (1.0 - topo[i])
        )
        epsilon_comp[i + 1] = epsilon_comp[i] + p.dt * de
        track_survival[i + 1] = math.exp(-epsilon_comp[i + 1])

    hold_mask = (times >= p.tau_sw) & (times <= p.tau_sw + p.tau_hold)

    min_gap = float(np.min(gaps))
    tau_sw_min = float(p.delta0 / (p.alpha_ad_target * max(min_gap, 1e-12) ** 2))
    hold_min_bind_margin = float(np.min(bind[hold_mask])) if np.any(hold_mask) else 0.0
    hold_mean_gamma = float(np.mean(gamma[hold_mask])) if np.any(hold_mask) else float(np.mean(gamma))
    hold_mean_topo_protection = float(np.mean(topo[hold_mask])) if np.any(hold_mask) else float(np.mean(topo))
    max_bound_support = float(np.max(bound_support[hold_mask])) if np.any(hold_mask) else float(np.max(bound_support))
    min_track_survival = float(np.min(track_survival))
    mean_topo_support = float(np.mean(topo_support[hold_mask])) if np.any(hold_mask) else float(np.mean(topo_support))

    carrier_func = lambda qq: composite_branch_energy(qq, 1.0, fatigue, disorder, p)
    carrier_margin = float(abs(numerical_derivative(carrier_func, q_total)) - p.c_l)

    fidelity = float(track_survival[-1])
    epsilon_id_comp = float(1.0 - fidelity)
    feasible = float(
        (fidelity >= p.fidelity_target)
        and (epsilon_id_comp <= p.epsilon_comp_target)
        and (hold_min_bind_margin >= p.bind_margin_target)
        and (hold_mean_gamma <= p.gamma_max)
        and (max_bound_support >= p.topo_support_target)
        and (hold_mean_topo_protection >= p.protection_target)
        and (carrier_margin > 0.0)
        and (p.tau_sw >= tau_sw_min)
    )

    metrics = H1M2Metrics(
        fidelity=fidelity,
        epsilon_id_comp=epsilon_id_comp,
        min_onepole_gap=min_gap,
        tau_sw_min=tau_sw_min,
        carrier_margin=carrier_margin,
        hold_min_bind_margin=hold_min_bind_margin,
        hold_mean_gamma=hold_mean_gamma,
        hold_mean_topo_protection=hold_mean_topo_protection,
        max_bound_support=max_bound_support,
        min_track_survival=min_track_survival,
        mean_topo_support=mean_topo_support,
        feasible=feasible,
    )

    return {
        "times": times,
        "lambdas": lambdas,
        "gaps": gaps,
        "separation_threshold": seps,
        "binding": bind,
        "e_comp": e_comp,
        "ad_score": ad_score,
        "gamma": gamma,
        "topo_protection": topo,
        "bound_support": bound_support,
        "topo_support": topo_support,
        "track_survival": track_survival,
        "epsilon_comp": epsilon_comp,
        "metrics": metrics,
    }


def refresh_state(fatigue: float, disorder: float, metrics: H1M2Metrics, p: HardH1M2Params) -> tuple[float, float]:
    fatigue_out = max(0.0, fatigue * (1.0 - p.refresh_strength) + p.fatigue_from_loss * metrics.epsilon_id_comp + p.fatigue_from_gamma * metrics.hold_mean_gamma)
    disorder_out = max(0.0, disorder * (1.0 - p.refresh_strength) + p.disorder_growth_per_cycle)
    return fatigue_out, disorder_out


def run_repeatability(n_cycles: int, p: HardH1M2Params) -> pd.DataFrame:
    rows: List[Dict[str, float | int]] = []
    fatigue = 0.0
    disorder = p.defect_noise0
    for cycle in range(1, n_cycles + 1):
        q_total = p.q_total0 + (cycle - 1) * p.q_drift_per_cycle
        out = simulate_cycle(p, q_total=q_total, fatigue=fatigue, disorder=disorder)
        m: H1M2Metrics = out["metrics"]  # type: ignore[assignment]
        rows.append({
            "cycle": cycle,
            "q_total": q_total,
            "fatigue_in": fatigue,
            "disorder_in": disorder,
            "fidelity": m.fidelity,
            "epsilon_id_comp": m.epsilon_id_comp,
            "min_onepole_gap": m.min_onepole_gap,
            "tau_sw_min": m.tau_sw_min,
            "carrier_margin": m.carrier_margin,
            "hold_min_bind_margin": m.hold_min_bind_margin,
            "hold_mean_gamma": m.hold_mean_gamma,
            "hold_mean_topo_protection": m.hold_mean_topo_protection,
            "max_bound_support": m.max_bound_support,
            "mean_topo_support": m.mean_topo_support,
            "feasible": m.feasible,
        })
        fatigue, disorder = refresh_state(fatigue, disorder, m, p)
    return pd.DataFrame(rows)


def run_sweep(top_gap_values: List[float], tau_values: List[float], p: HardH1M2Params) -> pd.DataFrame:
    rows: List[Dict[str, float]] = []
    for top_gap in top_gap_values:
        for tau in tau_values:
            p_local = HardH1M2Params(**asdict(p))
            p_local.top_gap = top_gap
            p_local.tau_sw = tau
            out = simulate_cycle(p_local, fatigue=0.0, disorder=p_local.defect_noise0)
            m: H1M2Metrics = out["metrics"]  # type: ignore[assignment]
            rows.append({
                "top_gap": top_gap,
                "tau_sw": tau,
                "fidelity": m.fidelity,
                "epsilon_id_comp": m.epsilon_id_comp,
                "min_onepole_gap": m.min_onepole_gap,
                "tau_sw_min": m.tau_sw_min,
                "carrier_margin": m.carrier_margin,
                "hold_min_bind_margin": m.hold_min_bind_margin,
                "hold_mean_gamma": m.hold_mean_gamma,
                "hold_mean_topo_protection": m.hold_mean_topo_protection,
                "max_bound_support": m.max_bound_support,
                "mean_topo_support": m.mean_topo_support,
                "feasible": int(m.feasible),
            })
    return pd.DataFrame(rows)
