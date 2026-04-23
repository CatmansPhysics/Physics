import PhysicsLean.Technology.Materialization.Source.«112_FeedbackArchitecture»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure BoundedCorrectionCriterion where
  correctionCostBound : Rat
  recoveryTimeBound : Rat
  postRepairDefectBound : Rat
  deriving Repr

def boundedCorrectionCriterionAdmissible (criterion : BoundedCorrectionCriterion) : Prop :=
  0 <= criterion.correctionCostBound ∧
    0 <= criterion.recoveryTimeBound ∧ 0 <= criterion.postRepairDefectBound

def uniformlyRepairablePerturbationClass
    (perturbation : AdmissiblePerturbationClass)
    (criterion : BoundedCorrectionCriterion) : Prop :=
  admissiblePerturbationClassAdmissible perturbation ∧ boundedCorrectionCriterionAdmissible criterion

def adaptiveDevicesRequireMoreThanRepairableDefects
    (sector : FeedbackSector)
    (criterion : BoundedCorrectionCriterion) : Prop :=
  feedbackSectorAdmissible sector ∧ boundedCorrectionCriterionAdmissible criterion

end Technology.Materialization.Source
end PhysicsLean
