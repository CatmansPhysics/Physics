# FTL Implementation Writing Backlog

## Purpose

Write the canonical FTL implementation document in strict scientific English for the implementation surface already covered by the normalized simulator stack, numerical campaign artifacts, report contracts, and hardware-preparation protocol tree.

Target outputs:

- `docs/Technology/programs/ftl/computational/latex/ftl_computational_main.tex`
- supporting protocol files under `docs/Technology/programs/ftl/computational/` and `docs/Technology/programs/ftl/hardware/`

## Scope rule

The implementation document must stay within the currently normalized evidence base:

- canonical software tree `ftl_live`;
- existing normalized configs/tests/reports;
- registry-linked experiment package;
- currently prepared soft-array and hard-bench protocol artifacts.

## Canonical anchors

- Program root: `docs/Technology/programs/ftl/`
- Software root: `docs/Technology/programs/ftl/software/src/ftl_live/`
- Report contract: `docs/Technology/programs/ftl/software/reports/ftl_live_report_contract.md`
- Experiment registry: `PhysicsLean/experiments/src/physics_experiments/technology/ftl/registry.py`
- Physical-preparation tree: `docs/Technology/programs/ftl/hardware/`

## Chapter map

The canonical manuscript must be assembled from separate files under `docs/Technology/programs/ftl/computational/latex/chapters/`.

- `00_scope_and_status.tex`
- `01_frozen_package_ledger.tex`
- `02_baseline_freeze.tex`
- `03_soft_numerical_closeout.tex`
- `04_hard_numerical_closeout.tex`
- `05_mission_portfolio_and_policy.tex`
- `06_pending_closeout_stages.tex`
- `07_physical_prototype_bridge.tex`
- `08_reproducibility_contract.tex`
- `09_limitations_and_forward_dependencies.tex`

## Backlog

| ID | Status | Task | Output path |
| --- | --- | --- | --- |
| FTL-IMPL-01 | `next` | Build an implementation evidence ledger covering simulator modules, stage-closeout artifacts, report contracts, experiment registry paths, and hardware protocol placeholders. | `docs/Technology/programs/ftl/computational/tables/ftl_implementation_evidence_ledger.tex` |
| FTL-IMPL-02 | `planned` | Write the software architecture section for the canonical `ftl_live` stack, including the separation of soft-route, hard-route, orchestration, and mission layers. | `docs/Technology/programs/ftl/computational/latex/chapters/` |
| FTL-IMPL-03 | `planned` | Write the computational campaign section describing the normalized numerical stages, calibration checkpoints, repeatability checks, and mission-stack evaluations already captured by the canonical artifacts. | `docs/Technology/programs/ftl/computational/latex/chapters/` |
| FTL-IMPL-04 | `planned` | Write the results section with tables and figures extracted only from canonical reports, stage summaries, and reproducible software outputs. | `docs/Technology/programs/ftl/computational/latex/chapters/` |
| FTL-IMPL-05 | `planned` | Write the implementation-interpretation section explaining how the numerical stages correspond to the soft-route, hard-route, and integrated mission theory without overstating physical transport claims. | `docs/Technology/programs/ftl/computational/latex/chapters/` |
| FTL-IMPL-06 | `planned` | Write the physical protocol preparation section for soft arrays, hard benches, calibration sheets, and device-preparation pathways that already exist in canonical protocol form. | `docs/Technology/programs/ftl/computational/latex/chapters/` |
| FTL-IMPL-07 | `planned` | Write a forward experimental appendix that records the next physical campaigns strictly as prepared protocols and decision checkpoints. | `docs/Technology/programs/ftl/computational/protocols/ftl_forward_physical_experiment_appendix.md` |
| FTL-IMPL-08 | `planned` | Integrate the sections, evidence tables, and appendices into `ftl_computational_main.tex` and compile cleanly. | `docs/Technology/programs/ftl/computational/latex/ftl_computational_main.tex` |

## Acceptance criteria

1. The implementation manuscript describes the normalized FTL implementation stack that actually exists.
2. Numerical results are tied to canonical artifacts and report contracts.
3. Physical experiments are documented as preparation protocols, not as already completed laboratory demonstrations.
4. The document preserves the stage structure of the FTL campaign and its audited engineering boundary.
