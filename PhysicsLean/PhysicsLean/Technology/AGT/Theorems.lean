import PhysicsLean.Technology.AGT.Axioms
import PhysicsLean.Technology.AGT.Targets
import PhysicsLean.Technology.AGT.Source

namespace PhysicsLean

universe u

open Technology.AGT.Source

def canonicalMicroRepresentative : CanonicalRepresentative (List MicroBlock) where
  cellsOf := id

def positiveMicroState : List MicroBlock :=
  [{ orientation := OrientationSign.positive, shellLoad := 1 }]

def negativeMicroState : List MicroBlock :=
  [{ orientation := OrientationSign.negative, shellLoad := 1 }]

def neutralMicroState : List MicroBlock := []

def canonicalWallParameters : DoubleWellParameters :=
  { stiffness := 1
    quarticScale := 1
    vacuumAmplitude := 1 }

def canonicalNeutralShell : ShellConfiguration :=
  { coreCharge := 1
    shellCharge := -1
    shellSymmetric := True }

def canonicalBubble : AntigravityBubble :=
  { innerPhase := 1
    outerPhase := -1
    radius := 1 }

def polarizedBulkMedium : CosmologicalMedium :=
  { rhoPlus := 2
    rhoMinus := 0
    rhoNeutral := 0
    wallDensity := 0
    bubbleDensity := 0 }

def screenedNeutralMedium : CosmologicalMedium :=
  { rhoPlus := 0
    rhoMinus := 0
    rhoNeutral := 2
    wallDensity := 0
    bubbleDensity := 0 }

def repulsiveVoidMedium : CosmologicalMedium :=
  { rhoPlus := 0
    rhoMinus := 0
    rhoNeutral := 0
    wallDensity := 0
    bubbleDensity := 0 }

def wallDominatedMedium : CosmologicalMedium :=
  { rhoPlus := 0
    rhoMinus := 0
    rhoNeutral := 1
    wallDensity := 1
    bubbleDensity := 0 }

def bubblePercolatingMedium : CosmologicalMedium :=
  { rhoPlus := 0
    rhoMinus := 0
    rhoNeutral := 1
    wallDensity := 0
    bubbleDensity := 1 }

theorem positiveMicroState_charge :
    microscopicGravCharge canonicalMicroRepresentative positiveMicroState = 1 := by
  norm_num [microscopicGravCharge, canonicalMicroRepresentative, positiveMicroState,
    orientedShellDefect, orientedContribution, OrientationSign.toInt]

theorem negativeMicroState_charge :
    microscopicGravCharge canonicalMicroRepresentative negativeMicroState = -1 := by
  norm_num [microscopicGravCharge, canonicalMicroRepresentative, negativeMicroState,
    orientedShellDefect, orientedContribution, OrientationSign.toInt]

theorem neutralMicroState_charge :
    microscopicGravCharge canonicalMicroRepresentative neutralMicroState = 0 := by
  simp [microscopicGravCharge, canonicalMicroRepresentative, neutralMicroState]

theorem canonicalNeutralShell_isNeutral : IsNeutralShell canonicalNeutralShell := by
  simp [canonicalNeutralShell, IsNeutralShell, ShellConfiguration.totalCharge]

theorem canonicalBubble_isBubble : IsBubble canonicalBubble := by
  constructor
  · norm_num [canonicalBubble]
  · norm_num [canonicalBubble]

theorem neutralComposite_iff_residue_eq_neutral {alpha : Type u}
    (composite : CompositeGravResidue alpha)
    : IsNeutralComposite composite <-> composite.residue = GravSign.neutral := by
  exact isNeutralComposite_iff_residue_eq_neutral composite

theorem neutralComposite_roundtrip {alpha : Type u}
    (composite : CompositeGravResidue alpha) :
    IsNeutralComposite composite -> composite.residue = GravSign.neutral := by
  intro hNeutral
  exact residue_eq_neutral_of_isNeutralComposite composite hNeutral

theorem neutralCanonicalComposite {alpha : Type u} (components : List alpha) :
    IsNeutralComposite (CompositeGravResidue.neutral components) := by
  exact neutralComposite_isNeutral components

theorem grav_residue_rewrite_invariance_of_background
    (hBackground : residue_rewrite_preserves_sign_background) :
    grav_residue_rewrite_invariance := by
  exact residue_rewrite_background_implies_target hBackground

