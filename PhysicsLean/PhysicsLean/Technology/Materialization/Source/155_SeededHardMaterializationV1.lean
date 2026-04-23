import PhysicsLean.Technology.Materialization.Source.«154_PostControlPersistence»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure SeededHardMaterializationV1 where
  targetLabel : String
  seedLabel : String
  reservoirLabel : String
  completionScore : Rat
  deriving Repr

def seededHardMaterializationV1Admissible
    (chain : SeededHardMaterializationV1) : Prop :=
  chain.targetLabel != "" ∧ chain.seedLabel != "" ∧ chain.reservoirLabel != "" ∧ 0 <= chain.completionScore

end Technology.Materialization.Source
end PhysicsLean
