# AGT v1.1c Report Contract

Canonical run entry point:

- `docs/Technology/programs/agt/software/src/agt_v11c/scripts/run_v11c.py`

Canonical output root after a successful run:

- `results/results/`

Required summary artifacts:

- `SUMMARY.md`
- `summary.json`

Required strip artifacts:

- `strip_plus_scan.csv`
- `strip_minus_scan.csv`
- `strip_plus_peaks.csv`
- `strip_minus_peaks.csv`
- `strip_profiles.png`
- `strip_dwell.png`
- `strip_T.png`
- `strip_R.png`

Required bubble artifacts:

- `bubble_summary.csv`
- `bubble_peakcount_minus.png`
- per-radius CSV and PNG outputs for `R=8`, `R=12`, and `R=16`

Required auxiliary artifact:

- `phi_monopole.npy`

Acceptance condition for the canonical imported legacy state:

- the summary files must exist;
- the strip campaign must report both plus and minus sector metrics;
- the bubble campaign must report all three radii;
- the output tree must remain stable under re-run once dependencies are normalized.