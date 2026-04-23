import PhysicsLean.StructuralCore.SeqSEq.Object

/-!
# SeqSEq Reductions

This file develops the first proof layer above `SeqSEqObject`: closure of local
reductions, semantic correctness of reductions, and the locality condition used
for rewriting subwords inside larger words.
-/

namespace PhysicsLean

namespace SeqSEqObject

def ReductionClosed (X : SeqSEqObject) : Prop :=
  ∀ ⦃r s : X.Word → X.Word⦄,
    X.localReduction r → X.localReduction s → X.localReduction (s ∘ r)

def ReductionSemanticsCorrect (X : SeqSEqObject) : Prop :=
  ∀ ⦃r : X.Word → X.Word⦄,
    X.localReduction r → ∀ w : X.Word, X.semantics (r w) = X.semantics w

def ReductionLocal (X : SeqSEqObject) : Prop :=
  ∀ ⦃r : X.Word → X.Word⦄,
    X.localReduction r →
      ∀ u v w : X.Word,
        r (X.compose u (X.compose v w)) =
          X.compose u (X.compose (r v) w)

theorem semantics_preserved_of_reduction
    {X : SeqSEqObject} (hsem : X.ReductionSemanticsCorrect)
    {r : X.Word → X.Word} (hr : X.localReduction r) (w : X.Word) :
    X.semantics (r w) = X.semantics w :=
  hsem hr w

theorem reduction_local_on_context
    {X : SeqSEqObject} (hloc : X.ReductionLocal)
    {r : X.Word → X.Word} (hr : X.localReduction r)
    (u v w : X.Word) :
    r (X.compose u (X.compose v w)) =
      X.compose u (X.compose (r v) w) :=
  hloc hr u v w

end SeqSEqObject

end PhysicsLean
