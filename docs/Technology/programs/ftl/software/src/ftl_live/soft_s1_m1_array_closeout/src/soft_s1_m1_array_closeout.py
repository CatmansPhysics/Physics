
from __future__ import annotations
import math
from dataclasses import dataclass, field, asdict
import numpy as np
import pandas as pd
from src.soft_s0_m1 import SoftS0M1Config, normal_cdf

@dataclass
class ArrayCloseoutConfig:
    rows: int = 16
    cols: int = 16
    baseline_cycles: int = 256
    long_cycles: int = 1024
    heterogeneity: float = 0.02
    read_samples: int = 196
    random_seed: int = 17
    medium: SoftS0M1Config = field(default_factory=lambda: SoftS0M1Config(
        tau_flip=60.0,
        tau_relax=70.0,
        signal_contrast=2.4,
        read_noise=0.10,
        p_write=0.998,
        p_reset=0.996,
        fatigue_per_cycle=0.006,
        fatigue_coupling_read=0.09,
        fatigue_coupling_write=0.06,
        fatigue_coupling_reset=0.08,
        fatigue_coupling_flip=0.07,
        t_read=0.55,
        t_hold=0.9,
        t_write=0.12,
        t_reset=0.18,
        n_samples=96,
        n_cycles=32,
        random_seed=2,
    ))

class SoftS1M1ArrayCloseoutSimulator:
    def __init__(self, cfg: ArrayCloseoutConfig):
        self.cfg = cfg
        self.rng = np.random.default_rng(cfg.random_seed)
        n = cfg.rows * cfg.cols
        self.contrast_scale = np.clip(self.rng.normal(1.0, cfg.heterogeneity, n), 0.88, 1.12)
        self.noise_scale = np.clip(self.rng.normal(1.0, cfg.heterogeneity, n), 0.88, 1.12)
        self.write_scale = np.clip(self.rng.normal(1.0, cfg.heterogeneity, n), 0.94, 1.06)
        self.reset_scale = np.clip(self.rng.normal(1.0, cfg.heterogeneity, n), 0.94, 1.06)

    def _cell_metrics(self, xi: float):
        m = self.cfg.medium
        sigma_eff = m.read_noise * (1.0 + m.fatigue_coupling_read * xi) * self.noise_scale
        tau_flip_eff = m.tau_flip / (1.0 + m.fatigue_coupling_flip * xi)
        p_write_eff = np.clip(m.p_write * np.exp(-m.fatigue_coupling_write * xi) * self.write_scale, 0.0, 1.0)
        p_reset_eff = np.clip(m.p_reset * np.exp(-m.fatigue_coupling_reset * xi) * self.reset_scale, 0.0, 1.0)
        contrast = m.signal_contrast * self.contrast_scale
        return sigma_eff, tau_flip_eff, p_write_eff, p_reset_eff, contrast

    def run_cycles(self, n_cycles: int) -> pd.DataFrame:
        m = self.cfg.medium
        xi = 0.0
        rows = []
        n = self.cfg.rows * self.cfg.cols
        for cycle in range(1, n_cycles + 1):
            bits = np.fromfunction(lambda idx: ((idx + cycle) % 2), (n,), dtype=int).astype(int)
            sigma_eff, tau_flip_eff, p_write_eff, p_reset_eff, contrast = self._cell_metrics(xi)
            means = np.where(bits == 1, 0.5 * contrast, -0.5 * contrast)
            sigma_mean = sigma_eff / math.sqrt(self.cfg.read_samples)
            avg_signal = self.rng.normal(means, sigma_mean)
            classified = (avg_signal > 0).astype(int)
            z = np.abs(means) / np.maximum(sigma_mean, 1e-12)
            eta_read = 1.0 - np.vectorize(normal_cdf)(z)
            delta_med = 1.0 - eta_read

            write_ok = self.rng.random(n) < p_write_eff
            written = np.where(write_ok, classified, 1 - classified)

            p_flip = 1.0 - np.exp(-m.t_hold / np.maximum(tau_flip_eff, 1e-12))
            flip = self.rng.random(n) < p_flip
            final = np.where(flip, 1 - written, written)
            exported = final

            eta_write = 1.0 - p_write_eff
            eta_flip = p_flip
            eta_reset = 1.0 - p_reset_eff
            eta_fatigue = np.full(n, min(0.20, 0.02 * xi))
            margin = delta_med - (eta_write + eta_flip + eta_reset + eta_fatigue)

            per_cell_success = (exported == bits) & (margin > 0)
            array_acc = float(np.mean(exported == bits))
            success_frac = float(np.mean(per_cell_success))
            failed_cell_fraction = float(1.0 - success_frac)
            rows.append({
                "cycle": cycle,
                "array_accuracy": array_acc,
                "success_fraction": success_frac,
                "failed_cell_fraction": failed_cell_fraction,
                "worst_margin": float(np.min(margin)),
                "mean_margin": float(np.mean(margin)),
                "xi_pre": xi,
                "max_reset_penalty": float(np.max(1.0 - p_reset_eff)),
            })

            reset_penalty = float(np.mean(1.0 - p_reset_eff))
            xi = float(math.exp(-m.cycle_time / m.tau_relax) * xi + m.fatigue_per_cycle * (1.0 + 2.0 * reset_penalty))
        return pd.DataFrame(rows)

def run_sweep(cfg: ArrayCloseoutConfig) -> pd.DataFrame:
    rows = []
    for hetero in [0.015, 0.02, 0.03]:
        for signal_contrast in [2.2, 2.4, 2.6]:
            for read_noise in [0.10, 0.11, 0.12]:
                local = ArrayCloseoutConfig(**asdict(cfg))
                local.heterogeneity = hetero
                local.medium = SoftS0M1Config(**asdict(cfg.medium))
                local.medium.signal_contrast = signal_contrast
                local.medium.read_noise = read_noise
                sim = SoftS1M1ArrayCloseoutSimulator(local)
                long_df = sim.run_cycles(512)
                rows.append({
                    "heterogeneity": hetero,
                    "signal_contrast": signal_contrast,
                    "read_noise": read_noise,
                    "mean_array_accuracy": float(long_df["array_accuracy"].mean()),
                    "min_array_accuracy": float(long_df["array_accuracy"].min()),
                    "max_failed_cell_fraction": float(long_df["failed_cell_fraction"].max()),
                    "worst_margin": float(long_df["worst_margin"].min()),
                    "feasible": int(
                        (float(long_df["array_accuracy"].mean()) >= 0.95)
                        and (float(long_df["worst_margin"].min()) > 0.30)
                        and (float(long_df["failed_cell_fraction"].max()) < 0.10)
                    ),
                })
        return pd.DataFrame(rows)
