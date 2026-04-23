import PhysicsLean.Foundations.Prelude

/-!
# PhysicsLean Foundations List

This file contains small list-level combinatorial helpers for working with
finite words as explicit sequences. The main utilities here extract contiguous
blocks and package elementary rewrite-friendly identities.
-/

namespace PhysicsLean.List

variable {α : Type _}

def block (start size : Nat) (xs : List α) : List α :=
  (xs.drop start).take size

@[simp] theorem block_zero (size : Nat) (xs : List α) :
    block 0 size xs = xs.take size := by
  simp [block]

@[simp] theorem block_nil (start size : Nat) :
    block start size ([] : List α) = [] := by
  simp [block]

@[simp] theorem block_eq_take_drop (start size : Nat) (xs : List α) :
    block start size xs = (xs.drop start).take size := rfl

theorem take_append_drop_eq (n : Nat) (xs : List α) :
    xs.take n ++ xs.drop n = xs := by
  exact List.take_append_drop n xs

theorem length_block_le (start size : Nat) (xs : List α) :
    (block start size xs).length ≤ size := by
  unfold block
  exact List.length_take_le size (xs.drop start)

theorem block_prefix_eq_take (size : Nat) (xs : List α) :
    block 0 size xs = xs.take size := by
  simp [block]

theorem block_all_eq_drop (start : Nat) (xs : List α) :
    block start (xs.length - start) xs = xs.drop start := by
  simp [block]

theorem mem_of_mem_block {start size : Nat} {xs : List α} {a : α}
    (h : a ∈ block start size xs) : a ∈ xs := by
  unfold block at h
  exact List.mem_of_mem_drop (List.mem_of_mem_take h)

end PhysicsLean.List
