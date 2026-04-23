import PhysicsLean.Technology.Materialization.Source.«100_SimpleDevice»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure BodySector where
  substrateLabels : List String
  deriving Repr

structure InterfaceSubsystem where
  interfaceLabels : List String
  deriving Repr

structure OutputSector where
  outputLabels : List String
  deriving Repr

structure DeviceMemorySector where
  memoryLabels : List String
  metastableStates : Nat
  deriving Repr

def bodySectorAdmissible (body : BodySector) : Prop :=
  0 < body.substrateLabels.length

def interfaceSubsystemAdmissible (interface : InterfaceSubsystem) : Prop :=
  0 < interface.interfaceLabels.length

def outputSectorAdmissible (output : OutputSector) : Prop :=
  0 < output.outputLabels.length

def deviceMemorySectorAdmissible (memory : DeviceMemorySector) : Prop :=
  2 <= memory.metastableStates ∧ 0 < memory.memoryLabels.length

end Technology.Materialization.Source
end PhysicsLean
