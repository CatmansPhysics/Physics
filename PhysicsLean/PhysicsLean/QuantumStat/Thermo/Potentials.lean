import PhysicsLean.QuantumStat.Thermo.Ensembles

/-!
# Thermodynamic Potentials

Minimal free-energy style observable.
-/

namespace PhysicsLean

def freeEnergy {σ : Type _} (ensemble : FiniteEnsemble σ) : Rat :=
  -ensemble.partition.partitionValue

end PhysicsLean