theorem grav_residue_distinct_from_mass_like_spectral_data_of_background
    (hBackground : spectral_mass_separation_background) :
    grav_residue_distinct_from_mass_like_spectral_data := by
  exact spectral_mass_separation_background_implies_target hBackground

theorem neutral_composite_closure_of_background
    (hBackground : neutral_composite_closure_background) :
    neutral_composite_closure := by
  exact neutral_composite_closure_background_implies_target hBackground

theorem repulsive_scaling_window_of_background
    (hBackground : observer_force_link_background) :
    repulsive_scaling_window := by
  exact observer_force_link_background_implies_repulsive_scaling_window hBackground

theorem spectral_observer_compatibility_of_background
    (hBackground : observer_force_link_background) :
    spectral_observer_compatibility := by
  exact observer_force_link_background_implies_spectral_observer_compatibility hBackground

theorem agt_target_suite_of_background
    (hRewrite : residue_rewrite_preserves_sign_background)
    (hForce : observer_force_link_background)
    (hSeparation : spectral_mass_separation_background)
    (hClosure : neutral_composite_closure_background) :
    grav_residue_rewrite_invariance /\
      grav_residue_distinct_from_mass_like_spectral_data /\
      neutral_composite_closure /\
      repulsive_scaling_window /\
      spectral_observer_compatibility := by
  refine And.intro (grav_residue_rewrite_invariance_of_background hRewrite) ?_
  refine And.intro (grav_residue_distinct_from_mass_like_spectral_data_of_background hSeparation) ?_
  refine And.intro (neutral_composite_closure_of_background hClosure) ?_
  refine And.intro (repulsive_scaling_window_of_background hForce) ?_
  exact spectral_observer_compatibility_of_background hForce

theorem agt_target_suite_of_full_background
    (hBackground : full_agt_background) :
    agt_target_suite := by
  exact full_agt_background_implies_agt_target_suite hBackground

theorem neutral_composite_and_target_suite
    {alpha : Type u}
    (components : List alpha)
    (hBackground : full_agt_background) :
    IsNeutralComposite (CompositeGravResidue.neutral components) /\
      agt_target_suite := by
  refine And.intro ?_ ?_
  exact neutralCanonicalComposite components
  exact agt_target_suite_of_full_background hBackground

theorem canonical_neutral_witness_and_target_suite
    {alpha : Type u}
    (components : List alpha)
    (hBackground : full_agt_background) :
    Exists fun witness : NeutralCompositeWitness alpha =>
      witness.composite = CompositeGravResidue.neutral components /\
        agt_target_suite := by
  refine Exists.intro (canonicalNeutralCompositeWitness components) ?_
  refine And.intro ?_ ?_
  rfl
  exact agt_target_suite_of_full_background hBackground

theorem refl_transfer_witness_stable
    {alpha : Type u}
    (observable : GravResidueObservable alpha)
    {source target : alpha}
    (hEq : source = target) :
    (reflTransferStableResidueWitness observable).observable.eval source =
      (reflTransferStableResidueWitness observable).observable.eval target := by
  exact (reflTransferStableResidueWitness observable).apply hEq

theorem ag_t3_microscopic_charge_witness :
    ∃ repr : CanonicalRepresentative (List MicroBlock),
      hInvariantCharge repr (fun left right => left = right) ∧
      rewritePreservingCharge repr (fun left right => left = right) ∧
      transferStableCharge repr (fun left right => left = right) ∧
      ∃ positive negative neutral : List MicroBlock,
        microscopicGravCharge repr positive = 1 ∧
        microscopicGravCharge repr negative = -1 ∧
        microscopicGravCharge repr neutral = 0 := by
  refine ⟨canonicalMicroRepresentative, ?_, ?_, ?_, positiveMicroState, negativeMicroState,
    neutralMicroState, positiveMicroState_charge, negativeMicroState_charge, neutralMicroState_charge⟩
  · intro left right hEq
    simp [hEq]
  · intro left right hEq
    simp [hEq]
  · intro left right hEq
    simp [hEq]

theorem ag_t4_spectral_sign_matches_microscopic_charge
    {W : Type u}
    (repr : CanonicalRepresentative W)
    (state : W)
    (branch : SpectralBranch)
    (hSlope : branch.gravSlope = microscopicGravCharge repr state) :
    spectralChargeSign branch = microscopicGravSign repr state := by
  simp [spectralChargeSign, microscopicGravSign, hSlope]

