import PhysicsLean.QuantumStat.Information.Density

/-!
# Entropy Shadows

Minimal entropy-like observable on rational weights.
-/

namespace PhysicsLean

def entropyTerm (p : Rat) : Rat :=
  p * (1 - p)

def entropyShadow {α : Type _} (ρ : DensityShadow α) : Rat :=
  (ρ.support.map fun state => entropyTerm (ρ.weight state)).sum

end PhysicsLean
