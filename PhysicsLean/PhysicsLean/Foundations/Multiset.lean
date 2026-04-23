import PhysicsLean.Foundations.Prelude
import Mathlib.Data.List.Permutation
import Mathlib.Data.Multiset.Dedup

/-!
# PhysicsLean Foundations Multiset

This file records permutation and multiset-style lemmas used when word data is
viewed up to reordering rather than exact list presentation. It sits directly
above the raw list layer and supplies small transport lemmas for later symbolic
packages.
-/

namespace PhysicsLean.List

variable {α : Type _}

theorem perm_append_left {xs ys zs : List α} (h : List.Perm ys zs) :
    List.Perm (xs ++ ys) (xs ++ zs) := by
  exact h.append_left xs

theorem perm_append_right {xs ys zs : List α} (h : List.Perm xs ys) :
    List.Perm (xs ++ zs) (ys ++ zs) := by
  exact h.append_right zs

end PhysicsLean.List

namespace PhysicsLean.Multiset

section DecidableEq

variable {α : Type _}
variable [DecidableEq α]

theorem dedup_eq_self_of_nodup {s : Multiset α} (h : s.Nodup) : s.dedup = s := by
  exact Multiset.dedup_eq_self.mpr h

theorem nodup_of_dedup_eq_self {s : Multiset α} (h : s.dedup = s) : s.Nodup := by
  exact Multiset.dedup_eq_self.mp h

theorem dedup_eq_self_iff_nodup {s : Multiset α} : s.dedup = s ↔ s.Nodup := by
  exact Multiset.dedup_eq_self

theorem mem_of_mem_dedup {s : Multiset α} {a : α} (h : a ∈ s.dedup) : a ∈ s := by
  exact (Multiset.mem_dedup.mp h)

end DecidableEq

end PhysicsLean.Multiset
