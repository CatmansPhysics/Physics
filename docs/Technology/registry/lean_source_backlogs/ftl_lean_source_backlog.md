# FTL Lean Formalization Backlog

Source file: `docs/Technology/FTL_v1.md`

Exact source length: `20844` lines.

Target namespace root: `PhysicsLean/PhysicsLean/Technology/FTL/Source/`

Coverage rule:

- the ranges below are contiguous and inclusive;
- together they cover source lines `1-20844` with no gaps;
- repeated chapter rewrites in the source are kept as separate covered ranges;
- computational, audit, and engineering-boundary text is still assigned to Lean files as source-aligned schemas and status wrappers.

| ID | Source lines | Source block | Lean files that must exist | Formalization scope |
| --- | --- | --- | --- | --- |
| FTL-S01 | `1-10` | File preamble before first section | `000_FilePreamble.lean` | Source provenance, file-level scope labels, imported prerequisites for the FTL project. |
| FTL-S02 | `11-372` | X.14. Candidate constructions for a non-factorizable soft link-sector | `010_CandidateSurvey.lean`, `011_SoftCandidatePackages.lean` | Candidate classes I-IV, minimal design criteria, comparison logic, package selection criteria, source-level “Candidate II first” claim. |
| FTL-S03 | `373-1056` | X.15 and early FTL inversion / baseline superluminal framing | `020_BranchLockedSoftSector.lean`, `021_SuperluminalStatus.lean` | Branch-locked soft sector entry point, observer-relative FTL framing, luminal-sector comparison objects, early soft/hard split definitions. |
| FTL-S04 | `1057-1920` | Soft FTL and Hard FTL as two regimes | `030_SoftHardSplit.lean`, `031_SoftProtocolOverview.lean`, `032_HardProtocolOverview.lean` | Two-regime axiologic split, soft protocol, hard protocol, target theorem shells S-FTL and H-FTL, first failure mode bundles. |
| FTL-S05 | `1921-2300` | Chapter X. Soft and Hard FTL Protocols in Structural-Physical Theory | `040_ObserverLuminalFramework.lean`, `041_SoftProtocolCore.lean`, `042_HardProtocolCore.lean` | Observer, reference luminal sector, FTL status, soft definitions X.3.*, hard definitions X.4.*, protocol comparison, compact theorem schemas. |
| FTL-S06 | `2301-2769` | X.7. Minimal computational recipe for Soft-0 and Hard-0 | `050_ComputationalRecipe.lean`, `051_SoftRecipe.lean`, `052_HardRecipe.lean` | Input data, soft recipe steps, hard recipe steps, figure-of-merit schemas, computational assumptions. |
| FTL-S07 | `2770-3303` | X.8. Toy worked micro-examples | `060_ToyWorkedExamples.lean`, `061_SoftMicroExample.lean`, `062_HardMicroExample.lean` | Worked micro-examples, explicit toy calculations, final comparison of soft/hard micro-cases. |
| FTL-S08 | `3304-3843` | X.9. From toy examples to target theorem packages | `070_TargetTheoremPackages.lean` | Soft and hard theorem-package structures, dependency bundling from toy data to general statements. |
| FTL-S09 | `3844-4338` | X.10. Minimal axiomatic package | `080_MinimalAxioms.lean` | Common axioms, soft-specific axioms, hard-specific axioms, compact total package. |
| FTL-S10 | `4339-4768` | X.11. Dependency graph | `081_DependencyGraph.lean` | Explicit dependency graph wrappers and source-aligned theorem ordering constraints. |
| FTL-S11 | `4769-5042` | X.12. Coverage matrix | `082_CoverageMatrix.lean` | Coverage matrices for soft and hard claims, side-by-side comparison, audit labels, checkpoints. |
| FTL-S12 | `5043-5528` | X.13. Minimal research program and closure order | `083_ClosureOrder.lean` | Closure order, remaining blocks, minimal research sequence, readiness checkpoints. |
| FTL-S13 | `5529-5890` | Reintroduced X.14 candidate constructions | `010_CandidateSurvey.lean`, `084_NonFactorizableSoftSector.lean` | Second source pass of candidate logic; provenance-aligned restatement file preserving rewritten candidate text. |
| FTL-S14 | `5891-6307` | X.15. Precise branch-locked soft sector | `090_BranchLockedSoftSector.lean` | Exact branch-locked soft-sector definitions, first binary witness statement, failure bundle. |
| FTL-S15 | `6308-6907` | X.16. Explicit two-branch family | `091_ExplicitTwoBranchFamily.lean` | Explicit family of states, binary distinguishability objects, first concrete witness model. |
| FTL-S16 | `6908-7354` | X.17. Kernel-generated two-branch soft family | `092_KernelGeneratedSoftFamily.lean` | Kernel-generated soft family, robustness question, derived detector-state maps. |
| FTL-S17 | `7355-7874` | X.18. Finite-state observer-amplitude automaton | `093_FiniteStateAutomaton.lean` | Finite-state automaton semantics for soft witness sectors. |
| FTL-S18 | `7875-8375` | X.19. Finite-alphabet extension and scanner theorem | `094_FiniteAlphabetScanner.lean` | Finite alphabet readout, scanner metrics, finite scanner theorem wrappers. |
| FTL-S19 | `8376-8811` | X.20. Scanner readout dynamics, memory persistence, operational soft protocol | `095_ScannerReadoutDynamics.lean`, `096_SoftOperationalProtocol.lean` | Readout dynamics, memory persistence, operational protocol clauses, protocol success criteria. |
| FTL-S20 | `8812-9328` | X.21. Hierarchical soft scanner | `097_HierarchicalSoftScanner.lean` | Multi-scale labels, remote-scene approximation, hierarchical scanner objects. |
| FTL-S21 | `9329-9714` | X.22. Soft robustness and closure | `098_SoftRobustness.lean` | Robustness of hierarchical soft scanner, soft-closure statement and failure modes. |
| FTL-S22 | `9715-10047` | X.23. Candidate superluminal hard carrier sectors | `100_HardCarrierCandidates.lean` | Hard carrier candidate classes, selection logic, initial hard sector architecture. |
| FTL-S23 | `10048-10548` | X.24. Branch-transfer hard carrier | `101_BranchTransferHardCarrier.lean` | Precise hard carrier definition, one-pole transport problem setup. |
| FTL-S24 | `10549-11029` | X.25. Explicit two-branch hard carrier family | `102_ExplicitHardCarrierFamily.lean` | Explicit family, one-pole transport model, branch-transfer data. |
| FTL-S25 | `11030-11326` | X.26. Projected resolvent and first hard observability criterion | `103_ProjectedResolventPole.lean` | Projected resolvent objects, pole observability criteria, hard physical witness bundles. |
| FTL-S26 | `11327-11784` | X.27. Pole survival for the explicit family | `104_PoleSurvival.lean` | Pole survival statements and explicit-family specialization. |
| FTL-S27 | `11785-12190` | X.28. Identity preservation for the explicit hard carrier cycle | `105_IdentityPreservation.lean` | Identity-fidelity objects and explicit cycle preservation criteria. |
| FTL-S28 | `12191-12668` | X.29. Binding stability and first composite hard criterion | `106_BindingStability.lean` | Composite binding stability, first composite hard admissibility criterion. |
| FTL-S29 | `12669-13171` | X.30. Explicit composite hard carrier model | `107_CompositeHardCarrierModel.lean` | Explicit composite carrier example and bound-transport model. |
| FTL-S30 | `13172-13651` | X.31. Robustness of one-pole and composite hard transport | `108_HardRobustness.lean` | Hard-closure robustness problem, explicit and open-class wrappers. |
| FTL-S31 | `13652-13943` | X.32. Remaining target theorems for hard closure | `109_HardRemainingTargets.lean` | Final hard target wrappers before closure. |
| FTL-S32 | `13944-14514` | X.33. Final roadmap for completing the FTL chapter | `110_HardRoadmap.lean` | Completion roadmap, sequencing of remaining hard blocks. |
| FTL-S33 | `14515-14802` | X.34. H-C1 carrier-existence theorem and proof plan | `111_GeneralCarrierExistence.lean` | General carrier-existence theorem bundle and proof-plan objects. |
| FTL-S34 | `14803-15016` | X.35. Desynchronization criteria | `112_DesynchronizationCriteria.lean` | Desynchronization criteria for hard carriers. |
| FTL-S35 | `15017-15292` | X.36. Nonempty kernel class | `113_NonemptyKernelClass.lean` | Existence of nonempty desynchronized kernel class. |
| FTL-S36 | `15293-15572` | X.37. Strong desynchronization openness | `114_StrongDesynchronization.lean` | Openness of strong desynchronization and strong H-C1 theorem wrapper. |
| FTL-S37 | `15573-15806` | X.38. From sector-resolved pole to physical projected pole | `115_PhysicalProjectedPole.lean` | Lift from sector poles to physical projected poles. |
| FTL-S38 | `15807-16039` | X.39. Hard physical admissibility and projection compatibility | `116_HardPhysicalAdmissibility.lean` | Admissibility classes and projection-compatibility criteria. |
| FTL-S39 | `16040-16283` | X.40. Audited hard observer class | `117_AuditedHardObserverClass.lean` | Observer-class audit wrappers for explicit carrier families. |
| FTL-S40 | `16284-16527` | X.41. Retention of transported on-shell branch | `118_OnShellBranchRetention.lean` | Retention criteria for transported on-shell branches in projected effective kernels. |
| FTL-S41 | `16528-16833` | X.42. General one-pole identity theorem | `119_GeneralOnePoleIdentity.lean` | From cycle control to general one-pole identity theorem. |
| FTL-S42 | `16834-17131` | X.43. General composite binding-observability theorem | `120_GeneralCompositeBindingObservability.lean` | Composite carrier prototype lift to general binding-observability theorem. |
| FTL-S43 | `17132-17499` | X.44. Lift to an open admissible class | `121_OpenAdmissibleHardClass.lean` | Open-class hard lifting theorem and final hard-closure statement. |
| FTL-S44 | `17500-17632` | X.45. Final audit and pre-engineering closure frontier | `130_FinalAudit.lean` | Theoretical closure, pre-engineering boundary, audited frontier. |
| FTL-S45 | `17633-17871` | X.46. Remaining theoretical blocks before engineering | `131_PreEngineeringBlocks.lean` | E-C1 to E-C6 as pending or closing theorem families. |
| FTL-S46 | `17872-17994` | X.47-X.50. New working order, closure meaning, next step | `132_PreEngineeringRoadmap.lean` | Working order, all-questions-closed criterion, status on the new scale, next-step wrappers. |
| FTL-S47 | `17995-18481` | X.51. Quantitative calibration theorem for soft FTL | `133_SoftCalibration.lean` | Quantitative soft calibration theorem and calibration data schema. |
| FTL-S48 | `18482-19058` | X.52. Quantitative calibration theorem for hard FTL | `134_HardCalibration.lean` | Quantitative hard calibration theorem and calibration bundles. |
| FTL-S49 | `19059-19515` | X.53. Control-theoretic closure | `135_ControlClosure.lean` | Soft control closure, hard control closure, unified control theorem. |
| FTL-S50 | `19516-19942` | X.54. Thermodynamic and resource closure | `136_ResourceClosure.lean` | Resource/thermodynamic closure for soft, hard, and unified protocols. |
| FTL-S51 | `19943-20319` | X.55. Material embedding | `137_MaterialEmbedding.lean` | Material embedding theorem families for soft and hard FTL. |
| FTL-S52 | `20320-20844` | X.56-X.57. Repeatability, protocol composition, engineering architecture | `138_RepeatabilityAndEngineeringBoundary.lean` | Repeatability closure, protocol composition, engineering architecture program, final theory-to-prototype boundary. |

