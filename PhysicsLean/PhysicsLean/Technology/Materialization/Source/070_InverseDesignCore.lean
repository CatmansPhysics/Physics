import PhysicsLean.Technology.Materialization.Source.«069_BudgetFailureModes»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure InverseMaterializationProblem where
  specification : SpecificationTheory
  deriving Repr

structure MaterializationRealizer where
  fabricator : Fabricator
  reservoir : PrecursorTheory
  channelLabels : List String
  budget : FabricationBudget
  deriving Repr

def realizesSpecification
    (problem : InverseMaterializationProblem)
    (realizer : MaterializationRealizer) : Prop :=
  observerSpecificationAdmissible problem.specification ∧
    fabricatorAdmissible realizer.fabricator ∧
      precursorNonempty realizer.reservoir ∧
        0 < realizer.channelLabels.length ∧ fabricationBudgetAdmissible realizer.budget

end Technology.Materialization.Source
end PhysicsLean
