namespace PhysicsLean

universe u

structure LuminalReferenceSector (alpha : Type u) where
  contains : alpha -> Prop

namespace LuminalReferenceSector

def Mem {alpha : Type u} (sector : LuminalReferenceSector alpha) (state : alpha) : Prop :=
  sector.contains state

theorem mem_iff {alpha : Type u} (sector : LuminalReferenceSector alpha) (state : alpha) :
    sector.Mem state <-> sector.contains state := by
  rfl

end LuminalReferenceSector

def ObserverRelativeFTL (travelTicks signalTicks : Nat) : Prop :=
  signalTicks < travelTicks

theorem observerRelativeFTL_of_lt {travelTicks signalTicks : Nat}
    (hLt : signalTicks < travelTicks) :
    ObserverRelativeFTL travelTicks signalTicks := by
  exact hLt

theorem observerRelativeFTL_iff {travelTicks signalTicks : Nat} :
    ObserverRelativeFTL travelTicks signalTicks <-> signalTicks < travelTicks := by
  rfl

structure SoftLinkSector (alpha : Type u) where
  active : alpha -> Prop

namespace SoftLinkSector

def Mem {alpha : Type u} (sector : SoftLinkSector alpha) (state : alpha) : Prop :=
  sector.active state

theorem mem_iff {alpha : Type u} (sector : SoftLinkSector alpha) (state : alpha) :
    sector.Mem state <-> sector.active state := by
  rfl

end SoftLinkSector

def BranchLockedSoftSector {alpha : Type u}
    (sector : SoftLinkSector alpha) (branch : alpha -> Prop) : Prop :=
  forall {state : alpha}, sector.active state -> branch state

theorem branchLocked_apply {alpha : Type u}
    {sector : SoftLinkSector alpha}
    {branch : alpha -> Prop}
    (hLocked : BranchLockedSoftSector sector branch)
    {state : alpha} (hActive : sector.active state) : branch state := by
  exact hLocked hActive

structure BranchLockedWitness (alpha : Type u) where
  sector : SoftLinkSector alpha
  branch : alpha -> Prop
  locked : BranchLockedSoftSector sector branch

theorem BranchLockedWitness.apply {alpha : Type u}
    (witness : BranchLockedWitness alpha)
    {state : alpha} (hActive : witness.sector.active state) :
    witness.branch state := by
  exact branchLocked_apply witness.locked hActive

structure SoftWitness (alpha : Type u) where
  witness : alpha -> Prop

namespace SoftWitness

def Mem {alpha : Type u} (witness : SoftWitness alpha) (state : alpha) : Prop :=
  witness.witness state

theorem mem_iff {alpha : Type u} (witness : SoftWitness alpha) (state : alpha) :
    witness.Mem state <-> witness.witness state := by
  rfl

def branchLockedSoftWitness {alpha : Type u}
    (witness : BranchLockedWitness alpha) : SoftWitness alpha :=
  { witness := witness.branch }

end SoftWitness

end PhysicsLean
