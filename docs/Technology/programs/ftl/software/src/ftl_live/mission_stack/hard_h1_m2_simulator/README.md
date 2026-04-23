# hard_h1_m2

Medium-specific H1 simulator for a **topological / defect-protected composite carrier medium**.

## Model idea

This reduced pre-engineering simulator specializes the earlier composite H1 model to a gapped,
defect-structured medium with:
- topological protection factor,
- defect pinning,
- disorder / fatigue drift,
- refresh after each cycle.

The composite transport ansatz is

- `E_sep(Q, λ) = 2 E_*(Q/2, λ)`
- `B(Q, λ) = B0 * λ^2 * exp(-(Q/Qc)^2) * topo_protection(λ, fatigue, disorder)`
- `E_comp = E_sep - B`

and the cycle is

`entry -> hold -> exit -> verification -> refresh`.

## Files

- `src/hard_h1_m2.py` — simulator core
- `run_hard_h1_m2.py` — baseline + repeatability + sweep runner
- `results/` — CSV, JSON, PNG outputs

## Run

```bash
python run_hard_h1_m2.py
```

## Main outputs

- `baseline_summary.json`
- `baseline_timeseries.csv`
- `repeatability.csv`
- `sweep_summary.csv`
- `summary.csv`
- `baseline_cycle.png`
- `repeatability.png`
- `sweep_fidelity_heatmap.png`
