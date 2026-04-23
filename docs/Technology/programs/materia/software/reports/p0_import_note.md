# P0 Canonical Import Note

The legacy bundle `docs/Technology/Materia/p0_prototype_bundle.zip` has been unpacked into the canonical Materialization software source location:

- `docs/Technology/programs/materia/software/src/p0_prototype/`

Canonical entry point:

- `scripts/run_all.py`

Imported payload:

- package source under `p0/`
- runnable orchestration script under `scripts/`
- frozen results and summary report under `results/`
- `requirements.txt` and legacy package README

This import is intentionally conservative. It preserves the bundle layout exactly so the next backlog step can normalize tests, configs, and report contracts without losing traceability to the P0 summary report.

Validation note:

- import-path validation reached the package but stopped at a missing dependency in the current workspace environment: `pandas`.
- dependency normalization belongs to the next software step and should be resolved together with Materialization tests and config normalization.