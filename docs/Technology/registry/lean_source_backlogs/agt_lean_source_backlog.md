# AGT Lean Formalization Backlog

Source file: `docs/Technology/Antigrav_v1.md`

Exact source length: `14046` lines.

Target namespace root: `PhysicsLean/PhysicsLean/Technology/AGT/Source/`

Coverage rule:

- the ranges below are contiguous and inclusive;
- together they cover source lines `1-14046` with no gaps;
- the listed Lean files are the files that must exist after source-aligned formalization.

| ID | Source lines | Source block | Lean files that must exist | Formalization scope |
| --- | --- | --- | --- | --- |
| AGT-S01 | `1-360` | Initial project statement and first AGT-1 sketch | `000_ProjectScope.lean`, `001_ProjectKernel.lean` | Project object `𝔄`, primitive `σ_g`, initial axiom package AG1-AG7, first force formulas, first target theorem shell, first failure-mode wrappers. |
| AGT-S02 | `361-789` | `AGT-1 v0.1` protocol block | `002_Protocol.lean`, `003_StatusLabels.lean` | Source status labels `[A]/[D]/[T]`, imported-layer declarations, Chapter 0 protocol objects, chapter-level dependency wrappers. |
| AGT-S03 | `790-1303` | Chapter 1. Grav-Residue Calculus and Neutral Composite Sectors | `010_GravResidueCalculus.lean`, `011_NeutralCompositeSectors.lean`, `012_SpectralResidueBridge.lean` | Definitions AG1-AG21, rewrite/transfer stability, signed channel, probe energy/force, neutral composites, multipole refinement, AG-T1 and AG-T2 wrappers, chapter failure modes. |
| AGT-S04 | `1304-1817` | Chapter 2. Microscopic Realizations of Grav-Residue | `020_MicroscopicGravCharge.lean`, `021_OrientedShellDefects.lean`, `022_MicroscopicSpectralCharge.lean` | Integer grav-charge, oriented shell defect model, microscopic axioms AG28-AG31, composite rules AG35-AG36, dipole structure, microscopic target theorems AG-T3 to AG-T5. |
| AGT-S05 | `1818-2360` | Chapter 3. Field Regimes, Screening, and Antigravity Phases | `030_FieldChargeDensity.lean`, `031_ScreeningTheory.lean`, `032_PhaseClassification.lean` | Field densities AG44-AG50, two-component media AG51-AG53, screening ansatz AG54-AG55, segregation/free-energy order parameters AG58-AG60, phase predicates AG62-AG66, AG-T6 wrapper. |
| AGT-S06 | `2361-2846` | Chapter 4. Interfaces, Domain Walls, Grav-Dipoles, and Antigravity Bubbles | `040_DomainWalls.lean`, `041_GravDipoles.lean`, `042_AntigravityBubbles.lean` | Domain wall objects, interface observables, dipoles, neutral shells, bubble sectors, wall/bubble transition criteria, interface failure modes. |
| AGT-S07 | `2847-3406` | Chapter 5. Test Bodies, Orbits, and Transport in Antigravity Backgrounds | `050_TestBodies.lean`, `051_OrbitalTransport.lean`, `052_BackgroundScattering.lean` | Test-body definitions, capture/repulsion/drift/scattering/trapping regimes, background transport predicates, orbit and scattering wrappers. |
| AGT-S08 | `3407-4027` | Chapter 6. Spectral and Kernel Realization of Antigravity Transport | `060_SpectralTransportKernel.lean`, `061_ResolventTransport.lean`, `062_MarkedMomentDictionary.lean` | Kernel/resolvent realization of `q_g`, `φ_g`, transport, walls, bubbles, marked moments, branch extraction and observer-shadow compatibility. |
| AGT-S09 | `4028-4630` | Chapter 7. Cosmological and Large-Scale Consequences of Mixed Grav-Sectors | `070_LargeScaleMedium.lean`, `071_RepulsiveVoids.lean`, `072_MixedMediumHydrodynamics.lean` | Large-scale mixed media, repulsive voids, domain networks, hydrodynamic closures, cosmology-facing phase statements. |
| AGT-S10 | `4631-5297` | Chapter 8. Observational Program, Computational Pipeline, and Falsifiability | `080_ObservationalProgram.lean`, `081_ComputationalPipeline.lean`, `082_FalsifiabilityAudit.lean` | Six-level computational schema, measurable checkpoints, falsifiability clauses, audit wrappers for predicted and excluded outcomes. |
| AGT-S11 | `5298-6226` | Full roadmap and closure logic | `090_StatusRoadmap.lean`, `091_ClosureCriteria.lean` | Project statuses, closure phases, critical path claims, “full closure” predicates, source-level roadmap provenance. |
| AGT-S12 | `6227-6762` | Toy Model v1.0 Technical Note 1 | `100_ToyV10FiniteKernel.lean`, `101_ToyV10OnShellBranch.lean` | Finite graph, marked kernel, dominant branch, on-shell extraction, first numerical semantics for `Q_g^{spec}` and sign-sensitive transport. |
| AGT-S13 | `6763-7357` | Toy Model v1.0 Numerical Sheet 1 | `102_ToyV10Criteria.lean` | Formal numerical checkpoints C1-C5 as theorem-status wrappers and computational-schema declarations. |
| AGT-S14 | `7358-7978` | Toy Model v1.0 Numerical Sheet 2 | `103_ToyV10Protocol.lean` | Ready-to-run parameter packs, scan protocol objects, run-group declarations, success/failure sheet wrappers. |
| AGT-S15 | `7979-8566` | Toy Model v1.0 Numerical Sheet 3 | `104_ToyV10SanityWindows.lean` | Analytic sanity checks, expected parameter windows, nondegeneracy windows, weak-field applicability bundles. |
| AGT-S16 | `8567-9175` | Toy Model v1.0 Numerical Sheet 4 / implementation blueprint | `105_ToyV10ImplementationBlueprint.lean` | Data structures, background builders, kernel module contracts, spectral extraction contracts, output schema wrappers. |
| AGT-S17 | `9176-9751` | Toy Model v1.1 minimal inhomogeneous background, wall, and bubble | `110_ToyV11BackgroundField.lean`, `111_ToyV11WallBubbleKernel.lean` | Local order field `h(i)`, wall and bubble backgrounds, inhomogeneous charged blocks, background-phase interpretation. |
| AGT-S18 | `9752-10123` | Toy Model v1.1 wall and bubble runs | `112_ToyV11WallBubbleRuns.lean` | Wall/bubble run protocol, local kernels, observables, run families and regime predicates. |
| AGT-S19 | `10124-10661` | Toy Model v1.1 Technical Note 2 | `113_ToyV11Thresholds.lean` | Analytic thresholds for wall reflection, bubble capture, quasi-capture, selectivity and loss-sensitive thresholds. |
| AGT-S20 | `10662-11196` | Toy Model v1.1 Numerical Sheet v1.1b | `114_ToyV11ScanProtocol.lean` | Threshold-guided scan plans, parameter windows, heatmap contracts, decision trees and run outcome wrappers. |
| AGT-S21 | `11197-11644` | Toy Model v1.1 Technical Note 3 | `115_ToyV11Resonance.lean` | Resonant wall modes, bubble dwell states, quasi-bound branches, resonance selectivity, spectral dwell-time objects. |
| AGT-S22 | `11645-12236` | Toy Model v1.1 Numerical Sheet v1.1c | `116_ToyV11ResonanceRuns.lean` | Dwell-time scans, resonance observables, peak extraction, resonance success/failure criteria, safe resonance windows. |
| AGT-S23 | `12237-13100` | Toy Model v1.1 implementation blueprint | `117_ToyV11ImplementationBlueprint.lean` | Source-aligned code architecture, data contracts, module boundaries, summary metrics, stable run orchestration. |
| AGT-S24 | `13101-14046` | Roadmap AGT-1, critical path, closure boundary, next move | `118_ProjectRoadmap.lean`, `119_ProjectAuditBoundary.lean` | Final source roadmap, critical path, closure definition, immediate/then/only-then sequencing, engineering-transition boundary wrappers. |

