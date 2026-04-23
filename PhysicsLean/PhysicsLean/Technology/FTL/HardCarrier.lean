namespace PhysicsLean

universe u

structure HardCarrierCycle (alpha : Type u) where
  support : List alpha
  closes : Prop

namespace HardCarrierCycle

def singleton {alpha : Type u} (carrier : alpha) (closes : Prop) : HardCarrierCycle alpha :=
  { support := [carrier], closes := closes }

theorem closes_singleton {alpha : Type u} (carrier : alpha) (hCloses : Prop) :
    (singleton carrier hCloses).closes = hCloses := by
  rfl

theorem support_singleton {alpha : Type u} (carrier : alpha) (hCloses : Prop) :
    (singleton carrier hCloses).support = [carrier] := by
  rfl

end HardCarrierCycle

structure CompositeCarrierCycle (alpha : Type u) where
  stages : List (HardCarrierCycle alpha)

namespace CompositeCarrierCycle

def empty {alpha : Type u} : CompositeCarrierCycle alpha :=
  { stages := [] }

theorem stages_empty {alpha : Type u} :
    (empty : CompositeCarrierCycle alpha).stages = [] := by
  rfl

end CompositeCarrierCycle

def HardTransportAdmissible {alpha : Type u} (cycle : HardCarrierCycle alpha) : Prop :=
  cycle.closes

theorem hardTransportAdmissible_iff_closes {alpha : Type u} (cycle : HardCarrierCycle alpha) :
    HardTransportAdmissible cycle <-> cycle.closes := by
  rfl

theorem hardTransportAdmissible_of_closes {alpha : Type u}
    (cycle : HardCarrierCycle alpha)
    (hCloses : cycle.closes) :
    HardTransportAdmissible cycle := by
  exact hCloses

structure HardCycleWitness (alpha : Type u) where
  cycle : HardCarrierCycle alpha
  admissible : HardTransportAdmissible cycle

theorem HardCycleWitness.closes {alpha : Type u}
    (witness : HardCycleWitness alpha) :
    witness.cycle.closes := by
  exact witness.admissible

def singletonHardCycleWitness {alpha : Type u}
    (carrier : alpha) (hCloses : Prop) (hAdmissible : hCloses) : HardCycleWitness alpha :=
  { cycle := HardCarrierCycle.singleton carrier hCloses
    admissible := by
      simpa [HardTransportAdmissible, HardCarrierCycle.closes_singleton] using hAdmissible }

end PhysicsLean
