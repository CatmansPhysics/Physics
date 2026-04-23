import PhysicsLean.Technology.Materialization.Source.«115_InformationalClosureDevice»

namespace PhysicsLean
namespace Technology.Materialization.Source

def adaptiveDevice
    (device : SimpleCompositeDevice)
    (stateSpace : DeviceFunctionalStateSpace)
    (channel : RecoveryChannel)
    (criterion : BoundedCorrectionCriterion) : Prop :=
  usableDevice device stateSpace ∧
    recoveryChannelAdmissible channel ∧ boundedCorrectionCriterionAdmissible criterion

def stronglyAdaptiveDevice
    (device : SimpleCompositeDevice)
    (stateSpace : DeviceFunctionalStateSpace)
    (channel : RecoveryChannel)
    (criterion : BoundedCorrectionCriterion)
    (sector : FeedbackSector)
    (memory : DeviceMemorySector) : Prop :=
  adaptiveDevice device stateSpace channel criterion ∧ informationalClosureForDevice sector memory

end Technology.Materialization.Source
end PhysicsLean
