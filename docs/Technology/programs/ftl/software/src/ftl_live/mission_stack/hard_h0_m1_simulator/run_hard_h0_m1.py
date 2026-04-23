
from __future__ import annotations

import json
import os
from dataclasses import asdict

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

from src.hard_h0_m1 import HardH0M1Params, run_single_cycle, run_repeatability, run_sweep, save_json

ROOT = os.path.dirname(os.path.abspath(__file__))
RES = os.path.join(ROOT, 'results')
os.makedirs(RES, exist_ok=True)

p = HardH0M1Params()
rho0 = np.array([[1.0, 0.0],[0.0, 0.0]], dtype=complex)

baseline = run_single_cycle(rho0, q=p.q0, fatigue0=0.0, p=p)
m = baseline['metrics']

baseline_summary = {
    'baseline_fidelity': m.fidelity,
    'baseline_epsilon_id_1p': m.epsilon_id_1p,
    'baseline_min_gap': m.min_gap,
    'baseline_min_gap_eff': m.min_gap_eff,
    'baseline_tau_sw_min': m.tau_sw_min,
    'baseline_a_max': m.a_max,
    'baseline_carrier_margin': m.carrier_margin,
    'baseline_mean_linewidth_hold': m.mean_linewidth_hold,
    'baseline_min_branch_support': m.min_branch_support,
    'baseline_max_carrier_weight': m.max_carrier_weight,
    'baseline_end_fatigue': m.end_fatigue,
    'tau_sw': p.tau_sw,
    'pair_gap': p.pair_gap,
    'gamma_qp': p.gamma_qp,
}
save_json(os.path.join(RES, 'baseline_summary.json'), baseline_summary)

baseline_df = pd.DataFrame({
    'time': baseline['times'],
    'lambda': baseline['lambdas'],
    'gap': baseline['gaps'],
    'gap_eff': baseline['gaps_eff'],
    'tracked_population': baseline['tracked_population'],
    'carrier_weight': baseline['carrier_weights'],
    'linewidth': baseline['linewidths'],
    'fatigue': baseline['fatigues'],
})
baseline_df.to_csv(os.path.join(RES, 'baseline_timeseries.csv'), index=False)

plt.figure(figsize=(10, 6))
plt.plot(baseline_df['time'], baseline_df['lambda'], label='lambda(t)')
plt.plot(baseline_df['time'], baseline_df['gap'], label='gap')
plt.plot(baseline_df['time'], baseline_df['gap_eff'], label='effective gap')
plt.plot(baseline_df['time'], baseline_df['tracked_population'], label='tracked branch support')
plt.plot(baseline_df['time'], baseline_df['linewidth'], label='linewidth')
plt.xlabel('time')
plt.ylabel('value')
plt.title('hard_h0_m1 baseline cycle')
plt.legend()
plt.tight_layout()
plt.savefig(os.path.join(RES, 'baseline_cycle.png'), dpi=160)
plt.close()

rep = run_repeatability(20, p)
rep.to_csv(os.path.join(RES, 'repeatability.csv'), index=False)

plt.figure(figsize=(10, 6))
plt.plot(rep['cycle'], rep['fidelity'], marker='o', label='fidelity')
plt.plot(rep['cycle'], rep['min_gap_eff'], marker='s', label='min effective gap')
plt.plot(rep['cycle'], rep['mean_linewidth_hold'], marker='^', label='mean hold linewidth')
plt.plot(rep['cycle'], rep['fatigue_in'], marker='d', label='fatigue in')
plt.xlabel('cycle')
plt.ylabel('value')
plt.title('hard_h0_m1 repeatability')
plt.legend()
plt.tight_layout()
plt.savefig(os.path.join(RES, 'repeatability.png'), dpi=160)
plt.close()

gaps = [0.35, 0.45, 0.55, 0.65, 0.75]
taus = [3.8, 4.3, 4.8, 5.3, 5.8, 6.3, 6.8]
sweep = run_sweep(gaps, taus, p)
sweep.to_csv(os.path.join(RES, 'sweep_summary.csv'), index=False)

pivot = sweep.pivot(index='pair_gap', columns='tau_sw', values='fidelity')
plt.figure(figsize=(9, 6))
plt.imshow(pivot.values, aspect='auto', origin='lower')
plt.xticks(range(len(pivot.columns)), [f'{x:.1f}' for x in pivot.columns])
plt.yticks(range(len(pivot.index)), [f'{x:.2f}' for x in pivot.index])
plt.xlabel('tau_sw')
plt.ylabel('pair_gap')
plt.title('hard_h0_m1 fidelity heatmap')
plt.colorbar(label='fidelity')
plt.tight_layout()
plt.savefig(os.path.join(RES, 'sweep_fidelity_heatmap.png'), dpi=160)
plt.close()

summary = pd.DataFrame([
    {
        'metric': 'baseline_fidelity', 'value': m.fidelity,
    },
    {
        'metric': 'baseline_epsilon_id_1p', 'value': m.epsilon_id_1p,
    },
    {
        'metric': 'baseline_min_gap', 'value': m.min_gap,
    },
    {
        'metric': 'baseline_min_gap_eff', 'value': m.min_gap_eff,
    },
    {
        'metric': 'baseline_tau_sw_min', 'value': m.tau_sw_min,
    },
    {
        'metric': 'baseline_a_max', 'value': m.a_max,
    },
    {
        'metric': 'baseline_carrier_margin', 'value': m.carrier_margin,
    },
    {
        'metric': 'baseline_mean_linewidth_hold', 'value': m.mean_linewidth_hold,
    },
    {
        'metric': 'repeatability_cycles', 'value': len(rep),
    },
    {
        'metric': 'repeatability_min_fidelity', 'value': float(rep['fidelity'].min()),
    },
    {
        'metric': 'repeatability_max_epsilon_id_1p', 'value': float(rep['epsilon_id_1p'].max()),
    },
    {
        'metric': 'repeatability_min_gap_eff', 'value': float(rep['min_gap_eff'].min()),
    },
    {
        'metric': 'repeatability_max_fatigue_in', 'value': float(rep['fatigue_in'].max()),
    },
    {
        'metric': 'sweep_total_points', 'value': len(sweep),
    },
    {
        'metric': 'sweep_feasible_points', 'value': int(sweep['feasible'].sum()),
    },
    {
        'metric': 'sweep_best_fidelity', 'value': float(sweep['fidelity'].max()),
    },
])
summary.to_csv(os.path.join(RES, 'summary.csv'), index=False)
