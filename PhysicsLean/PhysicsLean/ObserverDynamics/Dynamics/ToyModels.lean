import PhysicsLean.ObserverDynamics.Geometry.GravityChannel
import PhysicsLean.ObserverDynamics.Dynamics.EffectiveEquations

/-!
# Observer-Dynamics Toy Models

Small examples wiring together histories, observers, and action summaries.
-/

namespace PhysicsLean

inductive ToyLabel where
  | emit
  | absorb
  deriving DecidableEq, Repr

def toyHistory : CausalHistory Int ToyLabel where
  events := [
    ⟨0, 1, ToyLabel.emit⟩,
    ⟨1, 3, ToyLabel.emit⟩,
    ⟨3, 2, ToyLabel.absorb⟩
  ]

def fineObserver : Observer Int ToyLabel Int Int where
  proj := fun event => event.target
  clock := fun event => event.target
  coarse := id

def coarseObserver : Observer Int ToyLabel Int Int where
  proj := fun event => event.target % 2
  clock := fun event => event.target / 2
  coarse := id

def toyAction : StructuralAction Int ToyLabel Int where
  eventCost := fun event => event.target - event.source

theorem toy_observer_images_differ :
    fineObserver.projectHistory toyHistory ≠ coarseObserver.projectHistory toyHistory := by
  decide

theorem toy_action_value : toyAction.historyAction toyHistory = 2 := by
  native_decide

end PhysicsLean
