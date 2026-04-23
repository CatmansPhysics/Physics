import PhysicsLean.StructuralCore.SEq.Category
import PhysicsLean.Foundations.FiniteWord

/-!
# SeqSEq Objects

This file defines the main word-level objects used in the symbolic sequence
package. A `SeqSEqObject` combines a base symbolic structure with a word
composition law, a neutral word, a semantic map on words, and a local
reduction theory.

## Role in the project

This is the central interface connecting abstract symbolic semantics to the
concrete `Z_sym` model and the later arithmetic-transfer packages.
-/

namespace PhysicsLean

structure SeqSEqObject where
  base : SymbolicStructure
  compose : FiniteWord base → FiniteWord base → FiniteWord base
  neutral : FiniteWord base
  semantics : FiniteWord base → base.Semantics
  localReduction : (FiniteWord base → FiniteWord base) → Prop
  compose_assoc : ∀ u v w,
    compose (compose u v) w = compose u (compose v w)
  neutral_left : ∀ w, compose neutral w = w
  neutral_right : ∀ w, compose w neutral = w
  semantics_singleton : ∀ a : base, semantics (FiniteWord.singleton a) = base.semantics a

namespace SeqSEqObject

abbrev Word (X : SeqSEqObject) := FiniteWord X.base

@[simp] theorem compose_assoc_apply (X : SeqSEqObject) (u v w : X.Word) :
    X.compose (X.compose u v) w = X.compose u (X.compose v w) :=
  X.compose_assoc u v w

@[simp] theorem neutral_left_apply (X : SeqSEqObject) (w : X.Word) :
    X.compose X.neutral w = w :=
  X.neutral_left w

@[simp] theorem neutral_right_apply (X : SeqSEqObject) (w : X.Word) :
    X.compose w X.neutral = w :=
  X.neutral_right w

@[simp] theorem semantics_singleton_apply (X : SeqSEqObject) (a : X.base) :
    X.semantics (FiniteWord.singleton a) = X.base.semantics a :=
  X.semantics_singleton a

end SeqSEqObject

end PhysicsLean
