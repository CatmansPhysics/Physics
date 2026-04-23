import PhysicsLean.StructuralCore.SeqSEq.Reduction

/-!
# SeqSEq Normalization

This file packages reduction-equivalence on words into a quotient-friendly
structure. It is the normalization layer turning local rewrite rules into a
global equivalence relation.
-/

namespace PhysicsLean

namespace SeqSEqObject

def ReductionKernel (X : SeqSEqObject) (u v : X.Word) : Prop :=
  ∀ ⦃r : X.Word → X.Word⦄, X.localReduction r → r u = r v

def reductionSetoid (X : SeqSEqObject) : Setoid X.Word where
  r := ReductionKernel X
  iseqv := by
    constructor
    · intro u r hr
      rfl
    · intro u v huv r hr
      symm
      exact huv hr
    · intro u v w huv hvw r hr
      rw [huv hr, hvw hr]

abbrev ReductionQuotient (X : SeqSEqObject) := Quotient (reductionSetoid X)

abbrev SemanticQuotient (X : SeqSEqObject) := Quotient (Setoid.ker X.semantics)

def kernel_normalization (X : SeqSEqObject) (w : X.Word) : Set X.Word :=
  { normalized | ∃ r : X.Word → X.Word, X.localReduction r ∧ r w = normalized }

@[simp] theorem reduction_kernel_refl (X : SeqSEqObject) (w : X.Word) :
    ReductionKernel X w w := by
  intro r hr
  rfl

end SeqSEqObject

end PhysicsLean
