import PhysicsLean.StructuralCore.SeqSEq.Category

/-!
# The `Z_sym` Alphabet

This file defines the two-symbol alphabet underlying the concrete `Z_sym`
model. The letters `S` and `P` are the atomic signed steps from which the rest
of the `Z_sym` word dynamics is built.
-/

namespace PhysicsLean

inductive ZSymAtom where
  | S
  | P
  deriving DecidableEq, Repr

instance : Alphabet ZSymAtom where
  instDecidableEq := inferInstance

@[simp] theorem zsym_atom_ne_SP : ZSymAtom.S ≠ ZSymAtom.P := by
  decide

@[simp] theorem zsym_atom_ne_PS : ZSymAtom.P ≠ ZSymAtom.S := by
  decide

end PhysicsLean
