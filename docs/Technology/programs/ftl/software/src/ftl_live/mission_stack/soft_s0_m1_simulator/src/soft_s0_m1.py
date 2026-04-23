
from __future__ import annotations

import argparse
import json
import math
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Dict, List

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


def normal_cdf(x: float) -> float:
    """Standard normal CDF using math.erf."""
    return 0.5 * (1.0 + math.erf(x / math.sqrt(2.0)))


@dataclass
class SoftS0M1Config:
    # Medium-specific parameters
    tau_flip: float = 35.0
    tau_relax: float = 35.0
    signal_contrast: float = 1.6
    read_noise: float = 0.22
    p_write: float = 0.99
    p_reset: float = 0.985

    # Fatigue model
    fatigue_per_cycle: float = 0.02
    fatigue_coupling_read: float = 0.11
    fatigue_coupling_write: float = 0.08
    fatigue_coupling_reset: float = 0.10
    fatigue_coupling_flip: float = 0.09

    # Timing / control
    t_read: float = 0.55
    t_hold: float = 0.9
    t_write: float = 0.12
    t_reset: float = 0.18
    n_samples: int = 96
    n_cycles: int = 32
    random_seed: int = 2

    @property
    def cycle_time(self) -> float:
        return self.t_read + self.t_hold + self.t_write + self.t_reset

    @property
    def relaxation_factor(self) -> float:
        return math.exp(-self.cycle_time / self.tau_relax)


@dataclass
class CycleMetrics:
    cycle: int
    hidden_bit: int
    xi_pre: float
    sigma_eff: float
    tau_flip_eff: float
    delta_med: float
    eta_read: float
    p_write_eff: float
    eta_write: float
    p_flip: float
    eta_flip: float
    p_reset_eff: float
    eta_reset: float
    eta_fatigue: float
    total_error: float
    margin: float
    classified_bit: int
    write_bit: int
    final_bit_after_hold: int
    exported_bit: int
    cycle_success: bool
    fidelity: float
    signal_mean: float
    signal_std: float
    xi_post: float


