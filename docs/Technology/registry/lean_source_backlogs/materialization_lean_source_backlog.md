# Materialization Lean Formalization Backlog

Source file: `docs/Technology/Matria_v1.md`

Exact source length: `11372` lines.

Target namespace root: `PhysicsLean/PhysicsLean/Technology/Materialization/Source/`

Coverage rule:

- the ranges below are contiguous and inclusive;
- together they cover source lines `1-11372` with no gaps;
- repeated part-title lines in the source are still covered as separate provenance ranges;
- theorem prose, audits, closure ladders, calibration plans, and engineering-readiness clauses are assigned to concrete Lean files rather than dropped.

| ID | Source lines | Source block | Lean files that must exist | Formalization scope |
| --- | --- | --- | --- | --- |
| MAT-S01 | `1-292` | Early project statements, project 0, first Russian sketch, start-of-manuscript preface | `000_ProjectBoundary.lean`, `001_ProjectPrelude.lean` | Project boundary, no-ex-nihilo principle, first project-level definitions M1-M6, first target theorem shells T1-T4, first manuscript boundary claims. |
| MAT-S02 | `293-648` | Part I-IX of the English project manuscript | `010_SpecificationTheory.lean`, `011_PrecursorTheory.lean`, `012_AssemblyHistories.lean`, `013_SuccessCriteria.lean`, `014_FirstDerivedPropositions.lean`, `015_FirstTargetTheorems.lean`, `016_FailureModes.lean` | Definitions M1-M13, propositions M-P1-M-P3, target theorems M-T1-M-T4, failure modes M-F1-M-F5, first concrete model-problem framing. |
| MAT-S03 | `649-976` | Part X. Crystalline target objects, defect calculus, first hard-materialization theorem | `020_CrystallineTarget.lean`, `021_DefectCalculus.lean`, `022_CrystallineReservoirs.lean`, `023_CrystallizationChannels.lean`, `024_SuccessfulCrystallineMaterialization.lean`, `025_CrystallineSoftHardSplit.lean`, `026_CrystallineFailureModes.lean` | Definitions M14-M26, theorem M-C1 wrapper, crystalline soft/hard split, crystalline failure mode formalization. |
| MAT-S04 | `977-997` | Duplicate Part XI title prelude | `030_MonatomicTargets.lean` | Provenance range for the monatomic fabrication block title and transition. |
| MAT-S05 | `998-1402` | Part XI. Monatomic crystalline fabrication | `030_MonatomicTargets.lean`, `031_Seeds.lean`, `032_GrowthHistories.lean`, `033_CompletionFunctional.lean`, `034_DefectAccumulation.lean`, `035_SeededCompletion.lean`, `036_SeedlessNucleation.lean`, `037_CompletionTime.lean`, `038_MonatomicFailureModes.lean`, `039_ComputationalSchema.lean` | Definitions M27-M40, proposition M-P4-M-P6, target theorems M-C2-M-C3, failure modes M-F6-M-F10, algorithmic schema M-A1. |
| MAT-S06 | `1403-1419` | Duplicate Part XII title prelude | `040_SurfaceSector.lean` | Provenance range for the surface-closure block transition. |
| MAT-S07 | `1420-1890` | Part XII. Surface closure, annealing, and defect repair | `040_SurfaceSector.lean`, `041_SurfaceEnergy.lean`, `042_Annealing.lean`, `043_RepairChannels.lean`, `044_RepairStability.lean`, `045_UsableObject.lean`, `046_RepairCompletion.lean`, `047_SelfMonitoringChannels.lean`, `048_SurfaceFailureModes.lean` | Definitions M41-M57, target theorems M-C4-M-C6, repair and usability structures, section failure modes M-F11-M-F16. |
| MAT-S08 | `1891-1908` | Duplicate Part XIII title prelude | `050_FabricatorArchitecture.lean` | Provenance range for fabricator-architecture transition. |
| MAT-S09 | `1909-2271` | Part XIII. Fabricator architectures | `050_FabricatorArchitecture.lean`, `051_Templates.lean`, `052_ControlLoops.lean`, `053_FabricationInformation.lean`, `054_FabricatorHierarchy.lean`, `055_InverseProblemArchitecture.lean`, `056_ArchitectureReduction.lean`, `057_ArchitectureFailureModes.lean` | Definitions M58-M76, propositions M-P8-M-P10, target theorems M-C7-M-C10, architecture failure modes M-F17-M-F22. |
| MAT-S10 | `2272-2288` | Duplicate Part XIV title prelude | `060_ResourceBudget.lean` | Provenance range for budget/economics transition. |
| MAT-S11 | `2289-2760` | Part XIV. Resource accounting, action budgets, economics of materialization | `060_ResourceBudget.lean`, `061_FabricationCost.lean`, `062_UsefulInformation.lean`, `063_WasteCalculus.lean`, `064_FeasibilityFunctional.lean`, `065_MinimalSufficientCost.lean`, `066_UnderfundingTheorems.lean`, `067_RepairEconomics.lean`, `068_SelfExtendingFabricator.lean`, `069_BudgetFailureModes.lean` | Definitions M77-M92, propositions M-P11-M-P14, target theorems M-C11-M-C15, budget failure modes M-F23-M-F28. |
| MAT-S12 | `2761-2782` | Duplicate Part XV title prelude | `070_InverseDesignCore.lean` | Provenance range for inverse-design transition. |
| MAT-S13 | `2783-3358` | Part XV. Inverse design problem | `070_InverseDesignCore.lean`, `071_CandidateSpaces.lean`, `072_RealizabilityMap.lean`, `073_SpecificationStrata.lean`, `074_SolutionDominance.lean`, `075_InverseDesignScore.lean`, `076_LayeredInverseDesign.lean`, `077_TemplateFirstReduction.lean`, `078_RepairFirstStrategy.lean`, `079_InversePipeline.lean`, `080_InverseFailureModes.lean` | Definitions M93-M110, propositions M-P15-M-P19, target theorems M-C16-M-C21, algorithmic schema M-A2, inverse-design failure modes M-F29-M-F34. |
| MAT-S14 | `3359-3375` | Duplicate Part XVI title prelude | `090_HierarchyCore.lean` | Provenance range for hierarchy transition. |
| MAT-S15 | `3376-3732` | Part XVI. Hierarchies of materialization | `090_HierarchyCore.lean`, `091_FunctionalSubsystems.lean`, `092_MemoryAndState.lean`, `093_AdaptiveObjects.lean`, `094_ProtoAgentThreshold.lean`, `095_HierarchicalInverseDesign.lean`, `096_HierarchyTheorems.lean` | Definitions M111-M126, propositions M-P20-M-P25, target theorems M-C22-M-C25, hierarchy failure bundles. |
| MAT-S16 | `3733-3748` | Duplicate Part XVII title prelude | `100_SimpleDevice.lean` | Provenance range for simple-device transition. |
| MAT-S17 | `3749-4152` | Part XVII. Functional materialization of a simple composite device | `100_SimpleDevice.lean`, `101_DeviceSubsystems.lean`, `102_FunctionalInterfaces.lean`, `103_DeviceMemory.lean`, `104_FunctionalAdmissibility.lean`, `105_BinarySelector.lean`, `106_DeviceFabricationChannel.lean`, `107_DeviceTheoremChain.lean`, `108_DeviceFailureModes.lean` | Definitions M127-M144, propositions M-P26-M-P27, target theorems M-C26-M-C30, device failure modes M-F41-M-F46. |
| MAT-S18 | `4153-4170` | Duplicate Part XVIII title prelude | `110_AdaptivePerturbations.lean` | Provenance range for adaptive-device transition. |
| MAT-S19 | `4171-4528` | Part XVIII. Adaptive devices | `110_AdaptivePerturbations.lean`, `111_RecoveryChannels.lean`, `112_FeedbackArchitecture.lean`, `113_BoundedCorrection.lean`, `114_AdaptiveFunctional.lean`, `115_InformationalClosureDevice.lean`, `116_AdaptiveDevice.lean`, `117_AdaptiveToyRegime.lean`, `118_AdaptiveFailureModes.lean` | Definitions M145-M162, proposition M-P28-M-P29, target theorems M-C31-M-C34, adaptive failure modes M-F47-M-F52. |
| MAT-S20 | `4529-4546` | Duplicate Part XIX title prelude | `120_ProtoAgentObjects.lean` | Provenance range for proto-agent transition. |
| MAT-S21 | `4547-4925` | Part XIX. Proto-agent objects | `120_ProtoAgentObjects.lean`, `121_StrongSymbolicStates.lean`, `122_PolicySelection.lean`, `123_ActionGuidedMaterialization.lean`, `124_ProtoAgencyThreshold.lean`, `125_ProtoSelfModel.lean`, `126_ProtoAgentFailureModes.lean` | Definitions M163-M174, propositions M-P30-M-P31, target theorems M-C35-M-C38, proto-agent failure modes M-F53-M-F58. |
| MAT-S22 | `4926-4940` | Duplicate Part XX title prelude | `130_SelfFabrication.lean` | Provenance range for self-fabrication transition. |
| MAT-S23 | `4941-5381` | Part XX. Self-fabricating and recursively materializing systems | `130_SelfFabrication.lean`, `131_HeredityAndFidelity.lean`, `132_SelfRepairAndExtension.lean`, `133_RecursiveMaterialization.lean`, `134_FabricationReproductiveNumber.lean`, `135_SharedResources.lean`, `136_RecursiveSelfModel.lean`, `137_SelfFabricationCriteria.lean`, `138_ErrorThresholds.lean`, `139_MorphogeneticExtension.lean`, `140_SelfFabricationFailureModes.lean` | Definitions M175-M194, propositions M-P32-M-P38, target theorems M-C39-M-C41, corollary M-C42, failure modes M-F59-M-F61. |
| MAT-S24 | `5382-5400` | Duplicate Part XXI title prelude | `150_AuditStatuses.lean` | Provenance range for audit transition. |
| MAT-S25 | `5401-5857` | Part XXI. Audit of the materialization program | `150_AuditStatuses.lean` | Standing assumptions, provenance labels, coverage matrix by hierarchy level, internal/imported/open classification, boundary theorem, engineering-transition theorem. |
| MAT-S26 | `5858-6254` | Phase II / first closable theorem chain | `151_ClosureChainV1.lean` | First theorem-chain closure scaffolding, explicit closure-phase bundles for the crystalline body track. |
| MAT-S27 | `6255-6552` | Phase II.a-b. Order score and proof of Lemma L2 | `152_CrystallineOrderScore.lean` | Observer-level order score `Q_Λ`, Lemma L2 objects and proof-plan scaffolding. |
| MAT-S28 | `6553-6811` | Phase II.c. Crystalline-lift bridge | `153_CrystallineLiftBridge.lean` | Lift bridge, compressed theorem wrapper, theorem-chain weak-point analysis. |
| MAT-S29 | `6812-7082` | Phase II.d. Post-control persistence | `154_PostControlPersistence.lean` | Post-control persistence criteria, Lemma L5, compact theorem assembly and closure status. |
| MAT-S30 | `7083-7627` | v1 chain: seeded hard materialization of a monatomic crystalline body | `155_SeededHardMaterializationV1.lean` | Theorem M-T0/v1 chain in source order with explicit seed and reservoir hypotheses. |
| MAT-S31 | `7628-8143` | v1.2 Lean-style minimal core | `156_ReservoirSufficiency.lean` | Lean-style hypothesis bundling, compressed theorem, formalization-oriented minimal core. |
| MAT-S32 | `8144-8462` | v1.3 explicit seed and reservoir hypotheses | `157_LocalCompatibility.lean` | Explicit hypothesis bundle splitting seed, reservoir, and local compatibility obligations. |
| MAT-S33 | `8463-8976` | v1.4 explicit reservoir-sufficiency criterion | `156_ReservoirSufficiency.lean` | Sufficiency preorder and reservoir adequacy criteria in explicit source form. |
| MAT-S34 | `8977-9407` | v1.5 explicit local-compatibility criterion | `157_LocalCompatibility.lean` | Growth-event local compatibility and admissibility of elementary steps. |
| MAT-S35 | `9408-9758` | v1.6 post-control metastability criterion | `158_MetastabilityCriterion.lean` | Post-control persistence and metastability bundles. |
| MAT-S36 | `9759-10286` | v1.7 effective crystalline functional and escape barriers | `159_EffectiveCrystallineFunctional.lean` | Effective crystalline functional, escape barrier logic, closure of the lower theorem chain. |
| MAT-S37 | `10287-10557` | Part XXII. Calibration protocol | `160_CalibrationProtocol.lean` | Calibration protocol for the effective crystalline functional. |
| MAT-S38 | `10558-10741` | Part XXIII. Global theorem of the materialization program | `161_GlobalTheorem.lean` | Global theorem wrapper and project-level synthesis. |
| MAT-S39 | `10742-10851` | Roadmap of full closure | `162_ClosureLadder.lean` | Roadmap for total closure and next closure obligations. |
| MAT-S40 | `10852-10943` | Part XXIV. Closure ladder | `162_ClosureLadder.lean` | Closure ladder by blocks and levels. |
| MAT-S41 | `10944-10997` | Part XXV. Device-chain in finished draft form | `163_DeviceChainAudit.lean` | Finished-draft device-chain audit wrapper. |
| MAT-S42 | `10998-11051` | Part XXVI. Adaptive-chain in finished draft form | `164_AdaptiveChainAudit.lean` | Finished-draft adaptive-chain audit wrapper. |
| MAT-S43 | `11052-11091` | Part XXVII. Proto-agent-chain in finished draft form | `165_ProtoAgentChainAudit.lean` | Finished-draft proto-agent audit wrapper. |
| MAT-S44 | `11092-11148` | Part XXVIII. Self-fabrication-chain in finished draft form | `166_SelfFabricationChainAudit.lean` | Finished-draft self-fabrication audit wrapper. |
| MAT-S45 | `11149-11191` | Part XXIX. Inverse design closure | `167_InverseDesignAudit.lean` | Finished-draft inverse-design closure wrapper. |
| MAT-S46 | `11192-11234` | Part XXX. Final audited statement | `168_FinalAuditedStatement.lean` | Final audited project statement. |
| MAT-S47 | `11235-11278` | Part XXXI. What is proved, what is target, what is open | `169_ClaimsBoundary.lean` | Final classification of proved, target, and open content. |
| MAT-S48 | `11279-11294` | Part XXXII. What the project does not claim | `169_ClaimsBoundary.lean` | Negative claim boundary and non-claim wrappers. |
| MAT-S49 | `11295-11354` | Part XXXIII. Final concise form of the theory | `170_FinalConciseTheory.lean` | Final concise theorem/program statement. |
| MAT-S50 | `11355-11372` | Итог | `170_FinalConciseTheory.lean` | Final summary and source-tail closure. |

