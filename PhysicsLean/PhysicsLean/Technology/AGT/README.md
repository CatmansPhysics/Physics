# AGT Lean Package

Canonical namespace for the antigravity technology formalization.

## Source anchors

- theory manuscript: `docs/Technology/programs/agt/theory/latex/agt_theory_main.tex`
- computational manuscript: `docs/Technology/programs/agt/computational/latex/agt_computational_main.tex`
- canonical glossary: `docs/Technology/programs/agt/theory/tables/agt_symbol_and_status_glossary.tex`

## Status policy

This package follows `PhysicsLean/docs/theorem_status_policy.md`.

- use `def` for AGT language objects;
- use `theorem` only for closed internal results;
- use `conjecture` for AG-T target wrappers until a proof chain exists;
- isolate any imported assumptions explicitly.

## First module inventory

1. `GravResidue.lean`
Definitions for grav-residue values, grav-residue observables, residue classes, and transfer-compatible equality.

2. `SignedSource.lean`
Definitions for signed source densities, observer-level potential interfaces, and probe interaction energy.

3. `CompositeSectors.lean`
Definitions for composite grav-residue closures, neutral composites, and minimal closure ansatz wrappers.

4. `Targets.lean`
Conjecture wrappers for repulsive scaling and spectral/observer compatibility.

5. `Axioms.lean`
Isolated imported-background assumptions for residue rewrite preservation, observer-force linkage, spectral separation, and neutral closure.

6. `Theorems.lean`
First closed internal lemmas plus explicit skeleton wrappers that will later be replaced by proof chains.

## First formal objects

- `GravSign`
- `GravResidueObservable`
- `GravResidueClass`
- `TransferStableGravResidue`
- `SignedSourceDensity`
- `ObserverPotential`
- `ProbeInteractionEnergy`
- `EffectiveForce`
- `CompositeGravResidue`

## First target statements

- grav-residue rewrite invariance;
- grav-residue transfer stability;
- grav-residue distinct from mass-like spectral data;
- neutral composite closure statement;
- repulsive scaling window conjecture;
- spectral/observer compatibility conjecture.

## Dependencies

- `PhysicsLean.StructuralCore`
- `PhysicsLean.ObserverDynamics`
- selected `PhysicsLean.ContinuumField` interfaces for observer-level potential placeholders

## Planned experiment link

Canonical experiment namespace to pair with this package:

- `PhysicsLean/experiments/src/physics_experiments/technology/agt/`