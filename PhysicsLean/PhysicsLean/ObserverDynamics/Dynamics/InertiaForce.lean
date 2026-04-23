import PhysicsLean.ObserverDynamics.Dynamics.EnergyMomentum

/-!
# Inertia and Force Shadows

Minimal coarse dynamics derived from momentum change.
-/

namespace PhysicsLean

structure InertiaForceShadow where
  inertia : Int
  force : Int

namespace InertiaForceShadow

def fromMomenta (before after : EnergyMomentumShadow) : InertiaForceShadow where
  inertia := before.momentum
  force := after.momentum - before.momentum

end InertiaForceShadow

end PhysicsLean