theorem ag_t5_neutral_composite_and_dipole_witness :
    ∃ repr : CanonicalRepresentative (List MicroBlock),
      ∃ left right : List MicroBlock,
        compositeCharge repr minimalChargeComposition left right = 0 ∧
        ∃ dipole : GravDipole, IsNeutralDipole dipole := by
  refine ⟨canonicalMicroRepresentative, positiveMicroState, negativeMicroState, ?_, ?_⟩
  · apply exact_neutral_composite_of_canceling_charge
    · exact positiveMicroState_charge
    · exact negativeMicroState_charge
  · refine ⟨minimalDipole 1 1, ?_⟩
    constructor
    · simpa using minimalDipole_totalCharge 1 1
    · norm_num [minimalDipole_dipoleMoment]

theorem ag_t6_mesoscopic_phase_witnesses :
    ∃ unscreened mixed screening segregated : PhaseIndicators,
      classifyPhase unscreened = MesoscopicPhase.unscreenedAttractive ∧
      classifyPhase mixed = MesoscopicPhase.mixedRepulsive ∧
      classifyPhase screening = MesoscopicPhase.screening ∧
      classifyPhase segregated = MesoscopicPhase.segregatedAntigravity := by
  refine ⟨{ meanPolarization := 1, neutralFraction := 0, dipoleMoment := 1, segregationParameter := 0 },
    { meanPolarization := 0, neutralFraction := 0, dipoleMoment := 1, segregationParameter := 0 },
    { meanPolarization := 0, neutralFraction := 1, dipoleMoment := 0, segregationParameter := 0 },
    { meanPolarization := 0, neutralFraction := 0, dipoleMoment := 1, segregationParameter := 1 },
    ?_, ?_, ?_, ?_⟩ <;>
    norm_num [classifyPhase]

theorem ag_t7_domain_wall_and_interface_branch_witness :
    ∃ params center soft amplitude,
      IsGravDomainWall params (kinkProfile params center) ∧
      (wallDictionary soft amplitude).hasInterfaceLocalizedBranch := by
  refine ⟨canonicalWallParameters, 0, 1, 1, ?_, ?_⟩
  · exact kinkProfile_isDomainWall canonicalWallParameters 0
      (by norm_num [canonicalWallParameters])
      (by norm_num [canonicalWallParameters])
      (by norm_num [canonicalWallParameters])
  · simpa using wallDictionary_has_interface_branch 1 1

theorem ag_t8_interface_sector_witness :
    ∃ params center,
      IsGravDomainWall params (kinkProfile params center) ∧
      ∃ dipole : GravDipole, IsNeutralDipole dipole ∧
      ∃ shell : ShellConfiguration, IsNeutralShell shell ∧
      ∃ bubble : AntigravityBubble, IsBubble bubble := by
  refine ⟨canonicalWallParameters, 0, ?_, minimalDipole 1 1, ?_, canonicalNeutralShell,
    canonicalNeutralShell_isNeutral, canonicalBubble, canonicalBubble_isBubble⟩
  · exact kinkProfile_isDomainWall canonicalWallParameters 0
      (by norm_num [canonicalWallParameters])
      (by norm_num [canonicalWallParameters])
      (by norm_num [canonicalWallParameters])
  · constructor
    · simpa using minimalDipole_totalCharge 1 1
    · norm_num [minimalDipole_dipoleMoment]

theorem ag_t9_transport_class_witnesses :
    classifyCentralTransport 1 1 0 = CentralTransportClass.boundOrbit ∧
      classifyCentralTransport 1 (-1) 0 = CentralTransportClass.repulsiveScattering ∧
      classifyCentralTransport 1 1 1 = CentralTransportClass.screenedQuasiFree ∧
      wallTransportClass 0 1 = BackgroundTransportClass.wallReflection ∧
      wallTransportClass 1 1 = BackgroundTransportClass.temporaryWallTrapping ∧
      wallTransportClass 2 1 = BackgroundTransportClass.wallTransmission ∧
      bubbleTransportClass 1 1 (-1) = BackgroundTransportClass.bubbleCapture ∧
      bubbleTransportClass 1 (-1) 1 = BackgroundTransportClass.bubbleExpulsion := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · norm_num [classifyCentralTransport]
  · norm_num [classifyCentralTransport]
  · norm_num [classifyCentralTransport]
  · norm_num [wallTransportClass]
  · norm_num [wallTransportClass]
  · norm_num [wallTransportClass]
  · norm_num [bubbleTransportClass]
  · norm_num [bubbleTransportClass]

