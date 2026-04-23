import PhysicsLean.ObserverDynamics.Observer.Projection

/-!
# Observer Invariance

Basic invariance lemmas under admissible observer equivalence.
-/

universe u v w

namespace PhysicsLean

theorem observer_projection_invariant {α : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    {left right : Observer α ℓ β τ}
    (hEq : Observer.observerEquivalent left right)
    (history : CausalHistory α ℓ) :
    left.projectHistory history = right.projectHistory history :=
  Observer.projectHistory_eq_of_equivalent hEq history

theorem observer_time_invariant {α : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    {left right : Observer α ℓ β τ}
    (hEq : Observer.observerEquivalent left right)
    (history : CausalHistory α ℓ) :
    left.timeHistory history = right.timeHistory history :=
  Observer.timeHistory_eq_of_equivalent hEq history

end PhysicsLean