## Planned Lean file set

- `PhysicsLean/PhysicsLean/Technology/FTL/Source/000_FilePreamble.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/010_CandidateSurvey.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/011_SoftCandidatePackages.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/020_BranchLockedSoftSector.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/021_SuperluminalStatus.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/030_SoftHardSplit.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/031_SoftProtocolOverview.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/032_HardProtocolOverview.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/040_ObserverLuminalFramework.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/041_SoftProtocolCore.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/042_HardProtocolCore.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/050_ComputationalRecipe.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/051_SoftRecipe.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/052_HardRecipe.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/060_ToyWorkedExamples.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/061_SoftMicroExample.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/062_HardMicroExample.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/070_TargetTheoremPackages.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/080_MinimalAxioms.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/081_DependencyGraph.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/082_CoverageMatrix.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/083_ClosureOrder.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/084_NonFactorizableSoftSector.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/090_BranchLockedSoftSector.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/091_ExplicitTwoBranchFamily.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/092_KernelGeneratedSoftFamily.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/093_FiniteStateAutomaton.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/094_FiniteAlphabetScanner.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/095_ScannerReadoutDynamics.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/096_SoftOperationalProtocol.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/097_HierarchicalSoftScanner.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/098_SoftRobustness.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/100_HardCarrierCandidates.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/101_BranchTransferHardCarrier.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/102_ExplicitHardCarrierFamily.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/103_ProjectedResolventPole.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/104_PoleSurvival.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/105_IdentityPreservation.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/106_BindingStability.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/107_CompositeHardCarrierModel.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/108_HardRobustness.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/109_HardRemainingTargets.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/110_HardRoadmap.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/111_GeneralCarrierExistence.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/112_DesynchronizationCriteria.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/113_NonemptyKernelClass.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/114_StrongDesynchronization.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/115_PhysicalProjectedPole.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/116_HardPhysicalAdmissibility.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/117_AuditedHardObserverClass.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/118_OnShellBranchRetention.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/119_GeneralOnePoleIdentity.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/120_GeneralCompositeBindingObservability.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/121_OpenAdmissibleHardClass.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/130_FinalAudit.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/131_PreEngineeringBlocks.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/132_PreEngineeringRoadmap.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/133_SoftCalibration.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/134_HardCalibration.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/135_ControlClosure.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/136_ResourceClosure.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/137_MaterialEmbedding.lean`
- `PhysicsLean/PhysicsLean/Technology/FTL/Source/138_RepeatabilityAndEngineeringBoundary.lean`