import PhysicsLean.Technology.Materialization.Source.«075_InverseDesignScore»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure LayeredInverseDesign where
  architectureClass : FabricatorClass
  reservoir : PrecursorTheory
  channelLabels : List String
  budget : FabricationBudget
  deriving Repr

def layeredInverseDesignAdmissible
    (problem : InverseMaterializationProblem)
    (realizer : MaterializationRealizer)
    (layered : LayeredInverseDesign) : Prop :=
  realizesSpecificationInClass problem layered.architectureClass realizer ∧
    realizer.reservoir = layered.reservoir ∧
      realizer.channelLabels = layered.channelLabels ∧ realizer.budget = layered.budget

def architectureFirstPrinciple
    (problem : InverseMaterializationProblem)
    (realizer : MaterializationRealizer)
    (layered : LayeredInverseDesign) : Prop :=
  architectureClassCompatible layered.architectureClass realizer.fabricator →
    layeredInverseDesignAdmissible problem realizer layered

end Technology.Materialization.Source
end PhysicsLean
