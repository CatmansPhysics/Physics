import PhysicsLean.Technology.Materialization.Source.«064_FeasibilityFunctional»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure MinimalSufficientCost where
  value : Rat
  feasible : Prop

def minimalSufficientCostAdmissible (cost : MinimalSufficientCost) : Prop :=
  0 <= cost.value ∧ cost.feasible

def architectureConditionedMinimalCost
    (value : Rat)
    (classPenalty : Rat) : Rat :=
  value + classPenalty

def architectureMattersForCost
    (passiveCost templatedCost predictiveCost : Rat) : Prop :=
  passiveCost != templatedCost ∨ templatedCost != predictiveCost

end Technology.Materialization.Source
end PhysicsLean
