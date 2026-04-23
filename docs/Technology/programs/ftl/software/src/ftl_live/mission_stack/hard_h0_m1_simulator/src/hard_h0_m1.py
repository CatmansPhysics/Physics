
from __future__ import annotations

from dataclasses import dataclass, asdict
from typing import Dict, List, Tuple
import json
import math
import numpy as np
import pandas as pd


@dataclass
class HardH0M1Params:
    """Medium-specific H0 simulator for a paired / gapped carrier medium."""
    m: float = 1.0
    c_l: float = 1.0
    delta: float = 0.25
    v_c: float = 1.38
    kappa: float = 0.42
    pair_gap: float = 0.55
    gamma_qp: float = 0.015
    q0: float = 1.80
    tau_sw: float = 4.8
    tau_hold: float = 2.4
    dt: float = 2e-3
    alpha_ad_target: float = 1.6
    refresh_strength: float = 0.78
    fatigue_per_cycle: float = 0.030
    gap_decay_per_fatigue: float = 0.12
    linewidth_growth_per_fatigue: float = 1.15
    q_drift_per_cycle: float = 0.008
    dephase_floor: float = 0.004

    def validate(self) -> None:
        if self.m <= 0 or self.c_l <= 0 or self.v_c <= 0:
            raise ValueError('m, c_l, v_c must be positive')
        if self.kappa <= 0 or self.pair_gap <= 0:
            raise ValueError('kappa and pair_gap must be positive')
        if self.gamma_qp < 0:
            raise ValueError('gamma_qp must be non-negative')
        if self.tau_sw <= 0 or self.tau_hold < 0 or self.dt <= 0:
            raise ValueError('tau_sw, tau_hold, dt must be positive/non-negative')
        if self.alpha_ad_target <= 0:
            raise ValueError('alpha_ad_target must be positive')
        if not (0 <= self.refresh_strength <= 1):
            raise ValueError('refresh_strength must be in [0,1]')
        if self.fatigue_per_cycle < 0 or self.gap_decay_per_fatigue < 0 or self.linewidth_growth_per_fatigue < 0:
            raise ValueError('fatigue/gap/linewidth parameters must be non-negative')


@dataclass
class CycleMetrics:
    fidelity: float
    epsilon_id_1p: float
    min_gap: float
    min_gap_eff: float
    tau_sw_min: float
    a_max: float
    carrier_margin: float
    mean_linewidth_hold: float
    min_branch_support: float
    max_carrier_weight: float
    end_fatigue: float


def e_l(q: float, m: float, c_l: float) -> float:
    return math.sqrt(m*m + (c_l*q)**2)


def e_c(q: float, delta: float, v_c: float, pair_gap_eff: float) -> float:
    return delta + v_c*abs(q) - pair_gap_eff


def lambda_schedule(t: float, tau_sw: float, tau_hold: float) -> float:
    total = 2.0*tau_sw + tau_hold
    if t < 0: return 0.0
    if t < tau_sw: return t/tau_sw
    if t < tau_sw + tau_hold: return 1.0
    if t < total: return 1.0 - (t - (tau_sw+tau_hold))/tau_sw
    return 0.0


def effective_pair_gap(lam: float, fatigue: float, p: HardH0M1Params) -> float:
    return p.pair_gap * lam * math.exp(-p.gap_decay_per_fatigue * fatigue)


def effective_linewidth(lam: float, fatigue: float, p: HardH0M1Params) -> float:
    return p.gamma_qp * (1.0 + p.linewidth_growth_per_fatigue * fatigue) * (0.35 + 0.65*lam)


def h_matrix(q: float, lam: float, fatigue: float, p: HardH0M1Params) -> np.ndarray:
    gp = effective_pair_gap(lam, fatigue, p)
    return np.array([
        [e_l(q, p.m, p.c_l), -lam * p.kappa],
        [-lam * p.kappa, e_c(q, p.delta, p.v_c, gp)],
    ], dtype=float)


def unitary_step(h: np.ndarray, dt: float) -> np.ndarray:
    eigvals, eigvecs = np.linalg.eigh(h)
    return eigvecs @ np.diag(np.exp(-1j * eigvals * dt)) @ eigvecs.conj().T


def branch_energies(q: float, lam: float, fatigue: float, p: HardH0M1Params) -> Tuple[float, float]:
    vals, _ = np.linalg.eigh(h_matrix(q, lam, fatigue, p))
    return float(vals[0]), float(vals[1])


def selected_branch_energy(q: float, lam: float, fatigue: float, p: HardH0M1Params, branch: str = 'upper') -> float:
    lo, hi = branch_energies(q, lam, fatigue, p)
    return hi if branch == 'upper' else lo


