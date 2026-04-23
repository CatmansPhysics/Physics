import PhysicsLean.ContinuumField.Relativistic.EffectiveCone

namespace PhysicsLean

structure LocalFieldImage (σ : Type _) where
  field : σ → Rat

def fieldDifference {σ : Type _} (image : LocalFieldImage σ) (x y : σ) : Rat :=
  image.field x - image.field y

end PhysicsLean
