import PhysicsLean.ContinuumField.Relativistic.FieldImage

namespace PhysicsLean

structure Propagator (σ : Type _) where
  kernel : σ → σ → Rat

def propagate {σ : Type _} (propagator : Propagator σ) (source target : σ) : Rat :=
  propagator.kernel source target

end PhysicsLean
