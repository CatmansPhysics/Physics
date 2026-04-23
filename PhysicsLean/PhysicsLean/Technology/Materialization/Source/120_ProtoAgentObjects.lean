import PhysicsLean.Technology.Materialization.Source.«118_AdaptiveFailureModes»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure ProtoAgentSpecification where
  substratePredicates : List String
  sensoryPredicates : List String
  memoryPredicates : List String
  actionPredicates : List String
  policyPredicates : List String
  tolerance : Rat
  persistenceWindow : Nat
  deriving Repr

def protoAgentSpecificationAdmissible (spec : ProtoAgentSpecification) : Prop :=
  0 < spec.substratePredicates.length ∧
    0 < spec.memoryPredicates.length ∧ 0 <= spec.tolerance

def protoAgentObjectAdmissible (obj : ProtoAgentObject) : Prop :=
  deviceLikeObjectAdmissible obj.baseDevice ∧
    0 < obj.internalSymbolLabels.length ∧ 0 < obj.policyLabels.length

end Technology.Materialization.Source
end PhysicsLean
