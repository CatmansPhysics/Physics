# Technology Writing and Formalization Backlog

## Completion snapshot

The canonical AGT, FTL, and Materialization document trees, software trees,
experiment hooks, and Lean packages are now present in their canonical
locations.

As of 2026-04-13, the applied-technology Lean layer is in maintenance mode:

- source-backed AGT formalization complete and integrated;
- source-backed FTL formalization complete and integrated;
- source-backed Materialization formalization complete and integrated;
- legacy wrapper layers cleaned into bundled target/background/witness APIs;
- technology subtree validated by workspace build and kept free of `axiom` and
	`sorry` placeholders.

The next writing-stage execution layer is tracked separately in:

- `docs/Technology/registry/document_backlogs/`

That directory contains separate theory-writing and implementation-writing
backlogs for AGT, FTL, and Materialization.

## Status legend

- `done`: completed in canonical location.
- `next`: highest-priority executable item.
- `planned`: defined but not started in canonical form.
- `blocked`: cannot proceed until a dependency is normalized.

## Package definition

For every technology line, the canonical target package is:

1. One theory manuscript in strict scientific English LaTeX.
2. One computational manuscript in strict scientific English LaTeX, including numerical evidence and the forward protocol for physical-device experiments.
3. One reproducible computational package.
4. One Lean formalization package with linked experiment support.

## Infrastructure tasks

| ID | Status | Task | Output path |
| --- | --- | --- | --- |
| INF-01 | `done` | Create canonical program directory tree under `docs/Technology/programs/` | `docs/Technology/programs/` |
| INF-02 | `done` | Create canonical applied-technology formalization tree in PhysicsLean | `PhysicsLean/PhysicsLean/Technology/` |
| INF-03 | `done` | Create canonical Python experiment tree for applied technologies | `PhysicsLean/experiments/src/physics_experiments/technology/` |
| INF-04 | `done` | Write audited source inventory and migration rules | `docs/Technology/registry/source_inventory.md` |

## AGT backlog

| ID | Status | Task | Output path |
| --- | --- | --- | --- |
| AGT-01 | `done` | Normalize terminology, theorem status labels, and symbols from `Antigrav_v1.md`, `Antigrav_Dev_v1.md`, and AGT package lineage into one source glossary | `docs/Technology/programs/agt/theory/tables/agt_symbol_and_status_glossary.tex` |
| AGT-02 | `done` | Write the clean AGT theory manuscript skeleton with section map, bibliography stub, and theorem-status policy | `docs/Technology/programs/agt/theory/latex/agt_theory_main.tex` |
| AGT-03 | `done` | Write the clean AGT computational manuscript skeleton anchored to the `agt_v11c` toy line and P3 prototype route | `docs/Technology/programs/agt/computational/latex/agt_computational_main.tex` |
| AGT-04 | `done` | Import and normalize the live `agt_v11c` code into the canonical software tree with release manifest | `docs/Technology/programs/agt/software/src/` |
| AGT-05 | `done` | Add reproducibility tests and config normalization for the AGT toy-model line | `docs/Technology/programs/agt/software/tests/` |
| AGT-06 | `done` | Convert AGT prototype and lab packages into clean protocol notes and calibration sheets | `docs/Technology/programs/agt/hardware/protocols/` and `docs/Technology/programs/agt/hardware/calibration/` |
| AGT-07 | `done` | Create the applied Lean statement inventory for AGT residue sectors, signed source laws, and observer-level force statements | `PhysicsLean/PhysicsLean/Technology/AGT/README.md` |
| AGT-08 | `done` | Formalize the first AGT definitions and target-theorem stubs in Lean | `PhysicsLean/PhysicsLean/Technology/AGT/` |
| AGT-09 | `done` | Link AGT numerical experiments into the PhysicsLean experiment suite | `PhysicsLean/experiments/src/physics_experiments/technology/agt/` |

## FTL backlog

