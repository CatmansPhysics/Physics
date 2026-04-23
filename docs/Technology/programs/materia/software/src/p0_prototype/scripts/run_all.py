from __future__ import annotations

import json
import sys
from dataclasses import replace
from pathlib import Path

import matplotlib.pyplot as plt
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))
RESULTS = ROOT / "results"
RESULTS.mkdir(exist_ok=True, parents=True)

from p0.calibration import calibrate_q_star
from p0.calibration_states import manual_states
from p0.config import Config
from p0.escape import estimate_metastability
from p0.protocol import execute_run
from p0.observables import summarize_state
from p0.state import State


def save_plot(path: Path, title: str, xlabel: str, ylabel: str):
    plt.title(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.tight_layout()
    plt.savefig(path, dpi=160)
    plt.close()


def seed_library():
    return {
        "S0_IdealNucleus": State(frozenset({(6, 6), (6, 8), (8, 6), (8, 8)}), frozenset(), frozenset(), label="S0_IdealNucleus"),
        "S1_LineSeed": State(frozenset({(6, 6), (8, 6)}), frozenset(), frozenset(), label="S1_LineSeed"),
        "S2_DefectiveNucleus": State(frozenset({(6, 6), (6, 8), (8, 6)}), frozenset({(7, 7)}), frozenset(), label="S2_DefectiveNucleus"),
        "S3_BoundaryNucleus": State(frozenset({(4, 4), (4, 6), (6, 4)}), frozenset(), frozenset(), label="S3_BoundaryNucleus"),
    }


def calibration_phase(cfg: Config):
    good, bad = manual_states(cfg)
    order_negative_labels = [
        "DenseAmorphous",
        "OffLatticeDense",
        "MixedCrystalStrained",
        "UnderfilledIdeal",
        "GlassLikeNoisy",
        "FragmentedIslands",
    ]
    cal = calibrate_q_star(cfg, good, bad, order_negative_labels=order_negative_labels)
    rows = []
    for family, data in [("good", good), ("bad", bad)]:
        for label, st in data.items():
            row = summarize_state(cfg, st, q_star=cal.q_star)
            row["family"] = family
            rows.append(row)
    df = pd.DataFrame(rows)
    df.to_csv(RESULTS / "calibration_scores.csv", index=False)

    plt.figure(figsize=(8, 4))
    order = df.sort_values("Q", ascending=False)
    plt.bar(order["label"], order["Q"], color=["tab:green" if f == "good" else "tab:red" for f in order["family"]])
    plt.axhline(cal.q_star, color="black", linestyle="--", label=f"q*= {cal.q_star:.3f}")
    plt.xticks(rotation=70, ha="right")
    plt.legend()
    save_plot(RESULTS / "q_lambda_ranking.png", "Calibration ranking by Q_lambda", "state", "Q_lambda")

    plt.figure(figsize=(8, 4))
    orderf = df.sort_values("F_cryst")
    plt.bar(orderf["label"], orderf["F_cryst"], color=["tab:green" if f == "good" else "tab:red" for f in orderf["family"]])
    plt.xticks(rotation=70, ha="right")
    save_plot(RESULTS / "f_cryst_ranking.png", "Calibration ranking by F_cryst", "state", "F_cryst")

    meta = {
        "q_star": cal.q_star,
        "order_gap": cal.order_gap,
        "good_count": len(good),
        "bad_count": len(bad),
        "order_negative_labels": order_negative_labels,
    }
    (RESULTS / "calibration_meta.json").write_text(json.dumps(meta, indent=2))
    return good, bad, cal.q_star, df


def capacity_sweep(cfg: Config, q_star: float, seed: State):
    rows = []
    ratios = [0.5, 0.75, 0.9, 1.0, 1.1, 1.25, 1.5, 2.0]
    baseline_required = max(0, cfg.v_star - len(seed.ideal)) + cfg.l_res
    for ratio in ratios:
        units = int(round(ratio * baseline_required))
        result = execute_run(cfg, seed, units, q_star)
        row = result.metrics.copy()
        row["capacity_ratio"] = ratio
        rows.append(row)
    df = pd.DataFrame(rows)
    df.to_csv(RESULTS / "capacity_sweep.csv", index=False)

    verdict_map = {"FAIL_RESERVOIR":0, "FAIL_GROWTH":1, "GLASS_CAPTURE":2, "SOFT_SUCCESS":3, "HARD_SUCCESS":4}
    plt.figure(figsize=(7,4))
    plt.plot(df["capacity_ratio"], df["V"], marker="o", label="final V")
    plt.axhline(cfg.v_star, linestyle="--", color="black", label="V*")
    plt.legend()
    save_plot(RESULTS / "capacity_volume_plot.png", "Capacity sweep: final target volume", "capacity ratio", "V(X_N)")

    plt.figure(figsize=(7,4))
    plt.scatter(df["capacity_ratio"], [verdict_map[v] for v in df["verdict"]], c="tab:blue")
    plt.yticks(list(verdict_map.values()), list(verdict_map.keys()))
    save_plot(RESULTS / "capacity_verdict_plot.png", "Capacity sweep verdicts", "capacity ratio", "verdict")
    return df


def compatibility_sweep(base_cfg: Config, q_star: float, seeds: dict, reservoir_units: int):
    rows = []
    mu_values = [1.0, 1.5, 2.0, 2.5, 3.0, 4.0]
    delta_values = [0.02, 0.05, 0.08, 0.12, 0.2, 0.3, 0.5]
    # Use ideal nucleus and defective nucleus to expose both crystalline success and glass capture.
    selected = [seeds["S0_IdealNucleus"], seeds["S2_DefectiveNucleus"]]
    for seed in selected:
        for mu in mu_values:
            for delta in delta_values:
                cfg = replace(base_cfg, mu_star=mu, delta_star=delta)
                result = execute_run(cfg, seed, reservoir_units, q_star)
                row = result.metrics.copy()
                row["seed_name"] = seed.label
                rows.append(row)
    df = pd.DataFrame(rows)
    df.to_csv(RESULTS / "compatibility_sweep.csv", index=False)

    verdict_num = {"FAIL_RESERVOIR":0, "FAIL_GROWTH":1, "GLASS_CAPTURE":2, "SOFT_SUCCESS":3, "HARD_SUCCESS":4}
    seed0 = df[df["seed_name"] == "S0_IdealNucleus"]
    pivot = seed0.pivot(index="delta_star", columns="mu_star", values="verdict").replace(verdict_num)
    plt.figure(figsize=(8,5))
    plt.imshow(pivot.values, aspect="auto", origin="lower")
    plt.colorbar(label="verdict class code")
    plt.xticks(range(len(pivot.columns)), [f"{x:.2f}" for x in pivot.columns])
    plt.yticks(range(len(pivot.index)), [f"{y:.2f}" for y in pivot.index])
    save_plot(RESULTS / "compatibility_phase_map_seed0.png", "Compatibility phase map (S0 ideal nucleus)", "mu_star", "delta_star")

    seed2 = df[df["seed_name"] == "S2_DefectiveNucleus"]
    pivot2 = seed2.pivot(index="delta_star", columns="mu_star", values="verdict").replace(verdict_num)
    plt.figure(figsize=(8,5))
    plt.imshow(pivot2.values, aspect="auto", origin="lower")
    plt.colorbar(label="verdict class code")
    plt.xticks(range(len(pivot2.columns)), [f"{x:.2f}" for x in pivot2.columns])
    plt.yticks(range(len(pivot2.index)), [f"{y:.2f}" for y in pivot2.index])
    save_plot(RESULTS / "compatibility_phase_map_seed2.png", "Compatibility phase map (S2 defective nucleus)", "mu_star", "delta_star")

    plt.figure(figsize=(7,5))
    colors = df["seed_name"].map({"S0_IdealNucleus": "tab:blue", "S2_DefectiveNucleus": "tab:orange"})
    plt.scatter(df["Q"], df["d"], c=colors)
    plt.axvline(q_star, linestyle="--", color="black")
    plt.axhline(base_cfg.eps_o, linestyle="--", color="red")
    save_plot(RESULTS / "order_vs_defect_scatter.png", "Order vs defect after compatibility sweep", "Q_lambda", "d(X_N)")
    return df


def metastability_sweep(base_cfg: Config, q_star: float, seed: State, reservoir_units: int):
    rows = []
    baseline = execute_run(base_cfg, seed, reservoir_units, q_star)
    candidate = baseline.growth.final_state
    betas = [0.5, 1.0, 1.5, 2.0, 3.0, 5.0]
    for beta in betas:
        cfg = replace(base_cfg, beta=beta)
        esc = estimate_metastability(cfg, candidate, q_star)
        metrics = summarize_state(cfg, candidate, q_star)
        metrics.update({
            "beta": beta,
            "barrier": esc.barrier,
            "escape_rate": esc.escape_rate,
            "tau_meta": esc.tau_meta,
            "escape_prob": esc.escape_prob,
            "local_minimum": esc.local_minimum,
            "verdict": "HARD_SUCCESS" if esc.escape_prob <= cfg.delta_rel and esc.local_minimum else "SOFT_SUCCESS",
        })
        rows.append(metrics)
    df = pd.DataFrame(rows)
    df.to_csv(RESULTS / "metastability_sweep.csv", index=False)

    plt.figure(figsize=(7,4))
    plt.plot(df["beta"], df["escape_prob"], marker="o")
    plt.axhline(base_cfg.delta_rel, linestyle="--", color="red", label="delta_rel")
    plt.legend()
    save_plot(RESULTS / "metastability_escape_prob.png", "Metastability sweep", "beta", "escape probability on tau_o")
    return df, candidate


def verdict_atlas(base_cfg: Config, q_star: float, seeds: dict):
    selected = [seeds["S0_IdealNucleus"], seeds["S2_DefectiveNucleus"], seeds["S3_BoundaryNucleus"]]
    mu_values = [1.5, 2.5, 3.0, 4.0]
    beta_values = [1.0, 2.0, 4.0]
    capacity_values = [0.9, 1.1, 1.5]
    rows = []
    for seed in selected:
        baseline_required = max(0, base_cfg.v_star - len(seed.ideal)) + base_cfg.l_res
        for mu in mu_values:
            for beta in beta_values:
                for cr in capacity_values:
                    cfg = replace(base_cfg, mu_star=mu, beta=beta)
                    units = int(round(cr * baseline_required))
                    result = execute_run(cfg, seed, units, q_star)
                    row = result.metrics.copy()
                    row.update({"seed_name": seed.label, "capacity_ratio": cr})
                    rows.append(row)
    df = pd.DataFrame(rows)
    df.to_csv(RESULTS / "verdict_atlas.csv", index=False)
    return df


def make_summary(q_star: float, calibration_df: pd.DataFrame, capacity_df: pd.DataFrame, compatibility_df: pd.DataFrame, metastability_df: pd.DataFrame, atlas_df: pd.DataFrame):
    verdict_counts = atlas_df["verdict"].value_counts().to_dict()
    summary = f"""# P0 Summary Report

## Calibration
- q_star = {q_star:.4f}
- calibration states = {len(calibration_df)}
- best good F_cryst = {calibration_df[calibration_df['family']=='good']['F_cryst'].min():.4f}
- worst good F_cryst = {calibration_df[calibration_df['family']=='good']['F_cryst'].max():.4f}
- best bad F_cryst = {calibration_df[calibration_df['family']=='bad']['F_cryst'].min():.4f}
- worst bad F_cryst = {calibration_df[calibration_df['family']=='bad']['F_cryst'].max():.4f}

## Capacity sweep (seed S0)
- verdicts = {capacity_df['verdict'].value_counts().to_dict()}

## Compatibility sweep (S0 + S2)
- verdicts = {compatibility_df['verdict'].value_counts().to_dict()}
- mean Q = {compatibility_df['Q'].mean():.4f}
- mean d = {compatibility_df['d'].mean():.4f}

## Metastability sweep
- barriers = {metastability_df['barrier'].round(4).tolist()}
- escape probabilities = {metastability_df['escape_prob'].round(4).tolist()}

## Verdict atlas
- verdict counts = {verdict_counts}

## Interpretation
The computational prototype differentiates between reservoir failure, growth failure, glass-like capture,
soft completion, and hard completion using the calibrated lower theorem chain.
"""
    (RESULTS / "summary_report.md").write_text(summary)


def main():
    base_cfg = Config(mu_star=3.0, delta_star=0.3, beta=3.0)
    _good, _bad, q_star, calibration_df = calibration_phase(base_cfg)
    seeds = seed_library()
    seed = seeds["S0_IdealNucleus"]
    capacity_df = capacity_sweep(base_cfg, q_star, seed)
    capacity_units = int(round(1.5 * (max(0, base_cfg.v_star - len(seed.ideal)) + base_cfg.l_res)))
    compatibility_df = compatibility_sweep(base_cfg, q_star, seeds, reservoir_units=capacity_units)
    metastability_df, candidate = metastability_sweep(base_cfg, q_star, seed, reservoir_units=capacity_units)
    atlas_df = verdict_atlas(base_cfg, q_star, seeds)
    make_summary(q_star, calibration_df, capacity_df, compatibility_df, metastability_df, atlas_df)
    print("Done. Results written to", RESULTS)


if __name__ == "__main__":
    main()
