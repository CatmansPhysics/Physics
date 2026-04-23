import PhysicsLean.StructuralCore.Models.ZSym.Semantics

/-!
# `Z_sym` Local Reduction

This file defines the elementary cancellation rule on `Z_sym` words, removing
adjacent opposite-sign pairs, and proves the corresponding semantic
preservation.
-/

namespace PhysicsLean

def cancelAdjacent : FiniteWord ZSymAtom → FiniteWord ZSymAtom
  | [] => []
  | [a] => [a]
  | ZSymAtom.S :: ZSymAtom.P :: w => cancelAdjacent w
  | ZSymAtom.P :: ZSymAtom.S :: w => cancelAdjacent w
  | a :: w => a :: cancelAdjacent w

def zsym_localReduction (r : FiniteWord ZSymAtom → FiniteWord ZSymAtom) : Prop :=
  r = cancelAdjacent ∨ r = _root_.id

@[simp] theorem cancelAdjacent_nil : cancelAdjacent ([] : FiniteWord ZSymAtom) = [] := rfl

@[simp] theorem cancelAdjacent_singleton (a : ZSymAtom) :
    cancelAdjacent [a] = [a] := by
  cases a <;> rfl

theorem cancelAdjacent_semantics_preserved :
    ∀ w : FiniteWord ZSymAtom, zsym_word_semantics (cancelAdjacent w) = zsym_word_semantics w
  | [] => rfl
  | [a] => by
      cases a <;> rfl
  | ZSymAtom.S :: ZSymAtom.S :: w => by
      simpa [cancelAdjacent, zsym_word_semantics, add_assoc] using
        cancelAdjacent_semantics_preserved (ZSymAtom.S :: w)
  | ZSymAtom.S :: ZSymAtom.P :: w => by
      simpa [cancelAdjacent, zsym_word_semantics, add_assoc] using
        cancelAdjacent_semantics_preserved w
  | ZSymAtom.P :: ZSymAtom.S :: w => by
      simpa [cancelAdjacent, zsym_word_semantics, add_assoc] using
        cancelAdjacent_semantics_preserved w
  | ZSymAtom.P :: ZSymAtom.P :: w => by
      simpa [cancelAdjacent, zsym_word_semantics, add_assoc] using
        cancelAdjacent_semantics_preserved (ZSymAtom.P :: w)
termination_by w => w.length
decreasing_by
  all_goals
    simp [FiniteWord.length]

theorem zsym_localReduction_semantics_preserved
    {r : FiniteWord ZSymAtom → FiniteWord ZSymAtom} (hr : zsym_localReduction r)
    (w : FiniteWord ZSymAtom) :
    zsym_word_semantics (r w) = zsym_word_semantics w := by
  rcases hr with rfl | rfl
  · exact cancelAdjacent_semantics_preserved w
  · rfl

end PhysicsLean
