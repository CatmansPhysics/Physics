# Technology Source Inventory

## Purpose

This file records what currently exists in `docs/Technology`, how mature each technology line is, and where the clean outputs now belong.

## Program maturity snapshot

| Program | Legacy source roots | Current maturity after audit | Canonical clean destination |
| --- | --- | --- | --- |
| `agt` | `Antigrav_v1.md`, `Antigrav_Dev_v1.md`, `AGT/`, `AGT/agt_v11c/` | Theory draft, toy-model code/results, prototype architecture, software MVP lineage, analog/hardware transfer packages, operator package | `docs/Technology/programs/agt/` plus `PhysicsLean/PhysicsLean/Technology/AGT/` and `PhysicsLean/experiments/src/physics_experiments/technology/agt/` |
| `ftl` | `FTL_v1.md`, `FTL_Dev_v1.md`, `FTL_Dev_Roadmap_v1.md`, `FTL/` | Theory draft, staged simulator stack, medium-specific packages, orchestration, mission campaign, optimizer/adaptive policy, closeout archives | `docs/Technology/programs/ftl/` plus `PhysicsLean/PhysicsLean/Technology/FTL/` and `PhysicsLean/experiments/src/physics_experiments/technology/ftl/` |
| `materia` | `Matria_v1.md`, `Matria_Dev_v1.md`, `Materia/` | Theory architecture draft, P0 prototype bundle, summary report, lower-theorem-chain style numerical checkpoint | `docs/Technology/programs/materia/` plus `PhysicsLean/PhysicsLean/Technology/Materialization/` and `PhysicsLean/experiments/src/physics_experiments/technology/materialization/` |

## Archive audit summary

### AGT

Observed archive classes:

- early roadmap and phase-alignment packages;
- cleaned toy-theory report packages;
- runnable toy-model code and frozen results (`agt_v11c`);
- engineering prototype candidate and platform architecture packages;
- software specification and MVP release line (`v0.1`, `v0.2`, `v0.2.1`, `v0.2.2`);
- analog transfer, testbench, first-session, and operator packages.

Interpretation:

- AGT is the most complete technology line in terms of end-to-end traceability from theory draft to runnable emulator and hardware-facing protocol packages.
- The main problem is not missing content but fragmentation across zip releases and free-standing notes.

### FTL

Observed archive classes:

- abstract soft/hard simulators;
- medium-specific simulator packages;
- integrated, orchestration, mission, portfolio, optimizer, and adaptive-policy packages;
- baseline freeze and stage-closeout archives;
- execution status CSV files.

Interpretation:

- FTL has the strongest numerical campaign maturity and a visible soft/hard engineering ladder.
- The main problem is the lack of a canonical live source tree and a clean manuscript pair anchored to the final frozen numerical baseline.

### Materialization

Observed archive classes:

- theory draft notes for the standalone materialization program;
- one prototype bundle (`p0_prototype_bundle.zip`);
- one summary report with calibrated lower-level outcomes.

Interpretation:

- Materialization already has a meaningful theory direction and a lower-level computational prototype, but it is less operationally expanded than AGT or FTL.
- The immediate need is to normalize notation, publish the two-document package, and turn the P0 bundle into a reproducible live package.

## Canonical write path rules

Document-writing execution backlogs for the canonical manuscript pair now live in:

- `docs/Technology/registry/document_backlogs/`

### Documents

- Theory manuscripts go to `docs/Technology/programs/<program>/theory/latex/`.
- Computational manuscripts go to `docs/Technology/programs/<program>/computational/latex/`.
- Figures and tables for each manuscript stay beside their own document family.
- Experimental bridge protocols go to `docs/Technology/programs/<program>/computational/protocols/`.

### Software and reports

- Normalized source code goes to `docs/Technology/programs/<program>/software/src/` only after it is extracted from legacy packages and made reproducible.
- Frozen release zips are mirrored by manifest or copied release notes under `software/releases/`.
- Human-readable numerical reports go to `software/reports/`.

### Formalization

- Lean theorem files for applied technology programs go to `PhysicsLean/PhysicsLean/Technology/<Program>/`.
- Supporting Python experiments go to `PhysicsLean/experiments/src/physics_experiments/technology/<program>/`.

## Migration priority

1. Normalize AGT first because it already has a live code tree and hardware-facing protocol packages.
2. Normalize FTL second because its archival pipeline is mature enough to support clean manuscripts and reproducible source import.
3. Normalize Materialization third in parallel with theory polishing because its code surface is smaller but its theoretical vocabulary still needs contraction and notation discipline.