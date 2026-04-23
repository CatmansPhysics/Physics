import PhysicsLean.Foundations.Prelude

/-!
# Causal Rewrite Events

Minimal event objects for the observer-and-dynamics package.
-/

universe u v

namespace PhysicsLean

structure RewriteEvent (α : Type u) (ℓ : Type v) where
  source : α
  target : α
  label : ℓ

structure CausalOrder (α : Type u) (ℓ : Type v) where
  precedes : RewriteEvent α ℓ → RewriteEvent α ℓ → Prop
  irrefl : ∀ e, ¬ precedes e e
  trans : ∀ {e₁ e₂ e₃}, precedes e₁ e₂ → precedes e₂ e₃ → precedes e₁ e₃

@[simp] theorem not_precedes_self {α : Type u} {ℓ : Type v}
    (O : CausalOrder α ℓ) (e : RewriteEvent α ℓ) :
    ¬ O.precedes e e :=
  O.irrefl e

end PhysicsLean
