# FTL Lean Package

Canonical namespace for the faster-than-light transport technology formalization.

## Source anchors

- theory manuscript: `docs/Technology/programs/ftl/theory/latex/ftl_theory_main.tex`
- computational manuscript: `docs/Technology/programs/ftl/computational/latex/ftl_computational_main.tex`
- canonical glossary: `docs/Technology/programs/ftl/theory/tables/ftl_symbol_and_stage_glossary.tex`

## Status policy

This package follows `PhysicsLean/docs/theorem_status_policy.md`.

- use `def` for observer-relative predicates and carrier-cycle interfaces;
- use `conjecture` for soft and hard target theorems until a proof chain exists;
- keep observer-relative and medium-relative assumptions explicit in every statement wrapper.

## First module inventory

1. `SoftLink.lean`
Definitions for soft link sectors, branch-locked sectors, binary witness predicates, and observer-relative readout conditions.

2. `HardCarrier.lean`
Definitions for luminal reference sectors, carrier sectors, carrier cycles, and hard transport admissibility.

3. `MissionControl.lean`
Definitions for mission-level readiness predicates, soft-to-hard scheduling, and integrated control records.

4. `Targets.lean`
Conjecture wrappers for repeatable soft witness, hard carrier repeatability, and integrated mission admissibility.

5. `Axioms.lean`
Isolated imported-background assumptions for soft witnesses, hard cycles, mission stack coherence, and medium-relative calibration.

6. `Theorems.lean`
First closed internal lemmas plus explicit skeleton wrappers that will later be replaced by proof chains.

## First formal objects

- `LuminalReferenceSector`
- `ObserverRelativeFTL`
- `SoftLinkSector`
- `BranchLockedSoftSector`
- `SoftWitness`
- `HardCarrierCycle`
- `CompositeCarrierCycle`
- `MissionReadinessPredicate`
- `SoftHardIntegrationRecord`

## First target statements

- branch-locked binary witness conjecture;
- soft witness repeatability conjecture;
- one-pole hard-cycle admissibility conjecture;
- composite hard-cycle repeatability conjecture;
- integrated soft-to-hard mission admissibility conjecture.

## Dependencies

- `PhysicsLean.ObserverDynamics`
- `PhysicsLean.QuantumStat`
- `PhysicsLean.ContinuumField`
- selected `PhysicsLean.HigherOrganization` interfaces only where memory-like or control-like predicates are needed

## Planned experiment link

Canonical experiment namespace to pair with this package:

- `PhysicsLean/experiments/src/physics_experiments/technology/ftl/`