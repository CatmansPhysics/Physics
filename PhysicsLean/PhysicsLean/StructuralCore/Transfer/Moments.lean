import PhysicsLean.StructuralCore.Transfer.Factorization

/-!
# Transfer Moments

This file enriches transfer kernels with marked-state data so that one can talk
about moments and marked statistics of assembly words. It is the moment-tracking
layer above the raw kernel/factorization interface.
-/

namespace PhysicsLean

structure MarkedTransferKernel (X : SeqSEqObject) (E : HPatternExtractor X) (ι : Type _)
    [AddMonoid ι] where
  toTransferKernel : TransferKernel X E ι
  mark : toTransferKernel.State → Nat

namespace MarkedTransferKernel

variable {X : SeqSEqObject} {E : HPatternExtractor X} {ι : Type _}
variable [AddMonoid ι]

def transferValue (K : MarkedTransferKernel X E ι) (word : AssemblyWord E) : ι :=
  K.toTransferKernel.transferWeight word

def moment (K : MarkedTransferKernel X E ι) (word : AssemblyWord E) : Nat :=
  K.mark (K.toTransferKernel.run K.toTransferKernel.initial word)

@[simp] theorem moment_nil (K : MarkedTransferKernel X E ι) :
    K.moment [] = K.mark K.toTransferKernel.initial := rfl

end MarkedTransferKernel

structure TransferMomentData (X : SeqSEqObject) (E : HPatternExtractor X) (ι : Type _)
    [AddMonoid ι] where
  kernel : MarkedTransferKernel X E ι
  stable : ∀ word₁ word₂ : AssemblyWord E,
    kernel.transferValue word₁ = kernel.transferValue word₂ →
      kernel.moment word₁ = kernel.moment word₂

theorem moment_stability {X : SeqSEqObject} {E : HPatternExtractor X} {ι : Type _}
    [AddMonoid ι] (data : TransferMomentData X E ι)
    (word₁ word₂ : AssemblyWord E)
    (htransfer : data.kernel.transferValue word₁ = data.kernel.transferValue word₂) :
    data.kernel.moment word₁ = data.kernel.moment word₂ :=
  data.stable word₁ word₂ htransfer

end PhysicsLean
