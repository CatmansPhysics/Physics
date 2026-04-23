import PhysicsLean.Technology.Materialization.Hierarchy
import PhysicsLean.Technology.Materialization.Success
import PhysicsLean.Technology.Materialization.Source

namespace PhysicsLean

def no_ex_nihilo_materialization : Prop :=
  forall history : Technology.Materialization.Source.AssemblyHistory,
    Technology.Materialization.Source.noExNihiloDerived history

def soft_hard_separation : Prop :=
  forall spec : Technology.Materialization.Source.SpecificationTheory,
    forall history : Technology.Materialization.Source.AssemblyHistory,
      Technology.Materialization.Source.hardMaterializationSuccess spec history ->
        Technology.Materialization.Source.softMaterializationSuccess spec history

def observer_relative_identity : Prop :=
  forall spec : Technology.Materialization.Source.SpecificationTheory,
    Technology.Materialization.Source.observerRelativeIdentityDerived spec

def minimal_precursor : Prop :=
  forall precursor : Technology.Materialization.Source.PrecursorTheory,
    Technology.Materialization.Source.precursorNonempty precursor

def h0_hard_body_admissibility : Prop :=
  FirstHardBodyAdmissibility MaterializationHierarchyLevel.H0

def materialization_target_suite : Prop :=
  no_ex_nihilo_materialization ∧
    soft_hard_separation ∧
      observer_relative_identity ∧
        minimal_precursor ∧ h0_hard_body_admissibility

theorem materialization_target_suite_implies_no_ex_nihilo_materialization :
  materialization_target_suite -> no_ex_nihilo_materialization := by
  intro hSuite
  exact hSuite.left

theorem materialization_target_suite_implies_soft_hard_separation :
  materialization_target_suite -> soft_hard_separation := by
  intro hSuite
  exact hSuite.right.left

theorem materialization_target_suite_implies_observer_relative_identity :
  materialization_target_suite -> observer_relative_identity := by
  intro hSuite
  exact hSuite.right.right.left

theorem materialization_target_suite_implies_minimal_precursor :
  materialization_target_suite -> minimal_precursor := by
  intro hSuite
  exact hSuite.right.right.right.left

theorem materialization_target_suite_implies_h0_hard_body_admissibility :
  materialization_target_suite -> h0_hard_body_admissibility := by
  intro hSuite
  exact hSuite.right.right.right.right

end PhysicsLean