class SoftS0M1Simulator:
    """
    Medium-specific simulator for a glassy / chemical-memory binary witness cell.

    The cell has two metastable medium sectors X0/X1. Each cycle:
      1) selects a hidden bit,
      2) reads a noisy medium-dependent signal,
      3) writes to persistent memory with finite fidelity,
      4) holds the record while spontaneous flips can occur,
      5) resets imperfectly and accumulates fatigue.
    """

    def __init__(self, cfg: SoftS0M1Config):
        self.cfg = cfg
        self.rng = np.random.default_rng(cfg.random_seed)

    def effective_sigma(self, xi: float) -> float:
        return self.cfg.read_noise * (1.0 + self.cfg.fatigue_coupling_read * xi)

    def effective_tau_flip(self, xi: float) -> float:
        return self.cfg.tau_flip / (1.0 + self.cfg.fatigue_coupling_flip * xi)

    def effective_p_write(self, xi: float) -> float:
        return max(0.0, min(1.0, self.cfg.p_write * math.exp(-self.cfg.fatigue_coupling_write * xi)))

    def effective_p_reset(self, xi: float) -> float:
        return max(0.0, min(1.0, self.cfg.p_reset * math.exp(-self.cfg.fatigue_coupling_reset * xi)))

    def read_phase(self, hidden_bit: int, sigma_eff: float) -> Dict[str, float]:
        # Symmetric signals around zero for optimal threshold detection
        s0 = -0.5 * self.cfg.signal_contrast
        s1 = +0.5 * self.cfg.signal_contrast
        mean = s1 if hidden_bit == 1 else s0
        sample_sigma = sigma_eff
        samples = self.rng.normal(loc=mean, scale=sample_sigma, size=self.cfg.n_samples)
        avg_signal = float(samples.mean())
        classified_bit = int(avg_signal > 0.0)

        # Theoretical read error for the sample mean under optimal threshold
        sigma_mean = sample_sigma / math.sqrt(self.cfg.n_samples)
        z = abs(mean) / max(sigma_mean, 1e-12)
        eta_read = 1.0 - normal_cdf(z)
        delta_med = 1.0 - eta_read

        return {
            "classified_bit": classified_bit,
            "signal_mean": avg_signal,
            "signal_std": float(samples.std(ddof=1)),
            "eta_read": float(eta_read),
            "delta_med": float(delta_med),
        }

    def write_phase(self, classified_bit: int, p_write_eff: float) -> int:
        if self.rng.random() < p_write_eff:
            return classified_bit
        return 1 - classified_bit

    def hold_phase(self, write_bit: int, p_flip: float) -> int:
        if self.rng.random() < p_flip:
            return 1 - write_bit
        return write_bit

    def reset_phase(self, xi: float, p_reset_eff: float) -> float:
        # Higher reset success means less added fatigue. Failed reset injects more disorder.
        reset_penalty = (1.0 - p_reset_eff)
        xi_next = self.cfg.relaxation_factor * xi + self.cfg.fatigue_per_cycle * (1.0 + 2.0 * reset_penalty)
        return float(xi_next)

    def run(self) -> Dict[str, pd.DataFrame]:
        xi = 0.0
        rows: List[Dict[str, float]] = []
        timeline_rows: List[Dict[str, float]] = []

        for cycle in range(1, self.cfg.n_cycles + 1):
            hidden_bit = (cycle - 1) % 2
            xi_pre = xi
            sigma_eff = self.effective_sigma(xi_pre)
            tau_flip_eff = self.effective_tau_flip(xi_pre)
            p_write_eff = self.effective_p_write(xi_pre)
            p_reset_eff = self.effective_p_reset(xi_pre)

            read = self.read_phase(hidden_bit, sigma_eff)
            write_bit = self.write_phase(read["classified_bit"], p_write_eff)

            p_flip = 1.0 - math.exp(-self.cfg.t_hold / max(tau_flip_eff, 1e-12))
            final_bit = self.hold_phase(write_bit, p_flip)

            # Export is assumed reliable once the metastable state survived the hold.
            exported_bit = final_bit

            eta_write = 1.0 - p_write_eff
            eta_flip = p_flip
            eta_reset = 1.0 - p_reset_eff
            eta_fatigue = min(0.25, 0.03 * xi_pre)

            total_error = read["eta_read"] + eta_write + eta_flip + eta_reset + eta_fatigue
            margin = read["delta_med"] - (eta_write + eta_flip + eta_reset + eta_fatigue)

            cycle_success = (exported_bit == hidden_bit) and (margin > 0.0)
            fidelity = 1.0 if exported_bit == hidden_bit else 0.0

            xi_post = self.reset_phase(xi_pre, p_reset_eff)
            xi = xi_post

            rows.append(asdict(CycleMetrics(
                cycle=cycle,
                hidden_bit=hidden_bit,
                xi_pre=xi_pre,
                sigma_eff=sigma_eff,
                tau_flip_eff=tau_flip_eff,
                delta_med=read["delta_med"],
                eta_read=read["eta_read"],
                p_write_eff=p_write_eff,
                eta_write=eta_write,
                p_flip=p_flip,
                eta_flip=eta_flip,
                p_reset_eff=p_reset_eff,
                eta_reset=eta_reset,
                eta_fatigue=eta_fatigue,
                total_error=total_error,
                margin=margin,
                classified_bit=read["classified_bit"],
                write_bit=write_bit,
                final_bit_after_hold=final_bit,
                exported_bit=exported_bit,
                cycle_success=cycle_success,
                fidelity=fidelity,
                signal_mean=read["signal_mean"],
                signal_std=read["signal_std"],
                xi_post=xi_post,
            )))

            # Simple per-cycle timeline summary for plotting
            timeline_rows.extend([
                {"cycle": cycle, "phase": "read", "value": read["signal_mean"], "kind": "signal_mean"},
                {"cycle": cycle, "phase": "hold", "value": p_flip, "kind": "flip_prob"},
                {"cycle": cycle, "phase": "reset", "value": xi_post, "kind": "fatigue"},
            ])

        cycles_df = pd.DataFrame(rows)
        timeline_df = pd.DataFrame(timeline_rows)
        summary_df = pd.DataFrame([{
            "n_cycles": int(self.cfg.n_cycles),
            "success_cycles": int(cycles_df["cycle_success"].sum()),
            "all_cycles_successful": bool(cycles_df["cycle_success"].all()),
            "mean_fidelity": float(cycles_df["fidelity"].mean()),
            "min_margin": float(cycles_df["margin"].min()),
            "mean_margin": float(cycles_df["margin"].mean()),
            "max_xi_post": float(cycles_df["xi_post"].max()),
            "mean_delta_med": float(cycles_df["delta_med"].mean()),
            "tau_flip": self.cfg.tau_flip,
            "tau_relax": self.cfg.tau_relax,
            "cycle_time": self.cfg.cycle_time,
            "memory_criterion_ok": bool(self.cfg.tau_flip > 10.0 * self.cfg.t_read),
            "glass_criterion_ok": bool(self.cfg.tau_relax > 10.0 * self.cfg.cycle_time),
        }])
        return {"cycles": cycles_df, "timeline": timeline_df, "summary": summary_df}


