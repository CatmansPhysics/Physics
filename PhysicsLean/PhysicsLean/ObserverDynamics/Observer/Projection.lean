import PhysicsLean.ObserverDynamics.Observer.Basic

/-!
# Observer Projection

Projection comparison and coarse-observation helpers.
-/

universe u v w

namespace PhysicsLean

namespace Observer

def observerEquivalent {α : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    (left right : Observer α ℓ β τ) : Prop :=
  (∀ event, left.proj event = right.proj event) ∧
  (∀ event, left.clock event = right.clock event) ∧
  (∀ image, left.coarse image = right.coarse image)

theorem projectHistory_eq_of_equivalent {α : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    {left right : Observer α ℓ β τ} (hEq : observerEquivalent left right)
    (history : CausalHistory α ℓ) :
    left.projectHistory history = right.projectHistory history := by
  rcases hEq with ⟨hProj, _, hCoarse⟩
  have hMap : history.events.map left.projectEvent = history.events.map right.projectEvent := by
    simp [Observer.projectEvent, hProj]
  rw [Observer.projectHistory, Observer.projectHistory, hCoarse, hMap]

theorem timeHistory_eq_of_equivalent {α : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    {left right : Observer α ℓ β τ} (hEq : observerEquivalent left right)
    (history : CausalHistory α ℓ) :
    left.timeHistory history = right.timeHistory history := by
  rcases hEq with ⟨_, hClock, _⟩
  simp [Observer.timeHistory, Observer.timeStamp, hClock]

end Observer

end PhysicsLean
