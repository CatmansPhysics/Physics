
from __future__ import annotations

import json
from pathlib import Path

import pandas as pd

from src.mission_scenario import MissionConfig, plot_sweep, plot_timeline, run_mission, run_mission_sweep, save_json

ROOT = Path(__file__).resolve().parent
RES = ROOT / "combined_results"
RES.mkdir(exist_ok=True)

cfg = MissionConfig()
out = run_mission(cfg)
cycles = out["cycles"]
route_summary = out["route_summary"]
summary = out["summary"]
readiness = out["readiness"]

cycles.to_csv(RES / "mission_cycles.csv", index=False)
route_summary.to_csv(RES / "mission_route_summary.csv", index=False)
summary.to_csv(RES / "mission_summary.csv", index=False)
readiness.to_csv(RES / "mission_readiness.csv", index=False)
save_json(RES / "mission_summary.json", summary.iloc[0].to_dict())

plot_timeline(cycles, RES / "mission_timeline.png")

sweep = run_mission_sweep(cfg)
sweep.to_csv(RES / "mission_sweep.csv", index=False)
plot_sweep(sweep, RES / "mission_sweep_heatmap.png")

portfolio = pd.DataFrame([
    {"metric": "mission_cycles", "value": int(summary.loc[0, "n_cycles"])},
    {"metric": "selection_accuracy", "value": float(summary.loc[0, "selection_accuracy"])},
    {"metric": "hard_execution_rate", "value": float(summary.loc[0, "hard_execution_rate"])},
    {"metric": "mission_successes", "value": int(summary.loc[0, "mission_successes"])},
    {"metric": "all_missions_successful", "value": int(bool(summary.loc[0, "all_missions_successful"]))},
    {"metric": "mean_soft_margin", "value": float(summary.loc[0, "mean_soft_margin"])},
    {"metric": "mean_confidence", "value": float(summary.loc[0, "mean_confidence"])},
    {"metric": "mean_hard_fidelity", "value": float(summary.loc[0, "mean_hard_fidelity"])},
    {"metric": "min_hard_fidelity", "value": float(summary.loc[0, "min_hard_fidelity"])},
    {"metric": "min_bind_margin", "value": float(summary.loc[0, "min_bind_margin"])},
    {"metric": "min_topo_protection", "value": float(summary.loc[0, "min_topo_protection"])},
    {"metric": "mean_readiness", "value": float(summary.loc[0, "mean_readiness"])},
    {"metric": "sweep_total_points", "value": int(len(sweep))},
    {"metric": "sweep_all_successful_points", "value": int(sweep["all_missions_successful"].sum())},
    {"metric": "sweep_best_mean_readiness", "value": float(sweep["mean_readiness"].max())},
])
portfolio.to_csv(RES / "portfolio_summary.csv", index=False)
save_json(RES / "portfolio_summary.json", {r.metric: float(r.value) for r in portfolio.itertuples(index=False)})

readiness_summary = pd.DataFrame([
    {"check": "mission_layer_ready", "passed": bool(readiness["passed"].all()), "value": int(readiness["passed"].sum()), "threshold": len(readiness)},
    {"check": "ready_for_window_portfolio", "passed": bool(summary.loc[0, "mean_readiness"] >= 0.95), "value": float(summary.loc[0, "mean_readiness"]), "threshold": 0.95},
])
readiness_summary.to_csv(RES / "readiness_summary.csv", index=False)
