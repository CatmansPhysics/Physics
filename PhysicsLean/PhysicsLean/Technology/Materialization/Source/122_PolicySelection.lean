import PhysicsLean.Technology.Materialization.Source.«121_StrongSymbolicStates»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure PolicyMap where
  stateActionPairs : List (String × String)
  deriving Repr

def policyMapAdmissible (policy : PolicyMap) : Prop :=
  0 < policy.stateActionPairs.length

def policySelectiveObject
    (policy : PolicyMap)
    (leftState rightState : String)
    (leftAction rightAction : String) : Prop :=
  (leftState, leftAction) ∈ policy.stateActionPairs ∧
    (rightState, rightAction) ∈ policy.stateActionPairs ∧ leftState != rightState ∧ leftAction != rightAction

def policyAdmissible
    (policy : PolicyMap)
    (budget : FabricationBudget) : Prop :=
  policyMapAdmissible policy ∧ fabricationBudgetAdmissible budget

end Technology.Materialization.Source
end PhysicsLean
