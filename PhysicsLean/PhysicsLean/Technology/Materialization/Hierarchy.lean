namespace PhysicsLean

inductive MaterializationHierarchyLevel
  | H0
  | H1
  | H2
  | H3
  | H4
  | H5
  | H6
  | H7
  | H8
  deriving DecidableEq, Repr

namespace MaterializationHierarchyLevel

theorem h0_ne_h1 : MaterializationHierarchyLevel.H0 ≠ MaterializationHierarchyLevel.H1 := by
  intro hEq
  cases hEq

theorem h0_eq_h0 : MaterializationHierarchyLevel.H0 = MaterializationHierarchyLevel.H0 := by
  rfl

end MaterializationHierarchyLevel

def FirstHardBodyAdmissibility (level : MaterializationHierarchyLevel) : Prop :=
  level = MaterializationHierarchyLevel.H0

theorem firstHardBodyAdmissibility_iff
    (level : MaterializationHierarchyLevel) :
    FirstHardBodyAdmissibility level <-> level = MaterializationHierarchyLevel.H0 := by
  rfl

theorem firstHardBodyAdmissibility_h0 :
    FirstHardBodyAdmissibility MaterializationHierarchyLevel.H0 := by
  rfl

theorem not_firstHardBodyAdmissibility_h1 :
    ¬ FirstHardBodyAdmissibility MaterializationHierarchyLevel.H1 := by
  intro hAdmissible
  exact MaterializationHierarchyLevel.h0_ne_h1 hAdmissible.symm

end PhysicsLean
