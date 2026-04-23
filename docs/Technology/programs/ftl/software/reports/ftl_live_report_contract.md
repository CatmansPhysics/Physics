# FTL Live-Tree Report Contract

Canonical frozen subtrees:

- `baseline/`
- `soft_s1_m1_array_closeout/`
- `hard_h1_m2_bench_closeout/`
- `mission_stack/`

Required baseline artifacts:

- `baseline/manifest.json`
- `baseline/combined_results/master_baseline_metrics.csv`
- `baseline/combined_results/regression_checks.csv`
- `baseline/combined_results/freeze_summary.json`

Required soft closeout artifacts:

- source module files under `soft_s1_m1_array_closeout/src/`
- `results/summary.csv`
- `results/summary.json`
- `results/baseline_cycles.csv`
- `results/long_repeatability.csv`
- `results/sweep_summary.csv`

Required hard closeout artifacts:

- source module files under `hard_h1_m2_bench_closeout/src/`
- `results/summary.csv`
- `results/summary.json`
- `results/baseline_summary.csv`
- `results/repeatability.csv`
- `results/disorder_topology_sweep.csv`

Required mission-stack artifacts:

- `src/mission_scenario.py`
- simulator source trees for soft, hard H0, and hard H1 packages
- `combined_results/mission_summary.csv`
- `combined_results/mission_summary.json`
- `combined_results/mission_route_summary.csv`
- `combined_results/readiness_summary.csv`

Acceptance condition for the canonical reconstructed state:

- all four frozen subtrees must be present;
- each subtree must preserve both source and frozen result artifacts;
- the baseline must remain the provenance anchor for package names;
- future normalization may refactor package boundaries, but only after regression equivalence is documented.