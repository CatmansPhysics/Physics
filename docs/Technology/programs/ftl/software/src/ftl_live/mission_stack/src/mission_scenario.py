
from __future__ import annotations

from dataclasses import dataclass, asdict
from pathlib import Path
from typing import Dict, List
import json
import math
import sys

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
SOFT_PATH = ROOT / "soft_s0_m1_simulator"
H1_PATH = ROOT / "hard_h1_m2_simulator"

import importlib.util


def _load_module(name: str, file_path: Path):
    spec = importlib.util.spec_from_file_location(name, file_path)
    if spec is None or spec.loader is None:
        raise ImportError(f'Cannot load module {name} from {file_path}')
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


_soft_mod = _load_module('soft_s0_m1_module', SOFT_PATH / 'src' / 'soft_s0_m1.py')
_h1_mod = _load_module('hard_h1_m2_module', H1_PATH / 'src' / 'hard_h1_m2.py')

SoftS0M1Config = _soft_mod.SoftS0M1Config
SoftS0M1Simulator = _soft_mod.SoftS0M1Simulator
HardH1M2Params = _h1_mod.HardH1M2Params
simulate_cycle = _h1_mod.simulate_cycle
refresh_state = _h1_mod.refresh_state


def save_json(path: str | Path, obj: Dict) -> None:
    with open(path, "w", encoding="utf-8") as f:
        json.dump(obj, f, ensure_ascii=False, indent=2)


@dataclass
class MissionConfig:
    n_cycles: int = 16
    confidence_scale: float = 0.90
    confidence_threshold: float = 0.55
    prep_time_factor: float = 4.0
    safe_q: float = 1.95
    distant_q: float = 2.25
    safe_top_gap: float = 0.98
    distant_top_gap: float = 0.90
    safe_b0: float = 0.88
    distant_b0: float = 0.95
    q_conf_shift: float = 0.10
    tau_boost_safe: float = 0.50
    tau_boost_distant: float = 0.95
    mission_fidelity_target: float = 0.945
    readiness_bind_target: float = 0.42
    readiness_topo_target: float = 0.72


def confidence_from_margin(margin: float, scale: float) -> float:
    return max(0.0, min(1.0, margin / max(scale, 1e-9)))


def mission_window(bit: int, cfg: MissionConfig) -> Dict[str, float | str]:
    if bit == 0:
        return {
            "window_name": "SAFE_WINDOW",
            "q_total": cfg.safe_q,
            "top_gap": cfg.safe_top_gap,
            "b0": cfg.safe_b0,
            "tau_boost": cfg.tau_boost_safe,
        }
    return {
        "window_name": "DISTANT_WINDOW",
        "q_total": cfg.distant_q,
        "top_gap": cfg.distant_top_gap,
        "b0": cfg.distant_b0,
        "tau_boost": cfg.tau_boost_distant,
    }


def readiness_score(confidence: float, fidelity: float, bind_margin: float, topo_protection: float, cfg: MissionConfig) -> float:
    c = max(0.0, min(1.0, confidence))
    f = max(0.0, min(1.0, fidelity / max(cfg.mission_fidelity_target, 1e-9)))
    b = max(0.0, min(1.0, bind_margin / max(cfg.readiness_bind_target, 1e-9)))
    t = max(0.0, min(1.0, topo_protection / max(cfg.readiness_topo_target, 1e-9)))
    return 0.25 * (c + f + b + t)