def numerical_derivative_selected_branch(q: float, lam: float, fatigue: float, p: HardH0M1Params, eps: float = 1e-5) -> float:
    return (
        selected_branch_energy(q+eps, lam, fatigue, p) - selected_branch_energy(q-eps, lam, fatigue, p)
    ) / (2.0 * eps)


def min_gap_over_window(q: float, fatigue: float, p: HardH0M1Params, n_lam: int = 801) -> float:
    gaps = []
    for lam in np.linspace(0, 1, n_lam):
        lo, hi = branch_energies(q, float(lam), fatigue, p)
        gaps.append(hi-lo)
    return float(min(gaps))


def adiabatic_score_max(q: float, fatigue: float, p: HardH0M1Params) -> float:
    mg = min_gap_over_window(q, fatigue, p)
    if mg <= 0:
        return math.inf
    return (1.0/p.tau_sw) * p.kappa / (mg**2)


def tau_sw_min(q: float, fatigue: float, p: HardH0M1Params) -> float:
    mg = min_gap_over_window(q, fatigue, p)
    if mg <= 0:
        return math.inf
    return p.kappa / (p.alpha_ad_target * (mg**2))


def dephase_density(rho: np.ndarray, gamma: float, dt: float, floor: float) -> np.ndarray:
    damp = math.exp(-(gamma + floor) * dt)
    out = np.array(rho, dtype=complex)
    out[0,1] *= damp
    out[1,0] *= damp
    out = out / np.trace(out)
    return out


def run_single_cycle(rho0: np.ndarray, q: float, fatigue0: float, p: HardH0M1Params) -> Dict[str, object]:
    p.validate()
    total_time = 2.0 * p.tau_sw + p.tau_hold
    n_steps = int(total_time / p.dt) + 1
    times = np.linspace(0.0, total_time, n_steps)
    rho = np.array(rho0, dtype=complex)
    e0 = np.array([1.0, 0.0], dtype=complex)
    prev_vec = None

    lambdas: List[float] = []
    gaps: List[float] = []
    gaps_eff: List[float] = []
    tracked_population: List[float] = []
    carrier_weights: List[float] = []
    linewidths: List[float] = []
    fatigues: List[float] = []

    fatigue = fatigue0
    hold_linewidths: List[float] = []

    for i, t in enumerate(times):
        lam = lambda_schedule(float(t), p.tau_sw, p.tau_hold)
        gp = effective_pair_gap(lam, fatigue, p)
        gamma = effective_linewidth(lam, fatigue, p)
        lambdas.append(lam)
        linewidths.append(gamma)
        fatigues.append(fatigue)

        vals, vecs = np.linalg.eigh(h_matrix(q, lam, fatigue, p))
        if prev_vec is None:
            idx = int(np.argmax(np.abs(vecs.conj().T @ e0) ** 2))
            tracked_vec = vecs[:, idx]
        else:
            idx = int(np.argmax(np.abs(vecs.conj().T @ prev_vec)))
            tracked_vec = vecs[:, idx]
        prev_vec = tracked_vec

        proj = np.outer(tracked_vec, tracked_vec.conj())
        tracked_population.append(float(np.real(np.trace(proj @ rho))))
        gap = float(vals[1] - vals[0])
        gaps.append(gap)
        gaps_eff.append(gap - gamma)
        carrier_weights.append(float(abs(tracked_vec[1]) ** 2))
        if lam > 0.999:
            hold_linewidths.append(gamma)

        if i < n_steps - 1:
            lam_mid = lambda_schedule(float(t + 0.5*p.dt), p.tau_sw, p.tau_hold)
            u = unitary_step(h_matrix(q, lam_mid, fatigue, p), p.dt)
            rho = u @ rho @ u.conj().T
            rho = rho / np.trace(rho)
            rho = dephase_density(rho, gamma, p.dt, p.dephase_floor)
            fatigue += p.fatigue_per_cycle * p.dt / max(total_time, 1e-12)

    fidelity = float(np.real(rho[0,0]))
    eps_id = 1.0 - fidelity
    min_gap = float(min(gaps))
    min_gap_eff = float(min(gaps_eff))
    tau_min = tau_sw_min(q, fatigue0, p)
    a_max = adiabatic_score_max(q, fatigue0, p)
    carrier_margin = float(abs(numerical_derivative_selected_branch(q, 1.0, fatigue, p)) - p.c_l)
    mean_linewidth_hold = float(np.mean(hold_linewidths)) if hold_linewidths else float(np.mean(linewidths))
    min_branch_support = float(min(tracked_population))
    max_carrier_weight = float(max(carrier_weights))

    return {
        'rho': rho,
        'times': np.array(times),
        'lambdas': np.array(lambdas),
        'gaps': np.array(gaps),
        'gaps_eff': np.array(gaps_eff),
        'tracked_population': np.array(tracked_population),
        'carrier_weights': np.array(carrier_weights),
        'linewidths': np.array(linewidths),
        'fatigues': np.array(fatigues),
        'metrics': CycleMetrics(
            fidelity=fidelity,
            epsilon_id_1p=eps_id,
            min_gap=min_gap,
            min_gap_eff=min_gap_eff,
            tau_sw_min=tau_min,
            a_max=a_max,
            carrier_margin=carrier_margin,
            mean_linewidth_hold=mean_linewidth_hold,
            min_branch_support=min_branch_support,
            max_carrier_weight=max_carrier_weight,
            end_fatigue=float(fatigue),
        )
    }


