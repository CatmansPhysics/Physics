import PhysicsLean.ObserverDynamics.Causal.History

/-!
# Structural Action

Minimal additive action on causal histories.
-/

universe u v w

namespace PhysicsLean

structure StructuralAction (α : Type u) (ℓ : Type v) (ι : Type w) [AddMonoid ι] where
  eventCost : RewriteEvent α ℓ → ι

namespace StructuralAction

variable {α : Type u} {ℓ : Type v} {ι : Type w} [AddMonoid ι]

def historyAction (action : StructuralAction α ℓ ι) (history : CausalHistory α ℓ) : ι :=
  (history.events.map action.eventCost).sum

@[simp] theorem historyAction_nil (action : StructuralAction α ℓ ι) :
    action.historyAction ⟨[]⟩ = 0 := by
  simp [historyAction]

end StructuralAction

end PhysicsLean
