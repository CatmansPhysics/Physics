import PhysicsLean.Technology.Materialization.Source.«110_AdaptivePerturbations»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure RecoveryChannel where
  perturbation : AdmissiblePerturbationClass
  correctiveLabels : List String
  targetState : DeviceFunctionalStateSpace
  deriving Repr

def recoveryChannelAdmissible (channel : RecoveryChannel) : Prop :=
  admissiblePerturbationClassAdmissible channel.perturbation ∧
    0 < channel.correctiveLabels.length ∧ 0 < channel.targetState.stateLabels.length

def recoveryTime (cost timeBound : Rat) : Prop :=
  0 <= cost ∧ 0 <= timeBound

def recoveryDeficit (distance : Rat) : Prop :=
  0 <= distance

end Technology.Materialization.Source
end PhysicsLean
