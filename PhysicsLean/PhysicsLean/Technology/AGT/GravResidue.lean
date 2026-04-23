namespace PhysicsLean

universe u

inductive GravSign
  | repulsive
  | neutral
  | attractive
  deriving DecidableEq, Repr

structure GravResidueObservable (alpha : Type u) where
  eval : alpha -> GravSign

structure GravResidueClass (alpha : Type u) where
  carrier : alpha -> Prop

namespace GravResidueObservable

def value {alpha : Type u} (observable : GravResidueObservable alpha) (state : alpha) : GravSign :=
  observable.eval state

theorem eval_congr {alpha : Type u} (observable : GravResidueObservable alpha)
    {source target : alpha} (hEq : source = target) :
    observable.eval source = observable.eval target := by
  simp [hEq]

end GravResidueObservable

namespace GravResidueClass

def Mem {alpha : Type u} (residueClass : GravResidueClass alpha) (state : alpha) : Prop :=
  residueClass.carrier state

theorem mem_iff {alpha : Type u} (residueClass : GravResidueClass alpha) (state : alpha) :
    residueClass.Mem state <-> residueClass.carrier state := by
  rfl

end GravResidueClass

def TransferStableGravResidue {alpha : Type u}
    (observable : GravResidueObservable alpha)
    (transferEq : alpha -> alpha -> Prop) : Prop :=
  forall {source target : alpha}, transferEq source target -> observable.eval source = observable.eval target

theorem transferStableGravResidue_refl {alpha : Type u}
    (observable : GravResidueObservable alpha) :
    TransferStableGravResidue observable (fun source target => source = target) := by
  intro source target hEq
  exact GravResidueObservable.eval_congr observable hEq

theorem transferStableGravResidue_of_subrelation {alpha : Type u}
    (observable : GravResidueObservable alpha)
    {localEq globalEq : alpha -> alpha -> Prop}
    (hSub : forall {source target : alpha}, localEq source target -> globalEq source target)
    (hStable : TransferStableGravResidue observable globalEq) :
    TransferStableGravResidue observable localEq := by
  intro source target hLocal
  exact hStable (hSub hLocal)

theorem transferStableGravResidue_apply {alpha : Type u}
    {observable : GravResidueObservable alpha}
    {transferEq : alpha -> alpha -> Prop}
    (hStable : TransferStableGravResidue observable transferEq)
    {source target : alpha} (hTransfer : transferEq source target) :
    observable.eval source = observable.eval target := by
  exact hStable hTransfer

structure TransferStableResidueWitness (alpha : Type u) where
  observable : GravResidueObservable alpha
  transferEq : alpha -> alpha -> Prop
  stable : TransferStableGravResidue observable transferEq

theorem TransferStableResidueWitness.apply {alpha : Type u}
    (witness : TransferStableResidueWitness alpha)
    {source target : alpha} (hTransfer : witness.transferEq source target) :
    witness.observable.eval source = witness.observable.eval target := by
  exact transferStableGravResidue_apply witness.stable hTransfer

def reflTransferStableResidueWitness {alpha : Type u}
    (observable : GravResidueObservable alpha) : TransferStableResidueWitness alpha :=
  { observable := observable
    transferEq := fun source target => source = target
    stable := transferStableGravResidue_refl observable }

end PhysicsLean
