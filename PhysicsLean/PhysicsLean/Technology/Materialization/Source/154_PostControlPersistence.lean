import PhysicsLean.Technology.Materialization.Source.«153_CrystallineLiftBridge»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure PostControlPersistenceCriterion where
  orderWindowScore : Rat
  defectWindowBound : Rat
  observationWindow : Rat
  deriving Repr

def postControlPersistenceCriterionAdmissible
    (criterion : PostControlPersistenceCriterion) : Prop :=
  0 <= criterion.orderWindowScore ∧
    0 <= criterion.defectWindowBound ∧ 0 <= criterion.observationWindow

def postControlPersistenceHolds
    (criterion : PostControlPersistenceCriterion)
    (threshold defectBudget : Rat) : Prop :=
  postControlPersistenceCriterionAdmissible criterion ∧
    threshold <= criterion.orderWindowScore ∧ criterion.defectWindowBound <= defectBudget

end Technology.Materialization.Source
end PhysicsLean
