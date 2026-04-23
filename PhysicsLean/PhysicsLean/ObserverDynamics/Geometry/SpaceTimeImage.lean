import PhysicsLean.ObserverDynamics.Observer.Basic

/-!
# Space-Time Images

Observer-level space/time images extracted from a history.
-/

universe u v w

namespace PhysicsLean

structure ObserverImage (β : Type u) (τ : Type v) where
  space : List β
  time : List τ

namespace ObserverImage

def ofHistory {α : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    (observer : Observer α ℓ β τ) (history : CausalHistory α ℓ) : ObserverImage β τ where
  space := observer.projectHistory history
  time := observer.timeHistory history

end ObserverImage

end PhysicsLean
