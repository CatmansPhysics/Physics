# AGT v1.1c Canonical Import Note

The legacy live source tree from `docs/Technology/AGT/agt_v11c/` has been copied into the canonical AGT software source location:

- `docs/Technology/programs/agt/software/src/agt_v11c/`

Canonical entry point:

- `scripts/run_v11c.py`

Imported payload:

- package source under `agt_v11c/`
- runnable script under `scripts/`
- frozen legacy outputs under `results/`
- legacy package README

The import intentionally preserves the original package layout so later reproducibility checks can compare canonical outputs against the already frozen resonance summaries.

Validation note:

- import-path validation reached the package but stopped at a missing dependency in the current workspace environment: `numpy`.
- dependency normalization belongs to the next software step and should be resolved together with AGT tests and config normalization.