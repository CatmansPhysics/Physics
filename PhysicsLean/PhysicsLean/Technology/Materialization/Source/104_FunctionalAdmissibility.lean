import PhysicsLean.Technology.Materialization.Source.«103_DeviceMemory»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure DeviceFunctionalStateSpace where
  stateLabels : List String
  deriving Repr

def functionalAdmissibilityRegion
    (device : SimpleCompositeDevice)
    (stateSpace : DeviceFunctionalStateSpace) : Prop :=
  simpleCompositeDeviceAdmissible device ∧ 0 < stateSpace.stateLabels.length

def usableDevice
    (device : SimpleCompositeDevice)
    (stateSpace : DeviceFunctionalStateSpace) : Prop :=
  functionalAdmissibilityRegion device stateSpace

end Technology.Materialization.Source
end PhysicsLean
