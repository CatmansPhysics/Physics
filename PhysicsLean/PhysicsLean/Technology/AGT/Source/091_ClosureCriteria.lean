import PhysicsLean.Technology.AGT.Source.«090_StatusRoadmap»

namespace PhysicsLean
namespace Technology.AGT.Source

structure ClosureCriteria where
  structural : Prop
  spectral : Prop
  field : Prop
  interface : Prop
  transport : Prop
  largeScale : Prop
  audit : Prop

def MinimalClosure (criteria : ClosureCriteria) : Prop :=
  criteria.structural ∧ criteria.spectral ∧ criteria.field

def StrongClosure (criteria : ClosureCriteria) : Prop :=
  MinimalClosure criteria ∧ criteria.interface ∧ criteria.transport ∧ criteria.largeScale ∧ criteria.audit

structure ProgressTier where
  title : String
  requirements : List String
  deriving Repr

def progressTiers : List ProgressTier :=
  [ { title := "Minimum"
      requirements := ["nontrivial q_g", "finite-state K_g", "at least one stable repulsive toy regime"] }
  , { title := "Good"
      requirements := ["neutral composite sector", "screening regime", "at least one stable wall or bubble", "distinct transport signatures"] }
  , { title := "Strong"
      requirements := ["spectral compatibility theorem", "full mixed-medium phase diagram", "large-scale distinctiveness from ordinary gravity", "formal audit and failure matrix"] } ]

theorem progressTiers_length : progressTiers.length = 3 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
