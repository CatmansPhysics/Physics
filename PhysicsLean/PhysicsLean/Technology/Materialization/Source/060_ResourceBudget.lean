import PhysicsLean.Technology.Materialization.Source.«057_ArchitectureFailureModes»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure FabricationBudget where
  matterBudget : Rat
  actionBudget : Rat
  informationBudget : Rat
  controlBudget : Rat
  wasteBudget : Rat
  deriving Repr

def fabricationBudgetAdmissible (budget : FabricationBudget) : Prop :=
  0 <= budget.matterBudget ∧
    0 <= budget.actionBudget ∧
      0 <= budget.informationBudget ∧ 0 <= budget.controlBudget ∧ 0 <= budget.wasteBudget

end Technology.Materialization.Source
end PhysicsLean
