# hard_h0_m1_simulator

Medium-specific H0 simulator for a paired / gapped carrier medium.

## Model
This package implements a reduced one-pole carrier-cycle model in a paired/gapped medium.
Relative to the abstract `hard_h0` simulator, it adds:
- effective pairing gap
- quasiparticle linewidth during hold
- fatigue-dependent gap erosion
- refresh after each cycle
- repeatability and sweep studies

## Files
- `src/hard_h0_m1.py` — simulator core
- `run_hard_h0_m1.py` — entry point
- `results/` — generated summaries, CSVs, and plots

## Run
```bash
python run_hard_h0_m1.py
```

## Main outputs
- `results/baseline_summary.json`
- `results/baseline_timeseries.csv`
- `results/repeatability.csv`
- `results/sweep_summary.csv`
- `results/summary.csv`
- plots in PNG format
