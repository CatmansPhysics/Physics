import PhysicsLean.Technology.Materialization.Source.«095_HierarchicalInverseDesign»

namespace PhysicsLean
namespace Technology.Materialization.Source

def substrateToFunctionLift (realizer : HierarchicalRealizer) : Prop :=
  hierarchicalRealizerAdmissible realizer

def memoryLift
    (realizer : HierarchicalRealizer)
    (memory : EmbeddedMemorySubsystem) : Prop :=
  hierarchicalRealizerAdmissible realizer ∧ embeddedMemoryAdmissible memory

def adaptationLift
    (realizer : HierarchicalRealizer)
    (obj : SelfMonitoringFunctionalObject) : Prop :=
  hierarchicalRealizerAdmissible realizer ∧ informationalClosureForFabricatedObject obj

def protoAgencyThresholdTheorem
    (realizer : HierarchicalRealizer)
    (obj : ProtoAgentObject) : Prop :=
  hierarchicalRealizerAdmissible realizer ∧ protoAgentThresholdCrossed obj

end Technology.Materialization.Source
end PhysicsLean
