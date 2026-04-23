import PhysicsLean.Technology.Materialization.Source.«066_UnderfundingTheorems»

namespace PhysicsLean
namespace Technology.Materialization.Source

def postFabricationEconomicGain
    (usableValue completedValue repairCost : Rat) : Rat :=
  usableValue - completedValue - repairCost

def repairWorthy (usableValue completedValue repairCost : Rat) : Prop :=
  repairCost <= usableValue - completedValue

end Technology.Materialization.Source
end PhysicsLean
