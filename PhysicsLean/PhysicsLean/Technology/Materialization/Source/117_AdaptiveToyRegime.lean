import PhysicsLean.Technology.Materialization.Source.«116_AdaptiveDevice»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure BinarySelectorUnderPerturbation where
  selector : BinarySelectorDevice
  interfaceNoise : Bool
  outputDrift : Bool
  memoryFlipTendency : Bool
  deriving Repr

structure SelectorRecoveryPolicy where
  policyLabels : List String
  distinguishesMemoryDrift : Bool
  deriving Repr

def selectorRecoveryPolicyAdmissible (policy : SelectorRecoveryPolicy) : Prop :=
  0 < policy.policyLabels.length ∧ policy.distinguishesMemoryDrift = true

end Technology.Materialization.Source
end PhysicsLean