| ID | Status | Task | Output path |
| --- | --- | --- | --- |
| FTL-01 | `done` | Consolidate the soft/hard route vocabulary, mission metrics, and stage ledger from `FTL_v1.md`, `FTL_Dev_v1.md`, roadmap files, and archive reports | `docs/Technology/programs/ftl/theory/tables/ftl_symbol_and_stage_glossary.tex` |
| FTL-02 | `done` | Write the clean FTL theory manuscript skeleton covering observer-relative soft FTL, carrier-cycle hard FTL, and material assumptions | `docs/Technology/programs/ftl/theory/latex/ftl_theory_main.tex` |
| FTL-03 | `done` | Write the clean FTL computational manuscript skeleton anchored to the frozen numerical baseline and stage 4-6 closeout | `docs/Technology/programs/ftl/computational/latex/ftl_computational_main.tex` |
| FTL-04 | `done` | Reconstruct a canonical live source tree from the frozen baseline, array closeout, bench closeout, and mission archives | `docs/Technology/programs/ftl/software/src/` |
| FTL-05 | `done` | Normalize configs, regression scripts, and report exporters for the canonical FTL package | `docs/Technology/programs/ftl/software/configs/` and `docs/Technology/programs/ftl/software/tests/` |
| FTL-06 | `done` | Write clean physical-device protocol placeholders for soft array and hard bench campaigns | `docs/Technology/programs/ftl/hardware/protocols/` |
| FTL-07 | `done` | Create the Lean statement inventory for soft link sectors, hard carrier cycles, mission control predicates, and admissibility conditions | `PhysicsLean/PhysicsLean/Technology/FTL/README.md` |
| FTL-08 | `done` | Formalize the first FTL definitions and theorem stubs in Lean | `PhysicsLean/PhysicsLean/Technology/FTL/` |
| FTL-09 | `done` | Link canonical FTL numerical experiments into the PhysicsLean experiment suite | `PhysicsLean/experiments/src/physics_experiments/technology/ftl/` |

## Materialization backlog

| ID | Status | Task | Output path |
| --- | --- | --- | --- |
| MAT-01 | `done` | Normalize terminology and hierarchy labels from `Matria_v1.md`, `Matria_Dev_v1.md`, and the P0 bundle into one glossary | `docs/Technology/programs/materia/theory/tables/materialization_symbol_and_status_glossary.tex` |
| MAT-02 | `done` | Write the clean materialization theory manuscript skeleton with imported-foundation block, hierarchy block, and audit block | `docs/Technology/programs/materia/theory/latex/materialization_theory_main.tex` |
| MAT-03 | `done` | Write the clean computational manuscript skeleton centered on the P0 prototype and lower theorem chain | `docs/Technology/programs/materia/computational/latex/materialization_computational_main.tex` |
| MAT-04 | `done` | Import the P0 prototype bundle into the canonical software tree with a reproducible entry point | `docs/Technology/programs/materia/software/src/` |
| MAT-05 | `done` | Add tests, configs, and report contracts for the P0 computational line | `docs/Technology/programs/materia/software/tests/` and `docs/Technology/programs/materia/software/configs/` |
| MAT-06 | `done` | Write clean physical protocol placeholders for post-P0 material growth and validation campaigns | `docs/Technology/programs/materia/hardware/protocols/` |
| MAT-07 | `done` | Create the Lean statement inventory for specification, precursor reservoirs, assembly channels, and persistence predicates | `PhysicsLean/PhysicsLean/Technology/Materialization/README.md` |
| MAT-08 | `done` | Formalize the first materialization definitions and theorem stubs in Lean | `PhysicsLean/PhysicsLean/Technology/Materialization/` |
| MAT-09 | `done` | Link canonical materialization experiments into the PhysicsLean experiment suite | `PhysicsLean/experiments/src/physics_experiments/technology/materialization/` |

## Order of execution

1. Complete the three glossary-and-ledger tasks `AGT-01`, `FTL-01`, and `MAT-01`.
2. Write the six manuscript skeletons `AGT-02` through `MAT-03`.
3. Normalize the three canonical software trees `AGT-04`, `FTL-04`, and `MAT-04` with minimal tests.
4. Build the three Lean statement inventories before starting theorem files.
5. Start formalization only after the glossary and manuscript skeletons stabilize terminology.

## Post-skeleton Lean cleanup order

The detailed applied-technology Lean cleanup protocol now lives at:

- `PhysicsLean/docs/technology_formalization_execution_order.md`

Use that document as the canonical execution order for all work after the initial skeleton stage.