def run_mission(cfg: MissionConfig) -> Dict[str, pd.DataFrame]:
    soft_cfg = SoftS0M1Config(n_cycles=cfg.n_cycles)
    soft_sim = SoftS0M1Simulator(soft_cfg)
    soft_out = soft_sim.run()
    soft_cycles = soft_out["cycles"].copy()

    p_h1_base = HardH1M2Params()
    fatigue = 0.0
    disorder = p_h1_base.defect_noise0

    rows: List[Dict[str, float | int | str | bool]] = []

    for row in soft_cycles.itertuples(index=False):
        soft_margin = float(row.margin)
        confidence = confidence_from_margin(soft_margin, cfg.confidence_scale)
        soft_success = bool(row.cycle_success)
        soft_correct = int(row.exported_bit) == int(row.hidden_bit)
        policy_ok = confidence >= cfg.confidence_threshold

        win = mission_window(int(row.exported_bit), cfg)
        p = HardH1M2Params(**asdict(p_h1_base))
        p.top_gap = float(win["top_gap"])
        p.b0 = float(win["b0"])
        p.q_total0 = float(win["q_total"]) + cfg.q_conf_shift * (2.0 * confidence - 1.0)
        p.tau_sw = p_h1_base.tau_sw + float(win["tau_boost"]) * (1.0 - confidence)

        prep_ok = soft_cfg.tau_flip > cfg.prep_time_factor * p.tau_sw
        execute_hard = soft_success and soft_correct and policy_ok and prep_ok

        if execute_hard:
            out = simulate_cycle(p, q_total=p.q_total0, fatigue=fatigue, disorder=disorder)
            m = out["metrics"]
            hard_feasible = bool(m.feasible > 0.5)
            binding_safe = bool(m.hold_min_bind_margin >= cfg.readiness_bind_target)
            topo_safe = bool(m.hold_mean_topo_protection >= cfg.readiness_topo_target)
            mission_success = bool(hard_feasible and binding_safe and topo_safe and m.fidelity >= cfg.mission_fidelity_target)
            rscore = readiness_score(confidence, float(m.fidelity), float(m.hold_min_bind_margin), float(m.hold_mean_topo_protection), cfg)
            fatigue, disorder = refresh_state(fatigue, disorder, m, p)

            rows.append({
                "cycle": int(row.cycle),
                "hidden_bit": int(row.hidden_bit),
                "exported_bit": int(row.exported_bit),
                "soft_margin": soft_margin,
                "soft_success": soft_success,
                "soft_correct": soft_correct,
                "confidence": confidence,
                "policy_ok": policy_ok,
                "window_name": str(win["window_name"]),
                "prep_ok": prep_ok,
                "hard_executed": True,
                "q_total": p.q_total0,
                "tau_sw": p.tau_sw,
                "tau_sw_min": float(m.tau_sw_min),
                "hard_fidelity": float(m.fidelity),
                "hard_epsilon": float(m.epsilon_id_comp),
                "bind_margin": float(m.hold_min_bind_margin),
                "topo_protection": float(m.hold_mean_topo_protection),
                "carrier_margin": float(m.carrier_margin),
                "hard_feasible": hard_feasible,
                "binding_safe": binding_safe,
                "topo_safe": topo_safe,
                "mission_readiness": rscore,
                "mission_success": mission_success,
                "fatigue_post": fatigue,
                "disorder_post": disorder,
            })
        else:
            # no hard execution; mission fails early but medium remains unchanged except mild waiting drift
            rows.append({
                "cycle": int(row.cycle),
                "hidden_bit": int(row.hidden_bit),
                "exported_bit": int(row.exported_bit),
                "soft_margin": soft_margin,
                "soft_success": soft_success,
                "soft_correct": soft_correct,
                "confidence": confidence,
                "policy_ok": policy_ok,
                "window_name": str(win["window_name"]),
                "prep_ok": prep_ok,
                "hard_executed": False,
                "q_total": float(win["q_total"]),
                "tau_sw": p_h1_base.tau_sw,
                "tau_sw_min": float('nan'),
                "hard_fidelity": 0.0,
                "hard_epsilon": 1.0,
                "bind_margin": 0.0,
                "topo_protection": 0.0,
                "carrier_margin": 0.0,
                "hard_feasible": False,
                "binding_safe": False,
                "topo_safe": False,
                "mission_readiness": 0.25 * confidence,
                "mission_success": False,
                "fatigue_post": fatigue,
                "disorder_post": disorder,
            })

    cycles_df = pd.DataFrame(rows)
    route_summary = cycles_df.groupby("window_name", as_index=False).agg(
        cycles=("cycle", "count"),
        executed=("hard_executed", "sum"),
        successes=("mission_success", "sum"),
        mean_confidence=("confidence", "mean"),
        mean_hard_fidelity=("hard_fidelity", "mean"),
        min_bind_margin=("bind_margin", "min"),
        mean_readiness=("mission_readiness", "mean"),
    )
    summary_df = pd.DataFrame([{
        "n_cycles": int(cfg.n_cycles),
        "selection_accuracy": float(cycles_df["soft_correct"].mean()),
        "hard_execution_rate": float(cycles_df["hard_executed"].mean()),
        "mission_successes": int(cycles_df["mission_success"].sum()),
        "all_missions_successful": bool(cycles_df["mission_success"].all()),
        "mean_soft_margin": float(cycles_df["soft_margin"].mean()),
        "mean_confidence": float(cycles_df["confidence"].mean()),
        "mean_hard_fidelity": float(cycles_df.loc[cycles_df["hard_executed"], "hard_fidelity"].mean()),
        "min_hard_fidelity": float(cycles_df.loc[cycles_df["hard_executed"], "hard_fidelity"].min()),
        "min_bind_margin": float(cycles_df.loc[cycles_df["hard_executed"], "bind_margin"].min()),
        "min_topo_protection": float(cycles_df.loc[cycles_df["hard_executed"], "topo_protection"].min()),
        "mean_readiness": float(cycles_df["mission_readiness"].mean()),
    }])
    readiness_df = pd.DataFrame([
        {"check": "selection_accuracy_ok", "passed": bool(summary_df.loc[0, "selection_accuracy"] >= 1.0), "value": float(summary_df.loc[0, "selection_accuracy"]), "threshold": 1.0},
        {"check": "hard_execution_rate_ok", "passed": bool(summary_df.loc[0, "hard_execution_rate"] >= 1.0), "value": float(summary_df.loc[0, "hard_execution_rate"]), "threshold": 1.0},
        {"check": "hard_fidelity_ok", "passed": bool(summary_df.loc[0, "min_hard_fidelity"] >= cfg.mission_fidelity_target), "value": float(summary_df.loc[0, "min_hard_fidelity"]), "threshold": cfg.mission_fidelity_target},
        {"check": "binding_margin_ok", "passed": bool(summary_df.loc[0, "min_bind_margin"] >= cfg.readiness_bind_target), "value": float(summary_df.loc[0, "min_bind_margin"]), "threshold": cfg.readiness_bind_target},
        {"check": "topo_protection_ok", "passed": bool(summary_df.loc[0, "min_topo_protection"] >= cfg.readiness_topo_target), "value": float(summary_df.loc[0, "min_topo_protection"]), "threshold": cfg.readiness_topo_target},
        {"check": "mean_readiness_ok", "passed": bool(summary_df.loc[0, "mean_readiness"] >= 0.95), "value": float(summary_df.loc[0, "mean_readiness"]), "threshold": 0.95},
    ])
    return {"cycles": cycles_df, "route_summary": route_summary, "summary": summary_df, "readiness": readiness_df}



