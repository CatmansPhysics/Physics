import PhysicsLean.ObserverDynamics.Dynamics.Action

/-!
# Energy and Momentum Shadows

Minimal observer-level energy/momentum summaries derived from structural action.
-/

namespace PhysicsLean

structure EnergyMomentumShadow where
  energy : Int
  momentum : Int

namespace EnergyMomentumShadow

def ofAction {α ℓ : Type _}
    (action : StructuralAction α ℓ Int) (history : CausalHistory α ℓ) : EnergyMomentumShadow where
  energy := action.historyAction history
  momentum := Int.ofNat history.events.length

end EnergyMomentumShadow

end PhysicsLean
