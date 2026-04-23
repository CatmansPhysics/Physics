import PhysicsLean.Technology.Materialization.Source.«102_FunctionalInterfaces»

namespace PhysicsLean
namespace Technology.Materialization.Source

def statelessDevice (memory : DeviceMemorySector) : Prop :=
  memory.metastableStates <= 1

def statefulDevice (memory : DeviceMemorySector) : Prop :=
  deviceMemorySectorAdmissible memory

def admissibleDeviceMemoryCriterion (memory : DeviceMemorySector) : Prop :=
  statefulDevice memory

end Technology.Materialization.Source
end PhysicsLean
