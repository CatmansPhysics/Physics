import PhysicsLean.QuantumStat.Thermo.Potentials

/-!
# Irreversibility

Minimal coarse-grained entropy-production surrogate.
-/

namespace PhysicsLean

def entropyProduction (before after : Rat) : Rat :=
  after - before

end PhysicsLean
