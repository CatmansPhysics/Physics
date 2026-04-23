import PhysicsLean.Foundations.Prelude

/-!
# PhysicsLean Foundations Logic

This file collects lightweight classical-logic helpers reused throughout the
project. The point is not to add new mathematics, but to remove repetitive
proof boilerplate in structural arguments.
-/

namespace PhysicsLean.Logic

theorem byContradiction {p : Prop} (h : ¬p → False) : p := by
  classical
  exact Classical.byContradiction h

theorem forall_swap {α : Type _} {β : Type _} {p : α → β → Prop} :
    (∀ a b, p a b) ↔ ∀ b a, p a b := by
  constructor
  · intro h b a
    exact h a b
  · intro h a b
    exact h b a

theorem exists_swap {α : Type _} {β : Type _} {p : α → β → Prop} :
    (∃ a b, p a b) ↔ ∃ b a, p a b := by
  constructor
  · rintro ⟨a, b, hab⟩
    exact ⟨b, a, hab⟩
  · rintro ⟨b, a, hab⟩
    exact ⟨a, b, hab⟩

theorem exists_imp_exists {α : Type _} {p q : α → Prop}
    (h : ∀ a, p a → q a) : (∃ a, p a) → ∃ a, q a := by
  rintro ⟨a, ha⟩
  exact ⟨a, h a ha⟩

theorem forall_congr {α : Type _} {p q : α → Prop}
    (h : ∀ a, p a ↔ q a) : (∀ a, p a) ↔ ∀ a, q a := by
  constructor
  · intro hp a
    exact (h a).1 (hp a)
  · intro hq a
    exact (h a).2 (hq a)

theorem exists_congr {α : Type _} {p q : α → Prop}
    (h : ∀ a, p a ↔ q a) : (∃ a, p a) ↔ ∃ a, q a := by
  constructor
  · rintro ⟨a, ha⟩
    exact ⟨a, (h a).1 ha⟩
  · rintro ⟨a, ha⟩
    exact ⟨a, (h a).2 ha⟩

end PhysicsLean.Logic
