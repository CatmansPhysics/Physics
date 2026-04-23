import PhysicsLean.Technology.Materialization.Source.«063_WasteCalculus»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure FabricationFeasibilityInput where
  completionScore : Rat
  usabilityScore : Rat
  cost : StagedFabricationCost
  waste : WasteDecomposition
  budget : FabricationBudget
  deriving Repr

def fabricationFeasibilityFunctional (input : FabricationFeasibilityInput) : Rat :=
  input.completionScore + input.usabilityScore -
    stagedActionCost input.cost / (input.budget.actionBudget + 1) -
      input.cost.controlCost / (input.budget.controlBudget + 1) -
        totalIrrecoverableWaste input.waste / (input.budget.wasteBudget + 1) -
          input.cost.matterUsed / (input.budget.matterBudget + 1)

end Technology.Materialization.Source
end PhysicsLean
