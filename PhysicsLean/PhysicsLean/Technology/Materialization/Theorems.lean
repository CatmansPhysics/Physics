import PhysicsLean.Technology.Materialization.Axioms
import PhysicsLean.Technology.Materialization.Targets

namespace PhysicsLean

universe u

theorem targetReachingChannel_iff_theorem {alpha : Type u}
    (channel : ControlledAssemblyChannel alpha)
    (history : AssemblyHistory alpha)
    (target : alpha) :
    TargetReachingChannel channel history target <-> channel.reaches history target := by
  exact PhysicsLean.targetReachingChannel_iff channel history target

theorem hardMaterialization_implies_soft_theorem {alpha : Type u}
    (specification : ObserverSpecification alpha)
    (realized : alpha -> Prop)
    (hHard : HardMaterialization specification realized) :
    SoftMaterialization specification realized := by
  exact PhysicsLean.hardMaterialization_implies_soft hHard

theorem successfulMaterialization_of_soft_theorem {alpha : Type u}
    (specification : ObserverSpecification alpha)
    (realized : alpha -> Prop)
    (hSoft : SoftMaterialization specification realized) :
    SuccessfulMaterialization specification realized := by
  exact PhysicsLean.successfulMaterialization_of_soft hSoft

theorem successfulMaterialization_of_hard_theorem {alpha : Type u}
    (specification : ObserverSpecification alpha)
    (realized : alpha -> Prop)
    (hHard : HardMaterialization specification realized) :
    SuccessfulMaterialization specification realized := by
  exact PhysicsLean.successfulMaterialization_of_hard hHard

theorem successfulMaterialization_iff_soft_or_hard {alpha : Type u}
    (specification : ObserverSpecification alpha)
    (realized : alpha -> Prop) :
    SuccessfulMaterialization specification realized <->
      SoftMaterialization specification realized \/ HardMaterialization specification realized := by
  exact PhysicsLean.successfulMaterialization_iff specification realized

theorem observerEquivalent_preserves_softMaterialization {alpha : Type u}
    {left right : ObserverSpecification alpha}
    {realized : alpha -> Prop}
    (hEq : ObserverEquivalent left right)
    (hSoft : SoftMaterialization left realized) :
    SoftMaterialization right realized := by
  intro state hRealized
  exact (hEq state).mp (hSoft hRealized)

theorem no_ex_nihilo_materialization_of_background
    (hBackground : resource_accounting_background) :
    no_ex_nihilo_materialization := by
  exact resource_accounting_background_implies_no_ex_nihilo_materialization hBackground

theorem soft_hard_separation_of_background
    (hBackground : observer_relative_identity_background) :
    soft_hard_separation := by
  exact observer_relative_identity_background_implies_soft_hard_separation hBackground

theorem observer_relative_identity_of_background
    (hBackground : observer_relative_identity_background) :
    observer_relative_identity := by
  exact observer_relative_identity_background_implies_observer_relative_identity hBackground

theorem minimal_precursor_of_background
    (hBackground : precursor_minimality_background) :
    minimal_precursor := by
  exact precursor_minimality_background_implies_minimal_precursor hBackground

theorem h0_hard_body_admissibility_of_background
    (hBackground : hierarchy_transition_background) :
    h0_hard_body_admissibility := by
  exact hierarchy_transition_background_implies_h0_hard_body_admissibility hBackground

theorem hierarchyLocalWitness :
    FirstHardBodyAdmissibility MaterializationHierarchyLevel.H0 /\
      ¬ FirstHardBodyAdmissibility MaterializationHierarchyLevel.H1 := by
  refine And.intro firstHardBodyAdmissibility_h0 ?_
  exact not_firstHardBodyAdmissibility_h1

theorem materialization_target_suite_of_background
    (hIdentity : observer_relative_identity_background)
    (hResources : resource_accounting_background)
    (hPrecursor : precursor_minimality_background)
    (hHierarchy : hierarchy_transition_background) :
    no_ex_nihilo_materialization /\
      soft_hard_separation /\
      observer_relative_identity /\
      minimal_precursor /\
      h0_hard_body_admissibility := by
  refine And.intro (no_ex_nihilo_materialization_of_background hResources) ?_
  refine And.intro (soft_hard_separation_of_background hIdentity) ?_
  refine And.intro (observer_relative_identity_of_background hIdentity) ?_
  refine And.intro (minimal_precursor_of_background hPrecursor) ?_
  exact h0_hard_body_admissibility_of_background hHierarchy

theorem materialization_target_suite_of_full_background
    (hBackground : full_materialization_background) :
    materialization_target_suite := by
  exact full_materialization_background_implies_materialization_target_suite hBackground

theorem hierarchy_local_witness_and_target_suite
    (hBackground : full_materialization_background) :
    FirstHardBodyAdmissibility MaterializationHierarchyLevel.H0 /\
      ¬ FirstHardBodyAdmissibility MaterializationHierarchyLevel.H1 /\
      materialization_target_suite := by
  refine And.intro hierarchyLocalWitness.left ?_
  refine And.intro hierarchyLocalWitness.right ?_
  exact materialization_target_suite_of_full_background hBackground

end PhysicsLean
