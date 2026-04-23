import PhysicsLean.Technology.Materialization.Source.«132_SelfRepairAndExtension»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure RecursiveMaterializationChain where
  generationLabels : List String
  recursiveDepth : Nat
  deriving Repr

def recursiveMaterializationChainAdmissible (chain : RecursiveMaterializationChain) : Prop :=
  0 < chain.generationLabels.length

def unboundedRecursiveMaterialization (chain : RecursiveMaterializationChain) : Prop :=
  recursiveMaterializationChainAdmissible chain ∧ 0 < chain.recursiveDepth

end Technology.Materialization.Source
end PhysicsLean
