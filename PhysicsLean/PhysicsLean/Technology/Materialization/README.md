# Materialization Lean Package

Canonical namespace for the materialization technology formalization.

## Source anchors

- theory manuscript: `docs/Technology/programs/materia/theory/latex/materialization_theory_main.tex`
- computational manuscript: `docs/Technology/programs/materia/computational/latex/materialization_computational_main.tex`
- canonical glossary: `docs/Technology/programs/materia/theory/tables/materialization_symbol_and_status_glossary.tex`

## Status policy

This package follows `PhysicsLean/docs/theorem_status_policy.md`.

- use `def` for specification, precursor, and channel objects;
- use `conjecture` for hierarchy-level target theorems not yet closed;
- keep imported material-class and observer-relative assumptions isolated from project-internal definitions.

## First module inventory

1. `Specification.lean`
Definitions for observer-level specifications, predicate families, defect budgets, persistence windows, and observer-equivalence.

2. `Precursor.lean`
Definitions for precursor reservoirs, resource profiles, and the no-ex-nihilo admissibility boundary.

3. `Assembly.lean`
Definitions for assembly histories, controlled channels, and target-reaching channels.

4. `Success.lean`
Definitions for soft materialization, hard materialization, and successful materialization.

5. `Crystalline.lean`
Top-level wrappers and witness theorems for the crystalline target, defect calculus, crystallization channels, and post-control persistence bridge.

6. `Monatomic.lean`
Top-level wrappers and witness theorems for monatomic targets, seed sectors, growth histories, completion functionals, and the seeded-completion bridge.

7. `Hierarchy.lean`
Definitions for the hierarchy labels `H0` through `H8` and their status wrappers.

8. `Targets.lean`
Conjecture wrappers for no-ex-nihilo, soft/hard separation, observer-relative identity, and minimal precursor theorems.

9. `Axioms.lean`
Isolated imported-background assumptions for observer identity, resource accounting, precursor minimality, and hierarchy transitions.

10. `Theorems.lean`
First closed internal lemmas plus explicit skeleton wrappers that will later be replaced by proof chains.

## First formal objects

- `ObserverSpecification`
- `PredicateFamily`
- `DefectBudget`
- `PersistenceWindow`
- `PrecursorReservoir`
- `ResourceProfile`
- `AssemblyHistory`
- `ControlledAssemblyChannel`
- `SoftMaterialization`
- `HardMaterialization`
- `SuccessfulMaterialization`
- `CrystallineTargetSpecification`
- `CrystallineDefectSector`
- `CrystallinePrecursorReservoir`
- `CrystallineAssemblyChannel`
- `MonatomicTargetSpecification`
- `MonatomicSeedSector`
- `MonatomicGrowthHistory`
- `MonatomicCompletionFunctional`

## First target statements

- no-ex-nihilo conjecture;
- soft/hard separation conjecture;
- observer-relative identity conjecture;
- minimal precursor conjecture;
- first H0 hard-body admissibility wrapper.

## Dependencies

- `PhysicsLean.ObserverDynamics`
- `PhysicsLean.HigherOrganization`
- selected `PhysicsLean.ContinuumField` or `PhysicsLean.QuantumStat` interfaces only if later hierarchy levels require them

## Planned experiment link

Canonical experiment namespace to pair with this package:

- `PhysicsLean/experiments/src/physics_experiments/technology/materialization/`