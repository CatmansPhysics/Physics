import PhysicsLean.Technology.Materialization.Source.«067_RepairEconomics»

namespace PhysicsLean
namespace Technology.Materialization.Source

def selfExtendingFabricator
    (fabricator : Fabricator)
    (budget : FabricationBudget) : Prop :=
  fabricatorAdmissible fabricator ∧ fabricationBudgetAdmissible budget

def fabricatorPersistenceTheorem
    (fabricator : Fabricator)
    (budget : FabricationBudget) : Prop :=
  selfExtendingFabricator fabricator budget ∧ 0 < fabricator.actionLabels.length

end Technology.Materialization.Source
end PhysicsLean
