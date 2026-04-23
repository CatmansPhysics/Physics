import PhysicsLean.ObserverDynamics.Dynamics.InertiaForce

/-!
# Effective Equations

Minimal effective update laws.
-/

namespace PhysicsLean

structure EffectiveEquation (σ : Type _) where
  step : σ → σ

namespace EffectiveEquation

def iterate {σ : Type _} (equation : EffectiveEquation σ) : Nat → σ → σ
  | 0, state => state
  | n + 1, state => iterate equation n (equation.step state)

@[simp] theorem iterate_zero {σ : Type _} (equation : EffectiveEquation σ) (state : σ) :
    equation.iterate 0 state = state := rfl

end EffectiveEquation

end PhysicsLean
