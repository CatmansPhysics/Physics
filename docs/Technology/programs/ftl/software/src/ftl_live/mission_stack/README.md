# FTL Mission Scenario Package

This package adds a first mission-level application scenario on top of the medium-specific portfolio.

Scenario:
- `soft_s0_m1` reads a binary remote cue,
- the cue selects one of two composite target windows,
- `hard_h1_m2` executes composite bound transport in the selected window,
- mission success is evaluated with mission-level metrics.

## Mission-level metrics
- selection accuracy
- hard execution rate
- hard fidelity
- binding safety margin
- topological protection margin
- cumulative mission readiness

## Run
```bash
python run_mission.py
```

Results are saved to `combined_results/`.
