import PhysicsLean.QuantumStat.Thermo.PartitionResolvent

/-!
# Ensembles

Minimal finite ensembles induced by a partition object.
-/

universe u

namespace PhysicsLean

structure FiniteEnsemble (σ : Type u) where
  partition : PartitionResolvent σ

namespace FiniteEnsemble

def weight {σ : Type u} (ensemble : FiniteEnsemble σ) (state : σ) : Rat :=
  let Z := ensemble.partition.partitionValue
  if Z = 0 then 0 else (1 - ensemble.partition.beta * ensemble.partition.energy state) / Z

end FiniteEnsemble

end PhysicsLean
