import PhysicsLean.ObserverDynamics.Causal.Event

/-!
# Causal Histories

Minimal coherent histories built from rewrite events.
-/

universe u v

namespace PhysicsLean

structure CausalHistory (α : Type u) (ℓ : Type v) where
  events : List (RewriteEvent α ℓ)

namespace CausalHistory

def labels {α : Type u} {ℓ : Type v} (history : CausalHistory α ℓ) : List ℓ :=
  history.events.map RewriteEvent.label

def states {α : Type u} {ℓ : Type v} (history : CausalHistory α ℓ) : List α :=
  history.events.foldr (fun event acc => event.source :: event.target :: acc) []

@[simp] theorem labels_length {α : Type u} {ℓ : Type v} (history : CausalHistory α ℓ) :
    history.labels.length = history.events.length := by
  simp [labels]

end CausalHistory

end PhysicsLean
