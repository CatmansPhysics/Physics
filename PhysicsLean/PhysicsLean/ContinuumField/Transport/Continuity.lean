import PhysicsLean.QuantumStat.Thermo.PartitionResolvent

namespace PhysicsLean

structure ConservedField (σ : Type _) where
  density : σ → Rat
  current : σ → Rat

def continuityResidual {σ : Type _} (field : ConservedField σ) (state : σ) : Rat :=
  field.density state - field.current state

end PhysicsLean
