import PhysicsLean.StructuralCore.Models.ZSym.Reduction

/-!
# The Concrete `Z_sym` Object

This file assembles the concrete symbolic and `SeqSEq` objects attached to the
`Z_sym` alphabet. It packages the signed-word semantics, the local cancellation
rule, and the resulting example lemmas used throughout the rest of the project.
-/

namespace PhysicsLean

def zsym_symbolic_structure : SymbolicStructure where
  Carrier := ZSymAtom
  Semantics := Int
  semantics := zsym_atom_semantics
  admissible := fun f => ∀ a, zsym_atom_semantics (f a) = zsym_atom_semantics a
  admissible_id := by
    intro a
    rfl
  admissible_comp := by
    intro f g hf hg a
    rw [Function.comp_apply, hg, hf]
  semantics_invariant := by
    intro f hf a
    exact hf a

def zsym_object : SeqSEqObject where
  base := zsym_symbolic_structure
  compose := FiniteWord.concat
  neutral := FiniteWord.empty
  semantics := zsym_word_semantics
  localReduction := zsym_localReduction
  compose_assoc := by
    intro u v w
    simp
  neutral_left := by
    intro w
    simp
  neutral_right := by
    intro w
    simp
  semantics_singleton := by
    intro a
    exact zsym_word_semantics_singleton a

theorem zsym_cancelAdjacent_is_localReduction :
    zsym_object.localReduction cancelAdjacent := by
  exact Or.inl rfl

theorem zsym_identity_is_localReduction :
    zsym_object.localReduction _root_.id := by
  exact Or.inr rfl

theorem zsym_reduction_semantics_correct :
    zsym_object.ReductionSemanticsCorrect := by
  intro r hr w
  exact zsym_localReduction_semantics_preserved hr w

theorem zsym_in_seqseq : Nonempty SeqSEqCat :=
  ⟨zsym_object⟩

theorem zsym_example_semantics_SP :
  zsym_object.semantics [ZSymAtom.S, ZSymAtom.P] = (0 : Int) := by
  simp [zsym_object, zsym_word_semantics]

theorem zsym_example_cancellation :
    cancelAdjacent [ZSymAtom.S, ZSymAtom.P, ZSymAtom.S] = [ZSymAtom.S] := by
  rfl

end PhysicsLean
