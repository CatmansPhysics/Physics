# P0 Crystalline Materialization Prototype

This repository contains a computational prototype for the lowest layer (H0) of the materialization theory:
seeded hard materialization of a monatomic crystalline body on a discrete 2D lattice.

## What is implemented
- fixed target lattice and observer-level diagnostics
- manual calibration state families (good / borderline / bad)
- order score `Q_lambda`
- defect norm `d(X)`
- effective crystalline functional `F_cryst`
- explicit reservoir sufficiency and seed handling
- local compatibility checks and deterministic growth engine
- escape-path barrier estimator and metastability-based hard/soft verdict
- calibration, sweeps, plots, CSV outputs, and a summary report

## Quick start
```bash
python scripts/run_all.py
```

Results are written into `results/`.

## Main outputs
- `calibration_scores.csv`
- `capacity_sweep.csv`
- `compatibility_sweep.csv`
- `metastability_sweep.csv`
- `verdict_atlas.csv`
- PNG plots for each sweep
- `summary_report.md`

## Notes
This is an engineering prototype of the theory, not a full physical simulator.
The model is intentionally minimal and calibrated around a single 2D monatomic target lattice.
