import PhysicsLean.Technology.Materialization.Source.«080_InverseFailureModes»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure SimpleBody where
  geometryLabels : List String
  compositionLabels : List String
  persistenceWindow : Nat
  deriving Repr

inductive MaterializationHierarchyLevel where
  | h0
  | h1
  | h2
  | h3
  | h4
  | h5
  deriving Repr, DecidableEq

structure HierarchicalSpecification where
  substratePredicates : List String
  interfacePredicates : List String
  functionPredicates : List String
  memoryPredicates : List String
  deriving Repr

def hierarchicalSpecificationAdmissible (spec : HierarchicalSpecification) : Prop :=
  0 < spec.substratePredicates.length

end Technology.Materialization.Source
end PhysicsLean
