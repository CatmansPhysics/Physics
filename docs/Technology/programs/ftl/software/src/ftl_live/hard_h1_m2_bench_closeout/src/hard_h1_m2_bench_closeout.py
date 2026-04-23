
from __future__ import annotations
from dataclasses import dataclass, field, asdict
import pandas as pd
from src.hard_h1_m2 import HardH1M2Params, simulate_cycle, run_repeatability

@dataclass
class BenchCloseoutConfig:
    baseline_cycles: int = 256
    disorder_levels: tuple = (0.04, 0.06, 0.08)
    top_gap_values: tuple = (1.05, 1.10, 1.15)
    tau_values: tuple = (7.6, 8.0, 8.4)
    params: HardH1M2Params = field(default_factory=lambda: HardH1M2Params(
        top_gap=1.10,
        pin_strength=0.92,
        defect_noise0=0.06,
        disorder_growth_per_cycle=0.008,
        tau_sw=8.0,
        delta0=0.58,
        b0=1.08,
        bind_scale=0.10,
        refresh_strength=0.92,
        q_drift_per_cycle=0.004,
        fidelity_target=0.94,
        epsilon_comp_target=0.06,
        bind_margin_target=0.18,
        topo_support_target=0.70,
        protection_target=0.65,
    ))

def run_campaign(cfg: BenchCloseoutConfig) -> pd.DataFrame:
    rows=[]
    for disorder in cfg.disorder_levels:
        for top_gap in cfg.top_gap_values:
            for tau in cfg.tau_values:
                p = HardH1M2Params(**cfg.params.__dict__)
                p.top_gap = float(top_gap)
                p.tau_sw = float(tau)
                out = simulate_cycle(p, fatigue=0.0, disorder=float(disorder))
                m = out["metrics"]
                rows.append({
                    "disorder": disorder,
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
