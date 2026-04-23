import PhysicsLean.Technology.Materialization.Hierarchy
import PhysicsLean.Technology.Materialization.Success
import PhysicsLean.Technology.Materialization.Targets
import PhysicsLean.Technology.Materialization.Source

namespace PhysicsLean

def observer_relative_identity_background : Prop :=
  observer_relative_identity ∧ soft_hard_separation

def resource_accounting_background : Prop :=
  no_ex_nihilo_materialization

def precursor_minimality_background : Prop :=
  minimal_precursor

def hierarchy_transition_background : Prop :=
  h0_hard_body_admissibility

def full_materialization_background : Prop :=
  observer_relative_identity_background ∧
    resource_accounting_background ∧
      precursor_minimality_background ∧ hierarchy_transition_background

theorem resource_accounting_background_implies_no_ex_nihilo_materialization :
  resource_accounting_background -> no_ex_nihilo_materialization := by
  intro hBackground
  exact hBackground

theorem observer_relative_identity_background_implies_soft_hard_separation :
  observer_relative_identity_background -> soft_hard_separation := by
  intro hBackground
  exact hBackground.right

theorem observer_relative_identity_background_implies_observer_relative_identity :
  observer_relative_identity_background -> observer_relative_identity := by
  intro hBackground
  exact hBackground.left

theorem precursor_minimality_background_implies_minimal_precursor :
  precursor_minimality_background -> minimal_precursor := by
  intro hBackground
  exact hBackground

theorem hierarchy_transition_background_implies_h0_hard_body_admissibility :
  hierarchy_transition_background -> h0_hard_body_admissibility := by
  intro hBackground
  exact hBackground

theorem full_materialization_background_implies_observer_relative_identity_background :
  full_materialization_background -> observer_relative_identity_background := by
  intro hBackground
  exact hBackground.left

theorem full_materialization_background_implies_resource_accounting_background :
  full_materialization_background -> resource_accounting_background := by
  intro hBackground
  exact hBackground.right.left

theorem full_materialization_background_implies_precursor_minimality_background :
  full_materialization_background -> precursor_minimality_background := by
  intro hBackground
  exact hBackground.right.right.left

theorem full_materialization_background_implies_hierarchy_transition_background :
  full_materialization_background -> hierarchy_transition_background := by
  intro hBackground
  exact hBackground.right.right.right

theorem full_materialization_background_implies_materialization_target_suite :
  full_materialization_background -> materialization_target_suite := by
  intro hBackground
  refine And.intro
    (resource_accounting_background_implies_no_ex_nihilo_materialization
      (full_materialization_background_implies_resource_accounting_background hBackground)) ?_
  refine And.intro
    (observer_relative_identity_background_implies_soft_hard_separation
      (full_materialization_background_implies_observer_relative_identity_background hBackground)) ?_
  refine And.intro
    (observer_relative_identity_background_implies_observer_relative_identity
      (full_materialization_background_implies_observer_relative_identity_background hBackground)) ?_
  refine And.intro
    (precursor_minimality_background_implies_minimal_precursor
      (full_materialization_background_implies_precursor_minimality_background hBackground)) ?_
  exact hierarchy_transition_background_implies_h0_hard_body_admissibility
    (full_materialization_background_implies_hierarchy_transition_background hBackground)

end PhysicsLean
