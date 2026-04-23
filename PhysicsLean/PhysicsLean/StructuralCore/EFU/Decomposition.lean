import PhysicsLean.StructuralCore.EFU.Basic

/-!
# EFU Decomposition Systems

This file packages the existence side of EFU decompositions. A decomposition
system assigns to every word a chosen EFU decomposition and records the basic
existence/rank consequences of that choice.
-/

namespace PhysicsLean

structure EFUDecompositionSystem (X : SeqSEqObject) (E : HPatternExtractor X) where
  decompose : ∀ w : X.Word, EFUDecomposition E w

theorem efu_decomposition_exists {X : SeqSEqObject} {E : HPatternExtractor X}
    (S : EFUDecompositionSystem X E) (w : X.Word) :
    Nonempty (EFUDecomposition E w) :=
  ⟨S.decompose w⟩

theorem efu_decomposition_rank_defined {X : SeqSEqObject} {E : HPatternExtractor X}
    (S : EFUDecompositionSystem X E) (w : X.Word) :
    ∃ n : Nat, (S.decompose w).rank = n :=
  ⟨(S.decompose w).rank, rfl⟩

end PhysicsLean
