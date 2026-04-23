import PhysicsLean.Technology.Materialization.Source.«157_LocalCompatibility»
import PhysicsLean.Technology.Materialization.Source.«154_PostControlPersistence»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure MetastabilityCriterion where
  persistence : PostControlPersistenceCriterion
  escapeRate : Rat
  reliabilityTolerance : Rat
  deriving Repr

def metastabilityCriterionAdmissible (criterion : MetastabilityCriterion) : Prop :=
  postControlPersistenceCriterionAdmissible criterion.persistence ∧
    0 <= criterion.escapeRate ∧ 0 <= criterion.reliabilityTolerance

def metastableOnWindow (criterion : MetastabilityCriterion) : Prop :=
  metastabilityCriterionAdmissible criterion ∧
    criterion.escapeRate * criterion.persistence.observationWindow <= criterion.reliabilityTolerance

theorem persistenceOfMetastableWindow
    (criterion : MetastabilityCriterion)
    (threshold defectBudget : Rat)
    (hMeta : metastableOnWindow criterion)
    (hThreshold : threshold <= criterion.persistence.orderWindowScore)
    (hDefect : criterion.persistence.defectWindowBound <= defectBudget) :
    postControlPersistenceHolds criterion.persistence threshold defectBudget := by
  rcases hMeta with ⟨hAdm, _⟩
  exact ⟨hAdm.1, hThreshold, hDefect⟩

end Technology.Materialization.Source
end PhysicsLean
