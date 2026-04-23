import PhysicsLean.Technology.Materialization.Source.«114_AdaptiveFunctional»

namespace PhysicsLean
namespace Technology.Materialization.Source

def informationalClosureForDevice
    (sector : FeedbackSector)
    (memory : DeviceMemorySector) : Prop :=
  feedbackSectorAdmissible sector ∧ deviceMemorySectorAdmissible memory

def purelyReactiveWithoutInformationalClosure
    (sector : FeedbackSector)
    (memory : DeviceMemorySector) : Prop :=
  feedbackSectorAdmissible sector ∧ ¬ informationalClosureForDevice sector memory

end Technology.Materialization.Source
end PhysicsLean
