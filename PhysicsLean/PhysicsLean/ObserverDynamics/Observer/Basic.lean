import PhysicsLean.ObserverDynamics.Causal.History

/-!
# Observers

Observers are represented by a projection, a clock image, and a coarse decoder.
-/

universe u v w

namespace PhysicsLean

structure Observer (α : Type u) (ℓ : Type v) (β : Type w) (τ : Type w) where
  proj : RewriteEvent α ℓ → β
  clock : RewriteEvent α ℓ → τ
  coarse : List β → List β

namespace Observer

def projectEvent {α : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    (observer : Observer α ℓ β τ) (event : RewriteEvent α ℓ) : β :=
  observer.proj event

def timeStamp {α : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    (observer : Observer α ℓ β τ) (event : RewriteEvent α ℓ) : τ :=
  observer.clock event

def projectHistory {α : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    (observer : Observer α ℓ β τ) (history : CausalHistory α ℓ) : List β :=
  observer.coarse (history.events.map observer.projectEvent)

def timeHistory {α : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    (observer : Observer α ℓ β τ) (history : CausalHistory α ℓ) : List τ :=
  history.events.map observer.timeStamp

end Observer

end PhysicsLean
