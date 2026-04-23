import PhysicsLean.ObserverDynamics.Geometry.SpaceTimeImage

/-!
# Gravity-Like Channel

A minimal observer-level potential channel between projected states.
-/

universe u v

namespace PhysicsLean

structure GravityLikeChannel (β : Type u) (ι : Type v) where
  potential : β → β → ι

namespace GravityLikeChannel

def pairPotential {β : Type u} {ι : Type v}
    (channel : GravityLikeChannel β ι) (source target : β) : ι :=
  channel.potential source target

end GravityLikeChannel

end PhysicsLean
