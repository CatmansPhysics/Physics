import PhysicsLean.ContinuumField.Transport.Continuity

namespace PhysicsLean

structure DiffusionModel (σ : Type _) where
  diffusivity : Rat
  laplace : σ → Rat

def diffuseStep {σ : Type _} (model : DiffusionModel σ) (value : Rat) (state : σ) : Rat :=
  value + model.diffusivity * model.laplace state

end PhysicsLean
