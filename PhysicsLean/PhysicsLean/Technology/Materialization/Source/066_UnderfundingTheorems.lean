import PhysicsLean.Technology.Materialization.Source.«065_MinimalSufficientCost»

namespace PhysicsLean
namespace Technology.Materialization.Source

def actionUnderfundingImpossibility
    (budget : FabricationBudget)
    (cost : StagedFabricationCost) : Prop :=
  budget.actionBudget < stagedActionCost cost

def matterUnderfundingImpossibility
    (budget : FabricationBudget)
    (cost : StagedFabricationCost) : Prop :=
  budget.matterBudget < cost.matterUsed

def informationUnderfundingTheorem
    (budget : FabricationBudget)
    (memory : SpecificationMemory)
    (requiredInformation : Rat) : Prop :=
  budget.informationBudget < requiredInformation ∧ requiredInformation <= fabricationUsefulInformation memory

def wasteOverflowTheorem
    (budget : FabricationBudget)
    (waste : WasteDecomposition) : Prop :=
  budget.wasteBudget < totalIrrecoverableWaste waste

end Technology.Materialization.Source
end PhysicsLean
