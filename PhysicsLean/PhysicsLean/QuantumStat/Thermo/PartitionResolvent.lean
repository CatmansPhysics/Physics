import PhysicsLean.QuantumStat.Information.Entropy

/-!
# Partition Resolvent

Minimal finite partition object with rational inverse-temperature parameter.
-/

universe u

namespace PhysicsLean

structure PartitionResolvent (σ : Type u) where
  states : List σ
  energy : σ → Rat
  beta : Rat

namespace PartitionResolvent

def partitionValue {σ : Type u} (Z : PartitionResolvent σ) : Rat :=
  (Z.states.map fun state => 1 - Z.beta * Z.energy state).sum

end PartitionResolvent

end PhysicsLean
