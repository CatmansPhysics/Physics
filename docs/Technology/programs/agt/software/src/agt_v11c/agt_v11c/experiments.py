from __future__ import annotations

from dataclasses import asdict
import json
from pathlib import Path

import numpy as np
import pandas as pd

from .config import GraphConfig, SectorParams, InterfaceParams, RunParams
from .geometry import build_open_chain_adjacency, laplacian_from_adjacency
from .profiles import build_strip, build_bubble_open, interface_mask_strip, bubble_mask
from .field import solve_phi
from .spectral import SpectralExtractor
from .scattering import negf_scattering, dwell_time_from_scattering, detect_resonance_peaks


def build_source_monopole(N: int, pos: int, sign: int = +1) -> np.ndarray:
    rho = np.zeros(N, dtype=float)
    rho[pos] = float(sign)
    return rho


def compute_local_spectral(h_profile: np.ndarray, sector_params: SectorParams, run_params: RunParams, mu: float):
    extractor = SpectralExtractor(sector_params, run_params)
    return extractor.extract_over_profile(h_profile, mu)


def potential_from_mass_landscape(m_profile: np.ndarray, ref_region: slice, scale: float) -> np.ndarray:
    ref = float(np.mean(m_profile[ref_region]))
    return scale * (m_profile - ref)


def scan_scattering(U: np.ndarray, region_mask: np.ndarray, q_vals: np.ndarray, gamma_int: float = 0.0):
    gamma = np.where(region_mask, gamma_int, 0.0) if gamma_int > 0 else None
    rows = []
    for q in q_vals:
        T, R, A, dwell_total, psi = negf_scattering(U, float(q), t=1.0, gamma_arr=gamma)
        dwell_reg = dwell_time_from_scattering(psi, region_mask)
        rows.append({"q0": q, "T": T, "R": R, "A": A, "dwell": dwell_reg, "dwell_total": dwell_total})
    return pd.DataFrame(rows)


def add_peak_info(df: pd.DataFrame, ycol: str, prominence: float, qmin: float = 0.12):
    d = df[df["q0"] >= qmin].reset_index(drop=True)
    peaks, props = detect_resonance_peaks(d["q0"].to_numpy(), d[ycol].to_numpy(), prominence=prominence, distance=4)
    peak_df = pd.DataFrame({
        "idx": peaks,
        "q_res": d["q0"].to_numpy()[peaks],
        ycol + "_peak": d[ycol].to_numpy()[peaks],
        "prominence": props.get("prominences", np.array([])),
    })
    return peak_df


def save_profile_plot(path: Path, h: np.ndarray, m_plus: np.ndarray, m_minus: np.ndarray, title: str):
    import matplotlib.pyplot as plt
    plt.figure(figsize=(9, 4.8))
    plt.plot(h, label="h(i)")
    plt.plot(m_plus, label="m_plus(i)")
    plt.plot(m_minus, label="m_minus(i)")
    plt.title(title)
    plt.xlabel("site")
    plt.legend()
    plt.tight_layout()
    plt.savefig(path)
    plt.close()


def save_scan_plot(path: Path, df_plus: pd.DataFrame, df_minus: pd.DataFrame, ycol: str, title: str):
    import matplotlib.pyplot as plt
    plt.figure(figsize=(8, 4.8))
    plt.plot(df_plus["q0"], df_plus[ycol], label="+ sector")
    plt.plot(df_minus["q0"], df_minus[ycol], label="- sector")
    plt.xlabel("q0")
    plt.ylabel(ycol)
    plt.title(title)
    plt.legend()
    plt.tight_layout()
    plt.savefig(path)
    plt.close()


def save_bubble_peakcount_plot(path: Path, peak_counts: dict[int, int], title: str):
    import matplotlib.pyplot as plt
    xs = sorted(peak_counts)
    ys = [peak_counts[x] for x in xs]
    plt.figure(figsize=(6, 4))
    plt.plot(xs, ys, marker='o')
    plt.xlabel('R')
    plt.ylabel('N_peaks')
    plt.title(title)
    plt.tight_layout()
    plt.savefig(path)
    plt.close()