def run_mission_sweep(base: MissionConfig) -> pd.DataFrame:
    rows: List[Dict[str, float | bool]] = []
    conf_scales = [0.80, 0.90, 1.00]
    thresholds = [0.45, 0.55, 0.65]
    distant_qs = [2.15, 2.25, 2.35]
    for cs in conf_scales:
        for thr in thresholds:
            for dq in distant_qs:
                cfg = MissionConfig(**asdict(base))
                cfg.confidence_scale = cs
                cfg.confidence_threshold = thr
                cfg.distant_q = dq
                out = run_mission(cfg)
                s = out["summary"].iloc[0]
                rows.append({
                    "confidence_scale": cs,
                    "confidence_threshold": thr,
                    "distant_q": dq,
                    "selection_accuracy": float(s["selection_accuracy"]),
                    "hard_execution_rate": float(s["hard_execution_rate"]),
                    "mission_successes": int(s["mission_successes"]),
                    "all_missions_successful": bool(s["all_missions_successful"]),
                    "mean_hard_fidelity": float(s["mean_hard_fidelity"]),
                    "min_bind_margin": float(s["min_bind_margin"]),
                    "mean_readiness": float(s["mean_readiness"]),
                })
    return pd.DataFrame(rows)



def plot_timeline(cycles_df: pd.DataFrame, out_path: Path) -> None:
    fig, axes = plt.subplots(4, 1, figsize=(11, 12), sharex=True)
    window_map = {"SAFE_WINDOW": 0, "DISTANT_WINDOW": 1}
    axes[0].plot(cycles_df["cycle"], cycles_df["soft_margin"], marker="o", label="soft margin")
    axes[0].plot(cycles_df["cycle"], cycles_df["confidence"], marker="s", label="confidence")
    axes[0].legend(); axes[0].grid(alpha=0.3); axes[0].set_ylabel("soft")

    axes[1].step(cycles_df["cycle"], cycles_df["window_name"].map(window_map), where="mid")
    axes[1].set_yticks([0,1]); axes[1].set_yticklabels(["SAFE","DISTANT"])
    axes[1].grid(alpha=0.3); axes[1].set_ylabel("window")

    axes[2].plot(cycles_df["cycle"], cycles_df["hard_fidelity"], marker="o", label="hard fidelity")
    axes[2].plot(cycles_df["cycle"], cycles_df["bind_margin"], marker="^", label="bind margin")
    axes[2].plot(cycles_df["cycle"], cycles_df["topo_protection"], marker="d", label="topo protection")
    axes[2].legend(); axes[2].grid(alpha=0.3); axes[2].set_ylabel("hard")

    axes[3].plot(cycles_df["cycle"], cycles_df["mission_readiness"], marker="o", label="readiness")
    axes[3].plot(cycles_df["cycle"], cycles_df["mission_success"].astype(float), marker="s", label="mission success")
    axes[3].legend(); axes[3].grid(alpha=0.3); axes[3].set_ylabel("mission")
    axes[3].set_xlabel("cycle")
    fig.tight_layout()
    fig.savefig(out_path, dpi=160)
    plt.close(fig)



def plot_sweep(sweep_df: pd.DataFrame, out_path: Path) -> None:
    heat = sweep_df.groupby(["confidence_threshold", "distant_q"], as_index=False)["mean_readiness"].mean()
    pivot = heat.pivot(index="confidence_threshold", columns="distant_q", values="mean_readiness")
    fig, ax = plt.subplots(figsize=(8,5.5))
    im = ax.imshow(pivot.values, aspect="auto", origin="lower")
    ax.set_xticks(range(len(pivot.columns)))
    ax.set_xticklabels([f"{v:.2f}" for v in pivot.columns])
    ax.set_yticks(range(len(pivot.index)))
    ax.set_yticklabels([f"{v:.2f}" for v in pivot.index])
    ax.set_xlabel("distant_q")
    ax.set_ylabel("confidence_threshold")
    ax.set_title("mission mean readiness")
    fig.colorbar(im, ax=ax, label="mean readiness")
    fig.tight_layout()
    fig.savefig(out_path, dpi=160)
    plt.close(fig)
