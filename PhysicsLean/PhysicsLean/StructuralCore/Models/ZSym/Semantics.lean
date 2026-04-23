import PhysicsLean.StructuralCore.Models.ZSym.Alphabet

/-!
# `Z_sym` Semantics

This file assigns integer semantics to `Z_sym` atoms and to words built from
them. Concretely, the semantics is the signed sum associated with the letters in
the word.
-/

namespace PhysicsLean

def zsym_atom_semantics : ZSymAtom → Int
  | .S => 1
  | .P => -1

def zsym_word_semantics : FiniteWord ZSymAtom → Int
  | [] => 0
  | a :: w => zsym_atom_semantics a + zsym_word_semantics w

@[simp] theorem zsym_atom_semantics_S : zsym_atom_semantics ZSymAtom.S = 1 := rfl

@[simp] theorem zsym_atom_semantics_P : zsym_atom_semantics ZSymAtom.P = -1 := rfl

@[simp] theorem zsym_word_semantics_nil : zsym_word_semantics ([] : FiniteWord ZSymAtom) = 0 := rfl

@[simp] theorem zsym_word_semantics_singleton (a : ZSymAtom) :
    zsym_word_semantics (FiniteWord.singleton a) = zsym_atom_semantics a := by
  cases a <;> rfl

@[simp] theorem zsym_word_semantics_append
    (u v : FiniteWord ZSymAtom) :
    zsym_word_semantics (u ++ v) = zsym_word_semantics u + zsym_word_semantics v := by
  induction u with
  | nil => simp [zsym_word_semantics]
  | cons a u ihu =>
      simp [zsym_word_semantics, ihu, add_assoc]

end PhysicsLean
