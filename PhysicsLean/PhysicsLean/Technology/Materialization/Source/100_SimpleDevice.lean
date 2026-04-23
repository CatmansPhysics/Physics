import PhysicsLean.Technology.Materialization.Source.«096_HierarchyTheorems»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure SimpleCompositeDevice where
  bodyLabels : List String
  interfaceLabels : List String
  outputLabels : List String
  memoryLabels : List String
  deriving Repr

def simpleCompositeDeviceAdmissible (device : SimpleCompositeDevice) : Prop :=
  0 < device.bodyLabels.length ∧ 0 < device.interfaceLabels.length ∧ 0 < device.outputLabels.length

end Technology.Materialization.Source
end PhysicsLean
