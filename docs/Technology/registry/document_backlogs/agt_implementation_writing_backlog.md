# AGT Implementation Writing Backlog

## Purpose

Write the canonical AGT implementation document in strict scientific English for the implementation surface that is already represented by:

- normalized AGT software assets;
- existing numerical experiment lineage;
- current report contracts and experiment registry links;
- current preparation artifacts for physical prototypes and calibration.

Target outputs:

- `docs/Technology/programs/agt/computational/latex/agt_computational_main.tex`
- supporting protocol and table files under `docs/Technology/programs/agt/computational/` and `docs/Technology/programs/agt/hardware/`

## Scope rule

This document must describe only what is already covered by the canonical AGT software tree, report contracts, experiment links, and hardware-preparation artifacts. It must not project an unimplemented device stack as if it were already validated.

## Canonical anchors

- Program root: `docs/Technology/programs/agt/`
- Software root: `docs/Technology/programs/agt/software/src/agt_v11c/`
- Report contract: `docs/Technology/programs/agt/software/reports/agt_v11c_report_contract.md`
- Experiment registry: `PhysicsLean/experiments/src/physics_experiments/technology/agt/registry.py`
- Physical-preparation tree: `docs/Technology/programs/agt/hardware/`

## Chapter map

The canonical manuscript must be assembled from separate files under `docs/Technology/programs/agt/computational/latex/chapters/`.

- `00_scope_and_status.tex`
- `01_package_lineage.tex`
- `02_toy_model_numerical_core.tex`
- `03_strip_and_bubble_campaigns.tex`
- `04_p3_digital_emulator_line.tex`
- `05_protocol_bridge.tex`
- `06_reproducibility_contract.tex`
- `07_limitations_and_forward_dependencies.tex`

## Backlog

| ID | Status | Task | Output path |
| --- | --- | --- | --- |
| AGT-IMPL-01 | `next` | Build an implementation evidence ledger mapping software modules, numerical outputs, report contracts, experiment registry entries, and hardware protocol placeholders into one document-facing inventory. | `docs/Technology/programs/agt/computational/tables/agt_implementation_evidence_ledger.tex` |
| AGT-IMPL-02 | `planned` | Write the implementation architecture section for the normalized `agt_v11c` line, including model assumptions, parameter flow, observables, outputs, and limits of interpretation. | `docs/Technology/programs/agt/computational/latex/chapters/` |
| AGT-IMPL-03 | `planned` | Write the computational experiment section describing the exact numerical campaign currently represented by the canonical AGT software and registry layer. | `docs/Technology/programs/agt/computational/latex/chapters/` |
| AGT-IMPL-04 | `planned` | Write the results section, including tables and figures only for outputs already covered by normalized reports or reproducible software artifacts. | `docs/Technology/programs/agt/computational/latex/chapters/` |
| AGT-IMPL-05 | `planned` | Write the interpretation section explaining how the computational outputs connect back to the AGT theory without overstating physical realization. | `docs/Technology/programs/agt/computational/latex/chapters/` |
| AGT-IMPL-06 | `planned` | Write the physical-protocol preparation section covering the current calibration sheets, protocol notes, BOM placeholders, and operator-facing preparation flow. | `docs/Technology/programs/agt/computational/latex/chapters/` |
| AGT-IMPL-07 | `planned` | Extract a forward protocol appendix for later physical experiments that explicitly distinguishes prepared procedures from completed laboratory evidence. | `docs/Technology/programs/agt/computational/protocols/agt_forward_physical_experiment_appendix.md` |
| AGT-IMPL-08 | `planned` | Integrate sections, evidence tables, and protocol references into `agt_computational_main.tex` and compile cleanly. | `docs/Technology/programs/agt/computational/latex/agt_computational_main.tex` |

## Acceptance criteria

1. The implementation document describes the AGT software and experiment surface that actually exists today.
2. Numerical results are tied to canonical report or reproducible software artifacts.
3. The physical-experiment section is written as preparation and protocol guidance, not as completed evidence.
4. The manuscript cleanly bridges theory, computation, and prototype preparation without collapsing their status labels.