theorem ag_t10_grav_marked_moment_matches_charge
    {W : Type u}
    (repr : CanonicalRepresentative W)
    (state : W) :
    spectralGravCharge
        { branchValue := 1
          thetaDerivative := 0
          etaDerivative := 0
          gravDerivative := microscopicGravCharge repr state } =
      microscopicGravCharge repr state := by
  simp [spectralGravCharge]

theorem ag_t11_wall_dictionary_witness :
    ∃ soft amplitude,
      (wallDictionary soft amplitude).firstGravMoment = soft ∧
      (wallDictionary soft amplitude).secondGravMoment = amplitude ∧
      (wallDictionary soft amplitude).hasInterfaceLocalizedBranch := by
  refine ⟨1, 1, rfl, rfl, ?_⟩
  simpa using wallDictionary_has_interface_branch 1 1

theorem ag_t12_spectral_transport_witness :
    ∃ events : List GravKernelEvent,
      ∃ branch : DominantBranchData,
        gravMarkedKernel events 1 1 1 1 = 1 ∧
        spectralMomentum branch = 1 ∧
        spectralEnergy branch = -1 ∧
        spectralGravCharge branch = 1 := by
  refine ⟨[{ weight := 1, grading := 0, observerShift := 0, actionWeight := 1, gravIncrement := 0 }],
    { branchValue := 1, thetaDerivative := 1, etaDerivative := 1, gravDerivative := 1 }, ?_, ?_, ?_, ?_⟩
  · norm_num [gravMarkedKernel, gravMarkedWeight]
  · rfl
  · rfl
  · rfl

theorem ag_t13_gaussian_fluctuation_witness :
    ∃ witness : GaussianFluctuationWitness, validGaussianFluctuationWitness witness := by
  exact ⟨canonicalGaussianFluctuationWitness, canonicalGaussianFluctuationWitness_valid⟩

theorem ag_t14_large_deviation_witness :
    ∃ witness : LargeDeviationWitness, validLargeDeviationWitness witness := by
  exact ⟨canonicalLargeDeviationWitness, canonicalLargeDeviationWitness_valid⟩

theorem ag_t15_large_scale_regime_witnesses :
    classifyLargeScaleRegime polarizedBulkMedium = LargeScaleRegime.polarizedBulk ∧
      classifyLargeScaleRegime screenedNeutralMedium = LargeScaleRegime.screenedNeutral ∧
      classifyLargeScaleRegime repulsiveVoidMedium = LargeScaleRegime.repulsiveVoid ∧
      classifyLargeScaleRegime wallDominatedMedium = LargeScaleRegime.wallDominated ∧
      classifyLargeScaleRegime bubblePercolatingMedium = LargeScaleRegime.bubblePercolating := by
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · norm_num [classifyLargeScaleRegime, polarizedBulkMedium, cosmologicalPolarization, neutralFraction,
    totalDensity]
  · norm_num [classifyLargeScaleRegime, screenedNeutralMedium, cosmologicalPolarization, neutralFraction,
    totalDensity]
  · norm_num [classifyLargeScaleRegime, repulsiveVoidMedium, cosmologicalPolarization, neutralFraction,
    totalDensity]
  · norm_num [classifyLargeScaleRegime, wallDominatedMedium, cosmologicalPolarization, neutralFraction,
    totalDensity]
  · norm_num [classifyLargeScaleRegime, bubblePercolatingMedium, cosmologicalPolarization, neutralFraction,
    totalDensity]

theorem ag_t16_computational_pipeline_and_audit_witness :
    agtComputationalPipeline.length = 6 ∧
      immediateCheckpoints.length = 7 ∧
      falsifiers.length = 6 ∧
      successLevels.length = 3 := by
  constructor
  · exact agtComputationalPipeline_length
  constructor
  · rfl
  constructor
  · exact falsifiers_length
  · rfl

end PhysicsLean
