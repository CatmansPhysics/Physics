# P0 Report Contract

Canonical run entry point:

- `docs/Technology/programs/materia/software/src/p0_prototype/scripts/run_all.py`

Canonical output root after a successful run:

- `results/`

Required tabular outputs:

- `calibration_scores.csv`
- `capacity_sweep.csv`
- `compatibility_sweep.csv`
- `metastability_sweep.csv`
- `verdict_atlas.csv`

Required metadata and summary outputs:

- `calibration_meta.json`
- `summary_report.md`

Required plot outputs:

- `q_lambda_ranking.png`
- `f_cryst_ranking.png`
- `capacity_volume_plot.png`
- `capacity_verdict_plot.png`
- `compatibility_phase_map.png` or seed-specific equivalent maps
- `order_vs_defect_scatter.png`
- `metastability_escape_prob.png`

Acceptance condition for the canonical imported legacy state:

- the summary report must exist;
- verdict classes must be recoverable from `verdict_atlas.csv`;
- the run must generate calibration, capacity, compatibility, and metastability outputs in one pass once dependencies are normalized.