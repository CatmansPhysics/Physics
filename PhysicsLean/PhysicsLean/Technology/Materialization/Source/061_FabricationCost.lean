import PhysicsLean.Technology.Materialization.Source.«060_ResourceBudget»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure StagedFabricationCost where
  matterUsed : Rat
  growthAction : Rat
  annealAction : Rat
  repairAction : Rat
  informationUsed : Rat
  controlCost : Rat
  irrecoverableWaste : Rat
  deriving Repr

def stagedActionCost (cost : StagedFabricationCost) : Rat :=
  cost.growthAction + cost.annealAction + cost.repairAction

def totalFabricationCost (cost : StagedFabricationCost) : Rat :=
  cost.matterUsed + stagedActionCost cost + cost.informationUsed + cost.controlCost + cost.irrecoverableWaste

def stagedCostAdditive (cost : StagedFabricationCost) : Prop :=
  stagedActionCost cost = cost.growthAction + cost.annealAction + cost.repairAction

end Technology.Materialization.Source
end PhysicsLean
