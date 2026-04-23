import PhysicsLean.Technology.Materialization.Source.«093_AdaptiveObjects»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure DeviceLikeObject where
  body : SimpleBody
  interfaceCount : Nat
  outputLabels : List String
  deriving Repr

structure ProtoAgentObject where
  baseDevice : DeviceLikeObject
  internalSymbolLabels : List String
  policyLabels : List String
  deriving Repr

def deviceLikeObjectAdmissible (obj : DeviceLikeObject) : Prop :=
  0 < obj.outputLabels.length

def protoAgentThresholdCrossed (obj : ProtoAgentObject) : Prop :=
  deviceLikeObjectAdmissible obj.baseDevice ∧
    0 < obj.internalSymbolLabels.length ∧ 0 < obj.policyLabels.length

end Technology.Materialization.Source
end PhysicsLean
