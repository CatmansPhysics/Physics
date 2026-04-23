import PhysicsLean.Technology.Materialization.Source.«105_BinarySelector»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure DeviceFabricationChannel where
  bodyStage : List String
  interfaceStage : List String
  outputStage : List String
  memoryStage : List String
  integrationStage : List String
  repairStage : List String
  deriving Repr

def deviceFabricationChannelAdmissible (channel : DeviceFabricationChannel) : Prop :=
  0 < channel.bodyStage.length ∧
    0 < channel.interfaceStage.length ∧
      0 < channel.outputStage.length ∧ 0 < channel.integrationStage.length

def notMereParallelFabrication (channel : DeviceFabricationChannel) : Prop :=
  deviceFabricationChannelAdmissible channel ∧ 0 < channel.repairStage.length

end Technology.Materialization.Source
end PhysicsLean
