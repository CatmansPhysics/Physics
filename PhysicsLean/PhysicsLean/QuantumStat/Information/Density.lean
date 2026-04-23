import PhysicsLean.QuantumStat.Measurement.Decoherence

/-!
# Density Shadows

Minimal finite density object carrying rational weights.
-/

universe u

namespace PhysicsLean

structure DensityShadow (α : Type u) where
  support : List α
  weight : α → Rat

namespace DensityShadow

def totalMass {α : Type u} (ρ : DensityShadow α) : Rat :=
  (ρ.support.map ρ.weight).sum

end DensityShadow

end PhysicsLean
