# AGT-1 Toy Model v1.1c

This package contains a runnable toy implementation for the AGT-1 resonance/interface layer.

## What is included

- Local AGT kernels with sector-selective inhomogeneous background `h(i)`.
- Local on-shell spectral extraction of `m_sigma(i)`, `M_in_sigma(i)`, `Qg_spec_sigma(i)`.
- 1D open-chain scattering realization for strip (double-wall) and bubble backgrounds.
- Dwell-time, transmission/reflection, and absorption/capture-proxy scans.
- Result tables and plots generated from actual runs.

## Main experiment design

The package runs two main experiment families:

1. **Strip / double-wall resonance experiment**
   - Background: finite `+` domain inside a `0`/outside background using a smooth strip profile.
   - Goal: sector-selective resonance peaks in dwell-time / transmission.

2. **Bubble resonance / capture-proxy experiment**
   - Background: smooth finite bubble.
   - Goal: sector-selective dwell windows and absorption/capture-proxy peaks.

## Important modeling note

The resonance layer is implemented as an effective 1D scattering problem on top of the AGT local spectral mass landscape. The effective defect potential is

`U_sigma(i) = V_scale * (m_sigma(i) - m_bulk)`.

So `V_scale` is a **phenomenological interface-coupling parameter** in this toy realization.

Capture is represented by absorption `A = 1 - T - R` when `gamma_int > 0`, which stands in for branch relaxation / conversion losses.

## Run

From the package root:

```bash
PYTHONPATH=. python scripts/run_v11c.py
```

## Output

All generated outputs are written to `results/`:

- CSV scans
- detected peak tables
- PNG plots
- `SUMMARY.md`
- `summary.json`

## Tested environment

- Python 3.13
- numpy
- scipy
- pandas
- matplotlib
