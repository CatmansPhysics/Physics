import PhysicsLean.Technology.Materialization.Source.«094_ProtoAgentThreshold»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure HierarchicalInverseDesignProblem where
  specification : HierarchicalSpecification
  hierarchyLevel : MaterializationHierarchyLevel
  deriving Repr

structure HierarchicalRealizer where
  problem : HierarchicalInverseDesignProblem
  realizer : MaterializationRealizer
  subsystemLabels : List String
  interfaceLabels : List String
  deriving Repr

def hierarchicalRealizerAdmissible (realizer : HierarchicalRealizer) : Prop :=
  hierarchicalSpecificationAdmissible realizer.problem.specification ∧
    0 < realizer.subsystemLabels.length ∧ 0 < realizer.interfaceLabels.length

def layeredAuditRequired (realizer : HierarchicalRealizer) : Prop :=
  hierarchicalRealizerAdmissible realizer

end Technology.Materialization.Source
end PhysicsLean
