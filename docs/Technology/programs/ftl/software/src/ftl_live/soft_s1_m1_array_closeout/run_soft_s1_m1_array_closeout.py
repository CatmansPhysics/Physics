
from __future__ import annotations
import json
from pathlib import Path
import os
os.environ.setdefault("MPLCONFIGDIR", "/tmp/mplconfig_soft_closeout")

import sys
sys.path.insert(0, str((Path(__file__).resolve().parent / "src")))
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import pandas as pd

from src.soft_s1_m1_array_closeout import ArrayCloseoutConfig, SoftS1M1ArrayCloseoutSimulator, run_sweep

def main():
    root = Path(__file__).resolve().parent
    results = root / "results"
    results.mkdir(exist_ok=True)

    cfg = ArrayCloseoutConfig()
    sim = SoftS1M1ArrayCloseoutSimulator(cfg)

    baseline = sim.run_cycles(cfg.baseline_cycles)
    longrun = sim.run_cycles(cfg.long_cycles)
    sweep = run_sweep(cfg)

    baseline.to_csv(results / "baseline_cycles.csv", index=False)
    longrun.to_csv(results / "long_repeatability.csv", index=False)
    sweep.to_csv(results / "sweep_summary.csv", index=False)

    summary = pd.DataFrame([{
        "rows": cfg.rows,
        "cols": cfg.cols,
        "baseline_cycles": cfg.baseline_cycles,
        "long_cycles": cfg.long_cycles,
        "baseline_mean_array_accuracy": float(baseline["array_accuracy"].mean()),
        "baseline_min_array_accuracy": float(baseline["array_accuracy"].min()),
        "baseline_max_failed_cell_fraction": float(baseline["failed_cell_fraction"].max()),
        "baseline_worst_margin": float(baseline["worst_margin"].min()),
        "long_mean_array_accuracy": float(longrun["array_accuracy"].mean()),
        "long_min_array_accuracy": float(longrun["array_accuracy"].min()),
        "long_max_failed_cell_fraction": float(longrun["failed_cell_fraction"].max()),
        "long_worst_margin": float(longrun["worst_margin"].min()),
        "memory_criterion_ok": bool(cfg.medium.tau_flip > 10.0 * cfg.medium.t_read),
        "glass_criterion_ok": bool(cfg.medium.tau_relax > 10.0 * cfg.medium.cycle_time),
        "sweep_feasible_fraction": float(sweep["feasible"].mean()),
        "stage2_closeout_ready": bool(
            float(longrun["array_accuracy"].mean()) >= 0.95
            and float(longrun["worst_margin"].min()) > 0.30
            and float(longrun["failed_cell_fraction"].max()) < 0.10
            and bool(cfg.medium.tau_flip > 10.0 * cfg.medium.t_read)
            and bool(cfg.medium.tau_relax > 10.0 * cfg.medium.cycle_time)
        )
    }])
    summary.to_csv(results / "summary.csv", index=False)
    with open(results / "summary.json", "w", encoding="utf-8") as f:
        json.dump(summary.iloc[0].to_dict(), f, indent=2)

    plt.figure(figsize=(8,4.5))
    plt.plot(baseline["cycle"], baseline["array_accuracy"], label="baseline accuracy")
    plt.plot(longrun["cycle"][:256], longrun["array_accuracy"][:256], label="long-run first 256", alpha=0.8)
    plt.axhline(0.95, color="red", linestyle="--", label="target")
    plt.xlabel("cycle")
    plt.ylabel("array_accuracy")
    plt.legend()
    plt.tight_layout()
    plt.savefig(results / "baseline_vs_long_accuracy.png", dpi=150)
    plt.close()

    piv = sweep.groupby(["heterogeneity","signal_contrast"], as_index=False)["mean_array_accuracy"].mean().pivot(index="heterogeneity", columns="signal_contrast", values="mean_array_accuracy")
    plt.figure(figsize=(6,4.5))
    plt.imshow(piv.values, aspect="auto", origin="lower")
    plt.xticks(range(len(piv.columns)), [f"{x:.1f}" for x in piv.columns])
    plt.yticks(range(len(piv.index)), [f"{x:.3f}" for x in piv.index])
    plt.xlabel("signal_contrast")
    plt.ylabel("heterogeneity")
    plt.colorbar(label="mean_array_accuracy")
    plt.tight_layout()
    plt.savefig(results / "sweep_accuracy_heatmap.png", dpi=150)
    plt.close()

if __name__ == "__main__":
    main()
