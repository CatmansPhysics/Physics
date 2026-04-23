# soft_s0_m1

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
