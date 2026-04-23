# FTL Canonical Live-Tree Import Note

The canonical FTL software tree has been reconstructed under:

- `docs/Technology/programs/ftl/software/src/ftl_live/`

Imported frozen components:

- `baseline/` from `ftl_final_baseline_package_archive.zip`
- `soft_s1_m1_array_closeout/` from `soft_s1_m1_array_closeout_package_archive.zip`
- `hard_h1_m2_bench_closeout/` from `hard_h1_m2_bench_closeout_package_archive.zip`
- `mission_stack/` from `ftl_mission_scenario_package_archive.zip`

Separate release-level reference:

- `docs/Technology/programs/ftl/software/releases/ftl_stage4_6_project_closeout/`

Rationale:

- the baseline package preserves the frozen regression and config state;
- the soft and hard closeout packages preserve the last closed numerical stages;
- the mission package preserves the integrated control stack and runnable orchestration layer;
- the stage 4-6 closeout is retained as a report-and-dossier release rather than mixed into the source tree.

This reconstruction is intentionally conservative. It preserves the frozen package boundaries so that the next backlog step can normalize configs, tests, and report exporters without losing provenance.

Validation note:

- import-path validation reached the integrated mission stack but stopped at a missing dependency in the current workspace environment: `matplotlib`.
- dependency normalization belongs to the next FTL software step together with config and regression normalization.