def run_parameter_sweep(base_cfg: SoftS0M1Config) -> pd.DataFrame:
    results: List[Dict[str, float]] = []
    contrast_grid = [0.25, 0.4, 0.8, 1.2, 1.6]
    noise_grid = [0.20, 0.35, 0.50]
    tau_flip_grid = [6.0, 12.0, 35.0]
    fatigue_grid = [0.02, 0.04]

    for contrast in contrast_grid:
        for noise in noise_grid:
            for tau_flip in tau_flip_grid:
                for fatigue in fatigue_grid:
                    cfg = SoftS0M1Config(**asdict(base_cfg))
                    cfg.signal_contrast = contrast
                    cfg.read_noise = noise
                    cfg.tau_flip = tau_flip
                    cfg.fatigue_per_cycle = fatigue
                    cfg.random_seed = int(1000*contrast + 100*noise + 10*tau_flip + 10000*fatigue)

                    sim = SoftS0M1Simulator(cfg)
                    out = sim.run()
                    cyc = out["cycles"]
                    results.append({
                        "signal_contrast": contrast,
                        "read_noise": noise,
                        "tau_flip": tau_flip,
                        "fatigue_per_cycle": fatigue,
                        "success_cycles": int(cyc["cycle_success"].sum()),
                        "all_cycles_successful": bool(cyc["cycle_success"].all()),
                        "mean_fidelity": float(cyc["fidelity"].mean()),
                        "min_margin": float(cyc["margin"].min()),
                        "max_fatigue": float(cyc["xi_post"].max()),
                    })
    return pd.DataFrame(results)


def plot_baseline(cycles_df: pd.DataFrame, timeline_df: pd.DataFrame, out_path: Path) -> None:
    fig, axes = plt.subplots(3, 1, figsize=(10, 11), sharex=True)

    axes[0].plot(cycles_df["cycle"], cycles_df["signal_mean"], marker="o", label="signal mean")
    axes[0].axhline(0.0, linestyle="--", linewidth=1.0)
    axes[0].set_ylabel("signal mean")
    axes[0].set_title("Soft S0-M1 baseline cycle traces")

    axes[1].plot(cycles_df["cycle"], cycles_df["margin"], marker="o", label="margin")
    axes[1].axhline(0.0, linestyle="--", linewidth=1.0)
    axes[1].set_ylabel("margin")

    axes[2].plot(cycles_df["cycle"], cycles_df["xi_post"], marker="o", label="fatigue")
    axes[2].set_xlabel("cycle")
    axes[2].set_ylabel("fatigue xi")

    for ax in axes:
        ax.grid(alpha=0.3)

    fig.tight_layout()
    fig.savefig(out_path, dpi=160)
    plt.close(fig)


def plot_repeatability(cycles_df: pd.DataFrame, out_path: Path) -> None:
    fig, axes = plt.subplots(2, 1, figsize=(10, 8), sharex=True)
    axes[0].plot(cycles_df["cycle"], cycles_df["fidelity"], marker="o")
    axes[0].set_ylabel("fidelity")
    axes[0].set_ylim(-0.05, 1.05)
    axes[0].grid(alpha=0.3)

    axes[1].plot(cycles_df["cycle"], cycles_df["margin"], marker="o")
    axes[1].axhline(0.0, linestyle="--", linewidth=1.0)
    axes[1].set_xlabel("cycle")
    axes[1].set_ylabel("margin")
    axes[1].grid(alpha=0.3)

    fig.tight_layout()
    fig.savefig(out_path, dpi=160)
    plt.close(fig)