## Planned Lean file set

- `PhysicsLean/PhysicsLean/Technology/AGT/Source/000_ProjectScope.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/001_ProjectKernel.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/002_Protocol.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/003_StatusLabels.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/010_GravResidueCalculus.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/011_NeutralCompositeSectors.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/012_SpectralResidueBridge.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/020_MicroscopicGravCharge.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/021_OrientedShellDefects.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/022_MicroscopicSpectralCharge.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/030_FieldChargeDensity.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/031_ScreeningTheory.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/032_PhaseClassification.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/040_DomainWalls.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/041_GravDipoles.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/042_AntigravityBubbles.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/050_TestBodies.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/051_OrbitalTransport.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/052_BackgroundScattering.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/060_SpectralTransportKernel.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/061_ResolventTransport.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/062_MarkedMomentDictionary.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/070_LargeScaleMedium.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/071_RepulsiveVoids.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/072_MixedMediumHydrodynamics.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/080_ObservationalProgram.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/081_ComputationalPipeline.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/082_FalsifiabilityAudit.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/090_StatusRoadmap.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/091_ClosureCriteria.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/100_ToyV10FiniteKernel.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/101_ToyV10OnShellBranch.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/102_ToyV10Criteria.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/103_ToyV10Protocol.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/104_ToyV10SanityWindows.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/105_ToyV10ImplementationBlueprint.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/110_ToyV11BackgroundField.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/111_ToyV11WallBubbleKernel.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/112_ToyV11WallBubbleRuns.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/113_ToyV11Thresholds.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/114_ToyV11ScanProtocol.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/115_ToyV11Resonance.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/116_ToyV11ResonanceRuns.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/117_ToyV11ImplementationBlueprint.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/118_ProjectRoadmap.lean`
- `PhysicsLean/PhysicsLean/Technology/AGT/Source/119_ProjectAuditBoundary.lean`