def run_all(output_dir: Path):
    output_dir.mkdir(parents=True, exist_ok=True)
    results_dir = output_dir / 'results'
    results_dir.mkdir(exist_ok=True)

    graph_cfg = GraphConfig(N=80, epsilon=0.02)
    A = build_open_chain_adjacency(graph_cfg)
    L = laplacian_from_adjacency(A)

    sector_params = SectorParams(a_bind=0.70, a_unbind=1.40)  # Pack B
    run_params = RunParams(dt=0.02, T=200.0, gamma_int=0.02)

    summary = {}

    # --- Strip / double-wall resonance experiment ---
    ip_strip = InterfaceParams(kind='strip', h0=1.0, mu=1.2, ell_h=2.0, left=20, right=58, V_scale=10.0)
    h_strip = build_strip(graph_cfg.N, ip_strip)
    spec_strip = compute_local_spectral(h_strip, sector_params, run_params, ip_strip.mu)
    strip_mask = interface_mask_strip(graph_cfg.N, ip_strip)

    U_plus_strip = potential_from_mass_landscape(spec_strip.m_plus, slice(0, 12), ip_strip.V_scale)
    U_minus_strip = potential_from_mass_landscape(spec_strip.m_minus, slice(0, 12), ip_strip.V_scale)

    q_scan_strip = np.linspace(0.08, 1.10, 240)
    df_strip_plus = scan_scattering(U_plus_strip, strip_mask, q_scan_strip, gamma_int=0.0)
    df_strip_minus = scan_scattering(U_minus_strip, strip_mask, q_scan_strip, gamma_int=0.0)
    peaks_strip_plus = add_peak_info(df_strip_plus, 'dwell', prominence=20.0, qmin=0.12)
    peaks_strip_minus = add_peak_info(df_strip_minus, 'dwell', prominence=20.0, qmin=0.12)

    df_strip_plus.to_csv(results_dir / 'strip_plus_scan.csv', index=False)
    df_strip_minus.to_csv(results_dir / 'strip_minus_scan.csv', index=False)
    peaks_strip_plus.to_csv(results_dir / 'strip_plus_peaks.csv', index=False)
    peaks_strip_minus.to_csv(results_dir / 'strip_minus_peaks.csv', index=False)
    save_profile_plot(results_dir / 'strip_profiles.png', h_strip, spec_strip.m_plus, spec_strip.m_minus, 'Strip background and local spectral masses')
    save_scan_plot(results_dir / 'strip_dwell.png', df_strip_plus, df_strip_minus, 'dwell', 'Strip dwell-time resonance scan')
    save_scan_plot(results_dir / 'strip_T.png', df_strip_plus, df_strip_minus, 'T', 'Strip transmission scan')
    save_scan_plot(results_dir / 'strip_R.png', df_strip_plus, df_strip_minus, 'R', 'Strip reflection scan')

    summary['strip'] = {
        'params': asdict(ip_strip),
        'plus_peaks': int(len(peaks_strip_plus)),
        'minus_peaks': int(len(peaks_strip_minus)),
        'plus_top_peak_q': float(peaks_strip_plus['q_res'].iloc[0]) if len(peaks_strip_plus) else None,
        'minus_top_peak_q': float(peaks_strip_minus['q_res'].iloc[0]) if len(peaks_strip_minus) else None,
        'plus_top_peak_dwell': float(peaks_strip_plus['dwell_peak'].iloc[0]) if len(peaks_strip_plus) else None,
        'minus_top_peak_dwell': float(peaks_strip_minus['dwell_peak'].iloc[0]) if len(peaks_strip_minus) else None,
        'plus_max_T': float(df_strip_plus['T'].max()),
        'minus_max_T': float(df_strip_minus['T'].max()),
    }

    # --- Bubble resonance/capture experiment ---
    bubble_peak_counts = {}
    bubble_rows = []
    for R in [8, 12, 16]:
        ip_bub = InterfaceParams(kind='bubble', h0=1.0, mu=1.2, ell_h=2.0, ic=40, R=R, V_scale=14.0)
        h_bub = build_bubble_open(graph_cfg.N, ip_bub)
        spec_bub = compute_local_spectral(h_bub, sector_params, run_params, ip_bub.mu)
        bub_mask = bubble_mask(graph_cfg.N, ip_bub)
        U_plus_bub = potential_from_mass_landscape(spec_bub.m_plus, slice(0, 12), ip_bub.V_scale)
        U_minus_bub = potential_from_mass_landscape(spec_bub.m_minus, slice(0, 12), ip_bub.V_scale)
        q_scan_bub = np.linspace(0.08, 1.10, 220)
        df_bub_plus = scan_scattering(U_plus_bub, bub_mask, q_scan_bub, gamma_int=0.02)
        df_bub_minus = scan_scattering(U_minus_bub, bub_mask, q_scan_bub, gamma_int=0.02)
        peaks_bub_plus = add_peak_info(df_bub_plus, 'A', prominence=0.005, qmin=0.12)
        peaks_bub_minus = add_peak_info(df_bub_minus, 'A', prominence=0.005, qmin=0.12)

        tag = f'R{R}'
        df_bub_plus.to_csv(results_dir / f'bubble_plus_{tag}.csv', index=False)
        df_bub_minus.to_csv(results_dir / f'bubble_minus_{tag}.csv', index=False)
        peaks_bub_plus.to_csv(results_dir / f'bubble_plus_{tag}_peaks.csv', index=False)
        peaks_bub_minus.to_csv(results_dir / f'bubble_minus_{tag}_peaks.csv', index=False)
        save_profile_plot(results_dir / f'bubble_profiles_{tag}.png', h_bub, spec_bub.m_plus, spec_bub.m_minus, f'Bubble background and local spectral masses (R={R})')
        save_scan_plot(results_dir / f'bubble_dwell_{tag}.png', df_bub_plus, df_bub_minus, 'dwell', f'Bubble dwell-time scan (R={R})')
        save_scan_plot(results_dir / f'bubble_absorption_{tag}.png', df_bub_plus, df_bub_minus, 'A', f'Bubble absorption / capture proxy (R={R})')

        bubble_peak_counts[R] = int(len(peaks_bub_minus))
        bubble_rows.append({
            'R': R,
            'plus_A_peaks': int(len(peaks_bub_plus)),
            'minus_A_peaks': int(len(peaks_bub_minus)),
            'plus_max_dwell': float(df_bub_plus['dwell'].max()),
            'minus_max_dwell': float(df_bub_minus['dwell'].max()),
            'plus_max_absorption': float(df_bub_plus['A'].max()),
            'minus_max_absorption': float(df_bub_minus['A'].max()),
        })

    pd.DataFrame(bubble_rows).to_csv(results_dir / 'bubble_summary.csv', index=False)
    save_bubble_peakcount_plot(results_dir / 'bubble_peakcount_minus.png', bubble_peak_counts, 'Bubble minus-sector absorption-peak count vs radius')
    summary['bubble'] = bubble_rows

    rho = build_source_monopole(graph_cfg.N, pos=10, sign=+1)
    phi = solve_phi(L, graph_cfg.epsilon, rho)
    np.save(results_dir / 'phi_monopole.npy', phi)

    summary_md = [
        '# AGT-1 Toy Model v1.1c results',
        '',
        '## Strip / double-wall resonance experiment',
        f"- Plus-sector dwell peaks above threshold: {summary['strip']['plus_peaks']}",
        f"- Minus-sector dwell peaks above threshold: {summary['strip']['minus_peaks']}",
        f"- Plus top peak q: {summary['strip']['plus_top_peak_q']}",
        f"- Minus top peak q: {summary['strip']['minus_top_peak_q']}",
        f"- Plus top dwell: {summary['strip']['plus_top_peak_dwell']}",
        f"- Minus top dwell: {summary['strip']['minus_top_peak_dwell']}",
        f"- Max transmission (plus): {summary['strip']['plus_max_T']:.4f}",
        f"- Max transmission (minus): {summary['strip']['minus_max_T']:.4f}",
        '',
        'Interpretation: the strip background produces a clearer, narrower resonance structure for the sector that sees a cavity-like effective well. In the chosen sign convention, this is the minus sector.',
        '',
        '## Bubble resonance / capture-proxy experiment',
    ]
    for row in bubble_rows:
        summary_md.extend([
            f"- R={row['R']}: plus_A_peaks={row['plus_A_peaks']}, minus_A_peaks={row['minus_A_peaks']}, "+
            f"max_dwell_plus={row['plus_max_dwell']:.3f}, max_dwell_minus={row['minus_max_dwell']:.3f}, "+
            f"max_abs_plus={row['plus_max_absorption']:.4f}, max_abs_minus={row['minus_max_absorption']:.4f}",
        ])
    summary_md.extend([
        '',
        'Interpretation: the bubble experiments use absorption A as the capture proxy in the presence of interface losses. The preferred well sector shows the stronger absorption/capture window in the tested parameter set.',
        '',
        '## Notes',
        '- The resonance layer is implemented as a 1D open-chain scattering problem on top of the local AGT spectral mass landscape.',
        '- The effective defect potential is V_scale * (m_sigma(i) - m_bulk); V_scale is a phenomenological interface-coupling parameter in this toy realization.',
        '- Capture is represented by absorption probability A when gamma_int > 0.',
    ])
    (results_dir / 'SUMMARY.md').write_text('\n'.join(summary_md), encoding='utf-8')
    (results_dir / 'summary.json').write_text(json.dumps(summary, indent=2), encoding='utf-8')

    return summary
