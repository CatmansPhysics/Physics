import PhysicsLean.Foundations.List

/-!
# PhysicsLean Foundations Finite Words

This file packages the basic finite-word operations used throughout the
symbolic side of the project. Words are implemented concretely as lists, but
the API is phrased in project terminology so later modules can talk about
empty words, singletons, and concatenation at the right level of abstraction.
-/

namespace PhysicsLean

class Alphabet (α : Type _) where
  instDecidableEq : DecidableEq α

attribute [reducible, instance] Alphabet.instDecidableEq

abbrev FiniteWord (α : Type _) := Word α

namespace FiniteWord

variable {α : Type _}

def empty : FiniteWord α := []

def singleton (a : α) : FiniteWord α := [a]

def concat (u v : FiniteWord α) : FiniteWord α := u ++ v

abbrev length (w : FiniteWord α) : Nat := _root_.List.length w

def localWindow (start size : Nat) (w : FiniteWord α) : FiniteWord α :=
  PhysicsLean.List.block start size w

@[simp] theorem empty_def : (empty : FiniteWord α) = [] := rfl

@[simp] theorem singleton_def (a : α) : singleton a = [a] := rfl

@[simp] theorem concat_def (u v : FiniteWord α) : concat u v = u ++ v := rfl

@[simp] theorem length_empty : length (empty : FiniteWord α) = 0 := rfl

@[simp] theorem length_singleton (a : α) : length (singleton a) = 1 := rfl

@[simp] theorem length_concat (u v : FiniteWord α) :
    length (concat u v) = length u + length v := by
  simp [concat, length]

@[simp] theorem concat_empty (w : FiniteWord α) : concat w empty = w := by
  simp [concat, empty]

@[simp] theorem empty_concat (w : FiniteWord α) : concat empty w = w := by
  simp [concat, empty]

theorem concat_assoc (u v w : FiniteWord α) :
    concat (concat u v) w = concat u (concat v w) := by
  simp [concat, List.append_assoc]

@[simp] theorem localWindow_eq_block (start size : Nat) (w : FiniteWord α) :
    localWindow start size w = PhysicsLean.List.block start size w := rfl

theorem length_localWindow_le (start size : Nat) (w : FiniteWord α) :
    length (localWindow start size w) ≤ size := by
  exact PhysicsLean.List.length_block_le start size w

end FiniteWord

end PhysicsLean
