import PhysicsLean.Technology.Materialization.Source.«123_ActionGuidedMaterialization»

namespace PhysicsLean
namespace Technology.Materialization.Source

def protoAgencyCriterion
    (obj : ProtoAgentObject)
    (sector : SymbolicMemorySector)
    (policy : PolicyMap)
    (channel : ActionGuidedMaterializationChannel) : Prop :=
  protoAgentObjectAdmissible obj ∧
    symbolicallyAdmissibleMemorySector sector ∧
      policyMapAdmissible policy ∧ actionGuidedMaterializationChannelAdmissible channel

def strongAdaptationNecessaryButNotSufficient
    (device : SimpleCompositeDevice)
    (stateSpace : DeviceFunctionalStateSpace)
    (recovery : RecoveryChannel)
    (criterion : BoundedCorrectionCriterion)
    (feedback : FeedbackSector)
    (memory : DeviceMemorySector) : Prop :=
  stronglyAdaptiveDevice device stateSpace recovery criterion feedback memory

end Technology.Materialization.Source
end PhysicsLean
