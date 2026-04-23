# Chapter to Module Map

This file maps the book chapters in `docs/book/chapters/` to the planned Lean
packages in `PhysicsLean/`.

## Package map

- Chapters 0-3 -> `PhysicsLean/StructuralCore/`
- Chapters 4-8 -> `PhysicsLean/ObserverDynamics/`
- Chapters 8-11 -> `PhysicsLean/QuantumStat/`
- Chapters 12-16 -> `PhysicsLean/ContinuumField/`
- Chapters 17-20 -> `PhysicsLean/HigherOrganization/`
- Chapters 21-26 -> `PhysicsLean/StandardModel/`
- Chapter 27 -> `PhysicsLean/Audit/`

## Applied technology supplement

The applied-technology corpus in `docs/Technology/` is formalized separately
from the chapter packages above.

- AGT -> `PhysicsLean/Technology/AGT/*`
- FTL -> `PhysicsLean/Technology/FTL/*`
- Materialization -> `PhysicsLean/Technology/Materialization/*`

These packages are source-backed from the technology manuscripts rather than
from numbered book chapters.

## Phase 1 structural-core modules

- Chapter 1 -> `Foundations/*`, `StructuralCore/SEq/*`, `StructuralCore/SeqSEq/*`
- Chapter 2 -> `StructuralCore/HPattern/*`, `StructuralCore/EFU/*`
- Chapter 3 -> `StructuralCore/Series/*`, `StructuralCore/Transfer/*`
- Toy examples -> `StructuralCore/Models/ZSym/*` and `experiments/src/physics_experiments/core/*`

## Phase 2 observer-and-dynamics modules

- Chapter 4 -> `ObserverDynamics/Causal/*`, `ObserverDynamics/Observer/*`
- Chapter 5 -> `ObserverDynamics/Geometry/*`
- Chapters 6-7 -> `ObserverDynamics/Dynamics/*`
- Toy observer/dynamics examples -> `experiments/src/physics_experiments/observer/*` and `experiments/src/physics_experiments/dynamics/*`

## Phase 3 quantum-stat modules

- Chapter 8 -> `QuantumStat/Amplitudes/*`
- Chapter 9 -> `QuantumStat/Measurement/*`
- Chapters 10-11 -> `QuantumStat/Information/*`, `QuantumStat/Thermo/*`
- Toy quantum/stat examples -> `experiments/src/physics_experiments/quantum/*` and `experiments/src/physics_experiments/thermo/*`

## Phase 4 continuum-and-field modules

- Chapter 12 -> `ContinuumField/Transport/*`
- Chapter 13 -> `ContinuumField/Relativistic/*`
- Chapters 14-15 -> `ContinuumField/QFT/*`
- Chapter 16 -> `ContinuumField/ManyBody/*`

## Phase 5 higher-organization modules

- Chapter 17 -> `HigherOrganization/Chemistry/*`
- Chapter 18 -> `HigherOrganization/Biology/*`
- Chapter 19 -> `HigherOrganization/Cognition/*`, `HigherOrganization/Language/*`
- Chapter 20 -> `HigherOrganization/FormalKnowledge/*`

## Phase 6 standard-model modules

- Chapters 21-22 -> `StandardModel/Residue/*`, `StandardModel/Electroweak/*`
- Chapter 23 -> `StandardModel/Flavour/*`
- Chapter 24 -> `StandardModel/Color/*`
- Chapter 25 -> `StandardModel/Anomaly/*`
- Chapter 26 -> `StandardModel/Dictionary/*`

## Phase 7 audit modules

- Chapter 27 -> `Audit/Status/*`, `Audit/Dependency/*`, `Audit/FailureModes/*`, `Audit/Coverage/*`, `Audit/ComputationalSchema/*`, `Audit/Targets/*`