import PhysicsLean.Foundations.Prelude
import Mathlib.Data.Setoid.Basic

/-!
# PhysicsLean Foundations Quotients

This file provides helper predicates expressing that functions and predicates
descend through a setoid. It is the small technical bridge from raw equivalence
relations to quotient-level constructions.
-/

namespace PhysicsLean

def SetoidInvariant {α : Type _} {β : Type _} (r : Setoid α) (f : α → β) : Prop :=
  ∀ ⦃a b : α⦄, a ≈ b → f a = f b

def SetoidPredicateInvariant {α : Type _} (r : Setoid α) (p : α → Prop) : Prop :=
  ∀ ⦃a b : α⦄, a ≈ b → (p a ↔ p b)

namespace SetoidInvariant

variable {α : Type _} {β : Type _} {γ : Type _}

theorem comp {r : Setoid α} {f : α → β} (h : SetoidInvariant r f) (g : β → γ) :
    SetoidInvariant r (g ∘ f) := by
  intro a b hab
  simp [Function.comp, h hab]

def lift {r : Setoid α} {f : α → β} (h : SetoidInvariant r f) : Quotient r → β :=
  Quotient.lift f (by
    intro a b hab
    exact h hab)

@[simp] theorem lift_mk {r : Setoid α} {f : α → β} (h : SetoidInvariant r f) (a : α) :
    lift h (Quotient.mk'' a) = f a := rfl

end SetoidInvariant

namespace SetoidPredicateInvariant

variable {α : Type _}

def lift {r : Setoid α} {p : α → Prop} (h : SetoidPredicateInvariant r p) : Quotient r → Prop :=
  Quotient.lift p (by
    intro a b hab
    exact propext (h hab))

@[simp] theorem lift_mk {r : Setoid α} {p : α → Prop}
    (h : SetoidPredicateInvariant r p) (a : α) :
    lift h (Quotient.mk'' a) ↔ p a := by
  rfl

end SetoidPredicateInvariant

end PhysicsLean