def plot_sweep_heatmap(sweep_df: pd.DataFrame, out_path: Path) -> None:
    # Aggregate over tau_flip and fatigue to get a compact 2D map
    heat = (
        sweep_df.groupby(["signal_contrast", "read_noise"], as_index=False)["mean_fidelity"]
        .mean()
        .pivot(index="signal_contrast", columns="read_noise", values="mean_fidelity")
    )

    fig, ax = plt.subplots(figsize=(8, 6))
    im = ax.imshow(heat.values, aspect="auto", origin="lower")
    ax.set_xticks(range(len(heat.columns)))
    ax.set_xticklabels([f"{v:.2f}" for v in heat.columns])
    ax.set_yticks(range(len(heat.index)))
    ax.set_yticklabels([f"{v:.2f}" for v in heat.index])
    ax.set_xlabel("read_noise")
    ax.set_ylabel("signal_contrast")
    ax.set_title("Mean fidelity heatmap")
    fig.colorbar(im, ax=ax, label="mean fidelity")
    fig.tight_layout()
    fig.savefig(out_path, dpi=160)
    plt.close(fig)


def build_readme(base_dir: Path) -> None:
    text = """# soft_s0_m1

Medium-specific simulator for the first soft prototype track:

**S0-M1 = binary persistent witness on a glassy / chemical-memory medium**

## What is modeled

A single material cell with:
- two metastable medium sectors `X0`, `X1`,
- noisy local readout,
- write into a persistent record,
- spontaneous flips during hold,
- imperfect reset,
- fatigue accumulation over repeated cycles.

## Files

- `src/soft_s0_m1.py` — simulator module
- `run_soft_s0_m1.py` — entry point
- `results/baseline_summary.json`
- `results/baseline_cycles.csv`
- `results/baseline_timeline.csv`
- `results/repeatability.csv`
- `results/sweep_summary.csv`
- `results/summary.csv`
- `results/baseline_cycle.png`
- `results/repeatability.png`
- `results/sweep_fidelity_heatmap.png`

## Run

```bash
python run_soft_s0_m1.py --output-dir results
```

## Main engineering inequalities

The medium should satisfy:
- `tau_flip >> t_read`
- `tau_relax >> cycle_time`

Operationally, the cycle is good when:

`eta_read + eta_write + eta_flip + eta_reset + eta_fatigue < delta_med`

where `delta_med` is the effective medium-specific contrast confidence.
"""
    (base_dir / "README.md").write_text(text, encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description="Run the medium-specific soft S0-M1 simulator.")
    parser.add_argument("--output-dir", type=str, default="results", help="Directory for results.")
    args = parser.parse_args()

    base_dir = Path(__file__).resolve().parent.parent
    output_dir = Path(args.output_dir)
    if not output_dir.is_absolute():
        output_dir = base_dir / output_dir
    output_dir.mkdir(parents=True, exist_ok=True)

    cfg = SoftS0M1Config()
    sim = SoftS0M1Simulator(cfg)
    out = sim.run()
    cycles_df = out["cycles"]
    timeline_df = out["timeline"]
    summary_df = out["summary"]

    cycles_df.to_csv(output_dir / "baseline_cycles.csv", index=False)
    timeline_df.to_csv(output_dir / "baseline_timeline.csv", index=False)
    summary_df.to_csv(output_dir / "summary.csv", index=False)
    summary_df.to_json(output_dir / "baseline_summary.json", orient="records", indent=2)

    repeatability_df = cycles_df[["cycle", "fidelity", "margin", "xi_post", "cycle_success"]].copy()
    repeatability_df.to_csv(output_dir / "repeatability.csv", index=False)

    sweep_df = run_parameter_sweep(cfg)
    sweep_df.to_csv(output_dir / "sweep_summary.csv", index=False)

    plot_baseline(cycles_df, timeline_df, output_dir / "baseline_cycle.png")
    plot_repeatability(repeatability_df, output_dir / "repeatability.png")
    plot_sweep_heatmap(sweep_df, output_dir / "sweep_fidelity_heatmap.png")

    build_readme(base_dir)


if __name__ == "__main__":
    main()
