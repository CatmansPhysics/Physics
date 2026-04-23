# PhysicsLean

`PhysicsLean` is the standalone Lean and Python workspace for formalizing the
theory developed in `docs/book`.

## Boundary with SymSeq

- Development continues in `PhysicsLean/`, not in `SymSeq/`.
- `SymSeq/` is treated as a source repository for structural-core modules that
  are copied and adapted here.
- The RH-oriented analytic branch and the prime-transfer branch are excluded
  from the initial port.

## Phase 0 status

This workspace currently provides:

- an independent `lakefile.lean` and `lean-toolchain`;
- a root Lean module `PhysicsLean.lean`;
- project documentation for chapter mapping, port scope, statement status, and
  experiment tracking;
- a minimal Python experiment package with a smoke test;
- a completed applied-technology Lean layer under `PhysicsLean/Technology/`
  for AGT, FTL, and Materialization, backed by the `docs/Technology` corpus.

## Current split

The workspace now has two active tracks:

- the book-aligned foundational track under `Foundations`, `StructuralCore`,
  `ObserverDynamics`, `QuantumStat`, `ContinuumField`, `HigherOrganization`,
  `StandardModel`, and `Audit`;
- the applied-technology track under `Technology`, where AGT, FTL, and
  Materialization have source-backed Lean packages and linked experiment hooks.

## Immediate next step

The next book-side step remains the staged port from `SymSeq` into the
`PhysicsLean` namespace:

- `Foundations`
- `SEq`
- `SeqSEq`
- `Models/ZSym`
- `HPattern`
- `EFU`
- `Series`
- `Transfer`