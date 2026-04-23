import PhysicsLean.Technology.Materialization.Source.«106_DeviceFabricationChannel»

namespace PhysicsLean
namespace Technology.Materialization.Source

def deviceSubstrateTheorem (body : BodySector) : Prop :=
  bodySectorAdmissible body

def deviceInterfaceTheorem
    (input : InputChannel)
    (transfer : InternalTransferChannel) : Prop :=
  functionallyAdmissibleThroughInterfaces input transfer

def deviceMemoryTheorem (memory : DeviceMemorySector) : Prop :=
  admissibleDeviceMemoryCriterion memory

def deviceFunctionalClosureTheorem
    (device : SimpleCompositeDevice)
    (stateSpace : DeviceFunctionalStateSpace) : Prop :=
  functionalAdmissibilityRegion device stateSpace

def deviceUsabilityTheorem
    (device : SimpleCompositeDevice)
    (stateSpace : DeviceFunctionalStateSpace) : Prop :=
  usableDevice device stateSpace

end Technology.Materialization.Source
end PhysicsLean
