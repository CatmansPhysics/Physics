# Technology Formalization Execution Order

This document defines the stable execution order for cleaning the applied-technology Lean layer under `PhysicsLean/PhysicsLean/Technology/`.

The goal is to let work proceed in small, repeatable batches without needing to reload the full project context on every turn.

## Current state

The source-backed AGT, FTL, and Materialization packages are now completed and
the technology subtree builds cleanly without `axiom` declarations or `sorry`
placeholders.

This document therefore serves two roles:

1. the historical execution order that produced the clean packages;
2. the maintenance order for any future local cleanup or extension work.

## Global rule

Always work in narrow batches:

1. one technology at a time;
2. one local dependency chain at a time;
3. at most two definition modules plus one theorem module per batch;
4. run local diagnostics after edits and `lake build` after every completed batch.

Do not mix AGT, FTL, and Materialization proof work in the same batch unless the task is only a shared naming or import cleanup.

## Cleaning order

The cleaning order is fixed.

1. Close internal definitional lemmas.
2. Close internal transport lemmas and equivalence lemmas.
3. Replace theorem-layer stub axioms with real proofs whenever they depend only on already formalized local definitions.
4. Keep target wrappers as open targets until a complete dependency chain exists.
5. Replace imported-background axioms only after the needed lower-layer interfaces already exist in the main PhysicsLean hierarchy.

This means the project should move from:

- definitions;
- easy internal theorems;
- local structural lemmas;
- bridge theorems;
- target theorems;
- imported-background cleanup.

## Technology order

The technology order is also fixed.

1. AGT
2. FTL
3. Materialization

Reason:

- AGT has the smallest local skeleton and the least mission/control structure.
- FTL depends on more observer-relative and control-level glue.
- Materialization has the widest object surface and the most likely future cross-links to higher-organization modules.

## AGT batch order

Use this exact sequence.

1. `GravResidue.lean`
   Close equality, invariance under explicit transfer relations, and residue-class helper lemmas.
2. `SignedSource.lean`
   Close observer-potential and effective-force helper lemmas that are definitional or direct unfoldings.
3. `CompositeSectors.lean`
   Close neutral-composite and component-level helper lemmas.
4. `Theorems.lean`
   Replace theorem stubs that now depend only on steps 1-3.
5. `Axioms.lean`
   Shrink background assumptions only if lower layers already support the replacement.
6. `Targets.lean`
   Keep open wrappers until the full AGT chain exists.

## FTL batch order

Use this exact sequence.

1. `SoftLink.lean`
   Close observer-relative and branch-lock helper lemmas.
2. `HardCarrier.lean`
   Close carrier-cycle and admissibility helper lemmas.
3. `MissionControl.lean`
   Close readiness and mission-admissibility helper lemmas.
4. `Theorems.lean`
   Replace theorem stubs that now depend only on steps 1-3.
5. `Axioms.lean`
   Shrink background assumptions only if lower layers already support the replacement.
6. `Targets.lean`
   Keep open wrappers until the full FTL chain exists.

## Materialization batch order

Use this exact sequence.

1. `Specification.lean`
   Close observer-equivalence and specification helper lemmas.
2. `Precursor.lean`
   Close resource-profile and no-ex-nihilo helper lemmas.
3. `Assembly.lean`
   Close channel and history helper lemmas.
4. `Success.lean`
   Close soft, hard, and successful-materialization structural lemmas.
5. `Hierarchy.lean`
   Close level and wrapper helper lemmas.
6. `Theorems.lean`
   Replace theorem stubs that now depend only on steps 1-5.
7. `Axioms.lean`
   Shrink background assumptions only if lower layers already support the replacement.
8. `Targets.lean`
   Keep open wrappers until the full materialization chain exists.

## Per-batch completion rule

Each batch is complete only if all of the following hold:

1. The edited files have no diagnostics.
2. The package still builds with `lake build`.
3. The theorem layer imports remain minimal.
4. No target wrapper is silently converted into a proved result unless its proof is actually present.
5. The next batch can be described in one short sentence.

## Maintenance rule after completion

For future changes in `Technology/`, preserve these invariants:

1. keep source-backed packages canonical and avoid parallel speculative wrapper theories;
2. prefer named bundled interfaces such as target suites, full backgrounds, and witness structures over flat conjunctions when a legacy wrapper layer is exposed;
3. re-read any source file before editing if external formatting or manual edits may have changed it;
4. validate with `lake build PhysicsLean.Technology.AGT PhysicsLean.Technology.FTL PhysicsLean` after any cross-technology cleanup.

## Context-control rule

To avoid context overflow, every future work cycle should report only:

1. the current technology;
2. the current batch files;
3. what stubs were removed or reduced;
4. whether `lake build` passed.

No full-project recap is needed after this protocol is in place.