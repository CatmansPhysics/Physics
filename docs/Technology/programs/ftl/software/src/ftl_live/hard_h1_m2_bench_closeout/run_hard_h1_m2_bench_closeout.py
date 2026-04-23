
from __future__ import annotations
import json
from pathlib import Path
import os
os.environ.setdefault("MPLCONFIGDIR", "/tmp/mplconfig_hard_closeout")

import sys
sys.path.insert(0, str((Path(__file__).resolve().parent / "src")))
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import pandas as pd

from src.hard_h1_m2 import simulate_cycle, run_repeatability
from src.hard_h1_m2_bench_closeout import BenchCloseoutConfig, run_campaign

def main():
    root = Path(__file__).resolve().parent
    results = root / "results"
    results.mkdir(exist_ok=True)

    cfg = BenchCloseoutConfig()
    baseline = simulate_cycle(cfg.params, fatigue=0.0, disorder=cfg.params.defect_noise0)
    m = baseline["metrics"]
    baseline_summary = pd.DataFrame([{
        "baseline_fidelity": m.fidelity,
        "baseline_epsilon_id_comp": m.epsilon_id_comp,
        "baseline_min_onepole_gap": m.min_onepole_gap,
        "baseline_tau_sw_min": m.tau_sw_min,
        "baseline_carrier_margin": m.carrier_margin,
        "baseline_hold_min_bind_margin": m.hold_min_bind_margin,
        "baseline_hold_mean_gamma": m.hold_mean_gamma,
        "baseline_hold_mean_topo_protection": m.hold_mean_topo_protection,
        "baseline_max_bound_support": m.max_bound_support,
        "baseline_mean_topo_support": m.mean_topo_support,
        "baseline_feasible": bool(m.feasible > 0.5),
    }])
    baseline_summary.to_csv(results / "baseline_summary.csv", index=False)
    with open(results / "baseline_summary.json", "w", encoding="utf-8") as f:
        json.dump(baseline_summary.iloc[0].to_dict(), f, indent=2)

    repeatability = run_repeatability(cfg.baseline_cycles, cfg.params)
    repeatability.to_csv(results / "repeatability.csv", index=False)
    rep_summary = pd.DataFrame([{
        "repeatability_cycles": cfg.baseline_cycles,
        "repeatability_success_rate": float((repeatability["feasible"] > 0.5).mean()),
        "repeatability_min_fidelity": float(repeatability["fidelity"].min()),
        "repeatability_min_bind_margin": float(repeatability["hold_min_bind_margin"].min()),
        "repeatability_min_topo_protection": float(repeatability["hold_mean_topo_protection"].min()),
    }])
    rep_summary.to_csv(results / "repeatability_summary.csv", index=False)

    campaign = run_campaign(cfg)
    campaign.to_csv(results / "disorder_topology_sweep.csv", index=False)

    summary = pd.DataFrame([{
        "baseline_fidelity": float(m.fidelity),
        "repeatability_success_rate": float((repeatability["feasible"] > 0.5).mean()),
        "repeatability_min_fidelity": float(repeatability["fidelity"].min()),
        "min_binding_margin": float(repeatability["hold_min_bind_margin"].min()),
        "min_topological_protection": float(repeatability["hold_mean_topo_protection"].min()),
        "robustness_feasible_fraction": float(campaign["feasible"].mean()),
        "stage3_closeout_ready": bool(
            float(m.fidelity) >= 0.95
            and float((repeatability["feasible"] > 0.5).mean()) >= 0.95
            and float(repeatability["hold_min_bind_margin"].min()) > 0.40
            and float(repeatability["hold_mean_topo_protection"].min()) > 0.70
            and float(campaign["feasible"].mean()) >= 0.90
        ),
    }])
    summary.to_csv(results / "summary.csv", index=False)
    with open(results / "summary.json", "w", encoding="utf-8") as f:
        json.dump(summary.iloc[0].to_dict(), f, indent=2)

    plt.figure(figsize=(8,4.5))
    plt.plot(repeatability["cycle"], repeatability["fidelity"], label="fidelity")
    plt.plot(repeatability["cycle"], repeatability["hold_min_bind_margin"], label="bind margin")
    plt.axhline(0.95, color="red", linestyle="--", label="fidelity target")
    plt.axhline(0.40, color="purple", linestyle="--", label="bind target")
    plt.xlabel("cycle")
    plt.legend()
    plt.tight_layout()
    plt.savefig(results / "repeatability_closeout.png", dpi=150)
    plt.close()

    piv = campaign.groupby(["top_gap","tau_sw"], as_index=False)["fidelity"].mean().pivot(index="top_gap", columns="tau_sw", values="fidelity")
    plt.figure(figsize=(6,4.5))
    plt.imshow(piv.values, aspect="auto", origin="lower")
    plt.xticks(range(len(piv.columns)), [f"{x:.1f}" for x in piv.columns])
    plt.yticks(range(len(piv.index)), [f"{x:.2f}" for x in piv.index])
    plt.xlabel("tau_sw")
    plt.ylabel("top_gap")
    plt.colorbar(label="fidelity")
    plt.tight_layout()
    plt.savefig(results / "campaign_fidelity_heatmap.png", dpi=150)
    plt.close()

if __name__ == "__main__":
    main()
