import PhysicsLean.Technology.Materialization.Source.«054_FabricatorHierarchy»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure InverseProblemArchitecture where
  reservoir : PrecursorTheory
  fabricator : Fabricator
  channelLabels : List String
  budgetLabel : String
  deriving Repr

def inverseProblemArchitectureAdmissible (problem : InverseProblemArchitecture) : Prop :=
  precursorNonempty problem.reservoir ∧
    fabricatorAdmissible problem.fabricator ∧
      0 < problem.channelLabels.length ∧ problem.budgetLabel != ""

structure MinimalFabricationSolution where
  architecture : InverseProblemArchitecture
  matterCost : Rat
  controlCost : Rat
  deriving Repr

def minimalFabricationSolutionAdmissible (solution : MinimalFabricationSolution) : Prop :=
  inverseProblemArchitectureAdmissible solution.architecture ∧
    0 <= solution.matterCost ∧ 0 <= solution.controlCost

end Technology.Materialization.Source
end PhysicsLean