def refresh_map(rho: np.ndarray, fatigue: float, p: HardH0M1Params) -> Tuple[np.ndarray, float]:
    e0 = np.array([1.0, 0.0], dtype=complex)
    e0_proj = np.outer(e0, e0.conj())
    rho_new = (1.0 - p.refresh_strength) * rho + p.refresh_strength * e0_proj
    rho_new = np.array(rho_new, dtype=complex)
    rho_new[0,1] *= (1.0 - p.dephase_floor)
    rho_new[1,0] *= (1.0 - p.dephase_floor)
    rho_new = rho_new / np.trace(rho_new)
    fatigue_new = max(0.0, fatigue * (1.0 - p.refresh_strength) + p.fatigue_per_cycle)
    return rho_new, fatigue_new


def run_repeatability(n_cycles: int, p: HardH0M1Params) -> pd.DataFrame:
    p.validate()
    rho = np.array([[1.0, 0.0], [0.0, 0.0]], dtype=complex)
    fatigue = 0.0
    rows: List[Dict[str, float | int]] = []
    for cycle in range(1, n_cycles + 1):
        q = p.q0 + (cycle - 1) * p.q_drift_per_cycle
        out = run_single_cycle(rho, q=q, fatigue0=fatigue, p=p)
        m: CycleMetrics = out['metrics']  # type: ignore[assignment]
        rows.append({
            'cycle': cycle,
            'q': q,
            'fatigue_in': fatigue,
            'fidelity': m.fidelity,
            'epsilon_id_1p': m.epsilon_id_1p,
            'min_gap': m.min_gap,
            'min_gap_eff': m.min_gap_eff,
            'tau_sw_min': m.tau_sw_min,
            'a_max': m.a_max,
            'carrier_margin': m.carrier_margin,
            'mean_linewidth_hold': m.mean_linewidth_hold,
            'min_branch_support': m.min_branch_support,
            'max_carrier_weight': m.max_carrier_weight,
            'fatigue_out_pre_refresh': m.end_fatigue,
        })
        rho, fatigue = refresh_map(out['rho'], m.end_fatigue, p)  # type: ignore[arg-type]
    return pd.DataFrame(rows)


def run_sweep(gap_values: List[float], tau_values: List[float], p: HardH0M1Params) -> pd.DataFrame:
    rows: List[Dict[str, float]] = []
    rho0 = np.array([[1.0, 0.0],[0.0, 0.0]], dtype=complex)
    for pair_gap in gap_values:
        for tau in tau_values:
            p_local = HardH0M1Params(**asdict(p))
            p_local.pair_gap = pair_gap
            p_local.tau_sw = tau
            out = run_single_cycle(rho0, q=p_local.q0, fatigue0=0.0, p=p_local)
            m: CycleMetrics = out['metrics']  # type: ignore[assignment]
            feasible = int(
                (m.carrier_margin > 0.0) and
                (m.min_gap_eff > 0.0) and
                (m.fidelity >= 0.995) and
                (tau >= m.tau_sw_min)
            )
            rows.append({
                'pair_gap': pair_gap,
                'tau_sw': tau,
                'fidelity': m.fidelity,
                'epsilon_id_1p': m.epsilon_id_1p,
                'min_gap': m.min_gap,
                'min_gap_eff': m.min_gap_eff,
                'tau_sw_min': m.tau_sw_min,
                'a_max': m.a_max,
                'carrier_margin': m.carrier_margin,
                'mean_linewidth_hold': m.mean_linewidth_hold,
                'min_branch_support': m.min_branch_support,
                'max_carrier_weight': m.max_carrier_weight,
                'feasible': feasible,
            })
    return pd.DataFrame(rows)


def save_json(path: str, obj: Dict[str, object]) -> None:
    with open(path, 'w', encoding='utf-8') as f:
        json.dump(obj, f, indent=2)
