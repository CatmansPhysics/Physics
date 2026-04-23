import PhysicsLean.Technology.Materialization.Source.«126_ProtoAgentFailureModes»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure SelfFabricatingSystem where
  protoAgent : ProtoAgentObject
  hereditaryLabels : List String
  internalFabricatorLabels : List String
  deriving Repr

def selfFabricatingSystemAdmissible (system : SelfFabricatingSystem) : Prop :=
  protoAgentObjectAdmissible system.protoAgent ∧
    0 < system.hereditaryLabels.length ∧ 0 < system.internalFabricatorLabels.length

structure SelfFabricationChannel where
  resourceLabels : List String
  successorLabels : List String
  wasteLabels : List String
  repeatable : Bool
  deriving Repr

def selfFabricationChannelAdmissible (channel : SelfFabricationChannel) : Prop :=
  0 < channel.resourceLabels.length ∧
    0 < channel.successorLabels.length ∧ channel.repeatable = true

def selfExtensionVsTrueSelfFabrication
    (system : SelfFabricatingSystem)
    (channel : SelfFabricationChannel) : Prop :=
  selfFabricatingSystemAdmissible system ∧ selfFabricationChannelAdmissible channel

end Technology.Materialization.Source
end PhysicsLean
