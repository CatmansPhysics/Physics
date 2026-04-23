from __future__ import annotations

import os

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

from src.hard_h1_m2 import HardH1M2Params, run_repeatability, run_sweep, save_json, simulate_cycle

ROOT = os.path.dirname(os.path.abspath(__file__))
RES = os.path.join(ROOT, 'results')
os.makedirs(RES, exist_ok=True)

p = HardH1M2Params()

baseline = simulate_cycle(p, fatigue=0.0, disorder=p.defect_noise0)
m = baseline['metrics']

baseline_summary = {
    'baseline_fidelity': m.fidelity,
    'baseline_epsilon_id_comp': m.epsilon_id_comp,
    'baseline_min_onepole_gap': m.min_onepole_gap,
    'baseline_tau_sw_min': m.tau_sw_min,
    'baseline_carrier_margin': m.carrier_margin,
    'baseline_hold_min_bind_margin': m.hold_min_bind_margin,
    'baseline_hold_mean_gamma': m.hold_mean_gamma,
    'baseline_hold_mean_topo_protection': m.hold_mean_topo_protection,
    'baseline_max_bound_support': m.max_bound_support,
    'baseline_mean_topo_support': m.mean_topo_support,
    'baseline_min_track_survival': m.min_track_survival,
    'top_gap': p.top_gap,
    'pin_strength': p.pin_strength,
    'tau_sw': p.tau_sw,
    'tau_hold': p.tau_hold,
}
save_json(os.path.join(RES, 'baseline_summary.json'), baseline_summary)

baseline_df = pd.DataFrame({
    'time': baseline['times'],
    'lambda': baseline['lambdas'],
    'gap': baseline['gaps'],
    'binding': baseline['binding'],
    'e_comp': baseline['e_comp'],
    'ad_score': baseline['ad_score'],
    'gamma': baseline['gamma'],
    'topo_protection': baseline['topo_protection'],
    'bound_support': baseline['bound_support'],
    'topo_support': baseline['topo_support'],
    'track_survival': baseline['track_survival'],
    'epsilon_comp': baseline['epsilon_comp'],
})
baseline_df.to_csv(os.path.join(RES, 'baseline_timeseries.csv'), index=False)

plt.figure(figsize=(10, 6))
plt.plot(baseline_df['time'], baseline_df['lambda'], label='lambda(t)')
plt.plot(baseline_df['time'], baseline_df['gap'], label='one-pole gap')
plt.plot(baseline_df['time'], baseline_df['binding'], label='binding')
plt.plot(baseline_df['time'], baseline_df['topo_protection'], label='topo protection')
plt.plot(baseline_df['time'], baseline_df['bound_support'], label='bound support')
plt.plot(baseline_df['time'], baseline_df['gamma'], label='linewidth')
plt.xlabel('time')
plt.ylabel('value')
plt.title('hard_h1_m2 baseline cycle')
plt.legend()
plt.tight_layout()
plt.savefig(os.path.join(RES, 'baseline_cycle.png'), dpi=160)
plt.close()

rep = run_repeatability(16, p)
rep.to_csv(os.path.join(RES, 'repeatability.csv'), index=False)

plt.figure(figsize=(10, 6))
plt.plot(rep['cycle'], rep['fidelity'], marker='o', label='fidelity')
plt.plot(rep['cycle'], rep['hold_min_bind_margin'], marker='s', label='bind margin')
plt.plot(rep['cycle'], rep['hold_mean_topo_protection'], marker='^', label='topo protection')
plt.plot(rep['cycle'], rep['disorder_in'], marker='d', label='disorder in')
plt.xlabel('cycle')
plt.ylabel('value')
plt.title('hard_h1_m2 repeatability')
plt.legend()
plt.tight_layout()
plt.savefig(os.path.join(RES, 'repeatability.png'), dpi=160)
plt.close()

# Reduced engineering-scale sweep to keep runtime light but informative.
top_gaps = [0.65, 0.85, 1.05]
taus = [4.8, 5.8, 6.8, 7.8]
sweep = run_sweep(top_gaps, taus, p)
sweep.to_csv(os.path.join(RES, 'sweep_summary.csv'), index=False)

pivot = sweep.pivot(index='top_gap', columns='tau_sw', values='fidelity')
plt.figure(figsize=(8, 5.5))
plt.imshow(pivot.values, aspect='auto', origin='lower')
plt.xticks(range(len(pivot.columns)), [f'{x:.1f}' for x in pivot.columns])
plt.yticks(range(len(pivot.index)), [f'{x:.2f}' for x in pivot.index])
plt.xlabel('tau_sw')
plt.ylabel('top_gap')
plt.title('hard_h1_m2 fidelity heatmap')
plt.colorbar(label='fidelity')
plt.tight_layout()
plt.savefig(os.path.join(RES, 'sweep_fidelity_heatmap.png'), dpi=160)
plt.close()

summary = pd.DataFrame([
    {'metric': 'baseline_fidelity', 'value': m.fidelity},
    {'metric': 'baseline_epsilon_id_comp', 'value': m.epsilon_id_comp},
    {'metric': 'baseline_min_onepole_gap', 'value': m.min_onepole_gap},
    {'metric': 'baseline_tau_sw_min', 'value': m.tau_sw_min},
    {'metric': 'baseline_carrier_margin', 'value': m.carrier_margin},
    {'metric': 'baseline_hold_min_bind_margin', 'value': m.hold_min_bind_margin},
    {'metric': 'baseline_hold_mean_gamma', 'value': m.hold_mean_gamma},
    {'metric': 'baseline_hold_mean_topo_protection', 'value': m.hold_mean_topo_protection},
    {'metric': 'baseline_max_bound_support', 'value': m.max_bound_support},
    {'metric': 'baseline_mean_topo_support', 'value': m.mean_topo_support},
    {'metric': 'repeatability_cycles', 'value': len(rep)},
    {'metric': 'repeatability_min_fidelity', 'value': float(rep['fidelity'].min())},
    {'metric': 'repeatability_max_epsilon_id_comp', 'value': float(rep['epsilon_id_comp'].max())},
    {'metric': 'repeatability_min_bind_margin', 'value': float(rep['hold_min_bind_margin'].min())},
    {'metric': 'repeatability_min_topo_protection', 'value': float(rep['hold_mean_topo_protection'].min())},
    {'metric': 'repeatability_max_disorder', 'value': float(rep['disorder_in'].max())},
    {'metric': 'sweep_total_points', 'value': len(sweep)},
    {'metric': 'sweep_feasible_points', 'value': int(sweep['feasible'].sum())},
    {'metric': 'sweep_best_fidelity', 'value': float(sweep['fidelity'].max())},
])
summary.to_csv(os.path.join(RES, 'summary.csv'), index=False)