## Planned Lean file set

- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/000_ProjectBoundary.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/001_ProjectPrelude.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/010_SpecificationTheory.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/011_PrecursorTheory.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/012_AssemblyHistories.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/013_SuccessCriteria.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/014_FirstDerivedPropositions.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/015_FirstTargetTheorems.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/016_FailureModes.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/020_CrystallineTarget.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/021_DefectCalculus.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/022_CrystallineReservoirs.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/023_CrystallizationChannels.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/024_SuccessfulCrystallineMaterialization.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/025_CrystallineSoftHardSplit.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/026_CrystallineFailureModes.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/030_MonatomicTargets.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/031_Seeds.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/032_GrowthHistories.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/033_CompletionFunctional.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/034_DefectAccumulation.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/035_SeededCompletion.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/036_SeedlessNucleation.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/037_CompletionTime.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/038_MonatomicFailureModes.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/039_ComputationalSchema.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/040_SurfaceSector.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/041_SurfaceEnergy.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/042_Annealing.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/043_RepairChannels.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/044_RepairStability.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/045_UsableObject.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/046_RepairCompletion.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/047_SelfMonitoringChannels.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/048_SurfaceFailureModes.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/050_FabricatorArchitecture.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/051_Templates.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/052_ControlLoops.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/053_FabricationInformation.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/054_FabricatorHierarchy.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/055_InverseProblemArchitecture.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/056_ArchitectureReduction.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/057_ArchitectureFailureModes.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/060_ResourceBudget.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/061_FabricationCost.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/062_UsefulInformation.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/063_WasteCalculus.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/064_FeasibilityFunctional.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/065_MinimalSufficientCost.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/066_UnderfundingTheorems.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/067_RepairEconomics.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/068_SelfExtendingFabricator.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/069_BudgetFailureModes.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/070_InverseDesignCore.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/071_CandidateSpaces.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/072_RealizabilityMap.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/073_SpecificationStrata.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/074_SolutionDominance.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/075_InverseDesignScore.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/076_LayeredInverseDesign.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/077_TemplateFirstReduction.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/078_RepairFirstStrategy.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/079_InversePipeline.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/080_InverseFailureModes.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/090_HierarchyCore.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/091_FunctionalSubsystems.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/092_MemoryAndState.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/093_AdaptiveObjects.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/094_ProtoAgentThreshold.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/095_HierarchicalInverseDesign.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/096_HierarchyTheorems.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/100_SimpleDevice.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/101_DeviceSubsystems.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/102_FunctionalInterfaces.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/103_DeviceMemory.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/104_FunctionalAdmissibility.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/105_BinarySelector.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/106_DeviceFabricationChannel.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/107_DeviceTheoremChain.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/108_DeviceFailureModes.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/110_AdaptivePerturbations.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/111_RecoveryChannels.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/112_FeedbackArchitecture.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/113_BoundedCorrection.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/114_AdaptiveFunctional.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/115_InformationalClosureDevice.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/116_AdaptiveDevice.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/117_AdaptiveToyRegime.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/118_AdaptiveFailureModes.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/120_ProtoAgentObjects.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/121_StrongSymbolicStates.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/122_PolicySelection.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/123_ActionGuidedMaterialization.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/124_ProtoAgencyThreshold.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/125_ProtoSelfModel.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/126_ProtoAgentFailureModes.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/130_SelfFabrication.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/131_HeredityAndFidelity.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/132_SelfRepairAndExtension.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/133_RecursiveMaterialization.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/134_FabricationReproductiveNumber.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/135_SharedResources.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/136_RecursiveSelfModel.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/137_SelfFabricationCriteria.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/138_ErrorThresholds.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/139_MorphogeneticExtension.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/140_SelfFabricationFailureModes.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/150_AuditStatuses.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/151_ClosureChainV1.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/152_CrystallineOrderScore.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/153_CrystallineLiftBridge.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/154_PostControlPersistence.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/155_SeededHardMaterializationV1.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/156_ReservoirSufficiency.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/157_LocalCompatibility.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/158_MetastabilityCriterion.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/159_EffectiveCrystallineFunctional.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/160_CalibrationProtocol.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/161_GlobalTheorem.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/162_ClosureLadder.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/163_DeviceChainAudit.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/164_AdaptiveChainAudit.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/165_ProtoAgentChainAudit.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/166_SelfFabricationChainAudit.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/167_InverseDesignAudit.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/168_FinalAuditedStatement.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/169_ClaimsBoundary.lean`
- `PhysicsLean/PhysicsLean/Technology/Materialization/Source/170_FinalConciseTheory.lean`