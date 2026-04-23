import PhysicsLean.StructuralCore.Transfer.Kernel

/-!
# Transfer Factorization

This file packages factorization data for transfer kernels. It records both the
free factorization viewpoint and the finite-state viewpoint used later in the
prime-transfer pipeline.
-/

namespace PhysicsLean

structure FreeTransferFactorization {X : SeqSEqObject} {E : HPatternExtractor X} {ι : Type _}
    [AddMonoid ι] (K : TransferKernel X E ι) where
  factors : AssemblyWord E → List (HPatternQuotient E)
  factors_eq : ∀ word : AssemblyWord E, factors word = word

structure FiniteStateTransferFactorization {X : SeqSEqObject} {E : HPatternExtractor X}
    {ι : Type _} [AddMonoid ι] (K : TransferKernel X E ι) where
  finite_state : Finite K.State

structure TransferFactorizationData (X : SeqSEqObject) (E : HPatternExtractor X) (ι : Type _)
    [AddMonoid ι] where
  kernel : TransferKernel X E ι
  free : FreeTransferFactorization kernel
  finiteState : FiniteStateTransferFactorization kernel

theorem transfer_factorization_exists {X : SeqSEqObject} {E : HPatternExtractor X} {ι : Type _}
    [AddMonoid ι] (data : TransferFactorizationData X E ι) (word : AssemblyWord E) :
    ∃ factors : List (HPatternQuotient E), factors = word :=
  ⟨data.free.factors word, data.free.factors_eq word⟩

theorem transfer_factorization_finite_state {X : SeqSEqObject} {E : HPatternExtractor X}
    {ι : Type _} [AddMonoid ι] (data : TransferFactorizationData X E ι) :
    Finite data.kernel.State :=
  data.finiteState.finite_state

end PhysicsLean
