namespace PhysicsLean

universe u v

structure ObserverSpecification (alpha : Type u) where
  admits : alpha -> Prop

namespace ObserverSpecification

def Mem {alpha : Type u} (specification : ObserverSpecification alpha) (state : alpha) : Prop :=
  specification.admits state

theorem mem_iff {alpha : Type u} (specification : ObserverSpecification alpha) (state : alpha) :
    specification.Mem state <-> specification.admits state := by
  rfl

end ObserverSpecification

structure PredicateFamily (alpha : Type u) (beta : Type v) where
  witness : beta -> alpha -> Prop

namespace PredicateFamily

def Mem {alpha : Type u} {beta : Type v}
    (family : PredicateFamily alpha beta) (index : beta) (state : alpha) : Prop :=
  family.witness index state

theorem mem_iff {alpha : Type u} {beta : Type v}
    (family : PredicateFamily alpha beta) (index : beta) (state : alpha) :
    family.Mem index state <-> family.witness index state := by
  rfl

end PredicateFamily

structure DefectBudget where
  allowance : Nat

namespace DefectBudget

theorem allowance_eq {budget : DefectBudget} :
    budget.allowance = budget.allowance := by
  rfl

end DefectBudget

structure PersistenceWindow where
  ticks : Nat

namespace PersistenceWindow

theorem ticks_eq {window : PersistenceWindow} :
    window.ticks = window.ticks := by
  rfl

end PersistenceWindow

def ObserverEquivalent {alpha : Type u}
    (left right : ObserverSpecification alpha) : Prop :=
  forall state : alpha, left.admits state <-> right.admits state

theorem observerEquivalent_refl {alpha : Type u}
    (specification : ObserverSpecification alpha) :
    ObserverEquivalent specification specification := by
  intro state
  rfl

theorem observerEquivalent_symm {alpha : Type u}
    {left right : ObserverSpecification alpha}
    (hEq : ObserverEquivalent left right) :
    ObserverEquivalent right left := by
  intro state
  exact (hEq state).symm

theorem observerEquivalent_trans {alpha : Type u}
    {left middle right : ObserverSpecification alpha}
    (hLeft : ObserverEquivalent left middle)
    (hRight : ObserverEquivalent middle right) :
    ObserverEquivalent left right := by
  intro state
  exact Iff.trans (hLeft state) (hRight state)

end PhysicsLean
