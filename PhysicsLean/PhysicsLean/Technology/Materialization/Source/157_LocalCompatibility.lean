import PhysicsLean.Technology.Materialization.Source.«156_ReservoirSufficiency»
import PhysicsLean.Technology.Materialization.Source.«035_SeededCompletion»
import PhysicsLean.Technology.Materialization.Source.«021_DefectCalculus»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure LocalCompatibilityCriterion where
  target : MonatomicTarget
  history : GrowthHistory
  mismatchScore : Rat
  defectJump : Rat
  mismatchThreshold : Rat
  defectThreshold : Rat
  deriving Repr

def localCompatibilityCriterionAdmissible
    (criterion : LocalCompatibilityCriterion) : Prop :=
  seedCompatible criterion.history.seed criterion.target ∧
    growthHistoryAdmissible criterion.history ∧
    0 <= criterion.mismatchScore ∧
    0 <= criterion.defectJump ∧
      criterion.mismatchScore <= criterion.mismatchThreshold ∧ criterion.defectJump <= criterion.defectThreshold

def localCompatibleDefects
    (criterion : LocalCompatibilityCriterion)
    (defects : DefectCalculus) : Prop :=
  localCompatibilityCriterionAdmissible criterion ∧
    defects.mismatchScore <= criterion.mismatchThreshold ∧ defectWithinBudget criterion.defectThreshold defects

theorem seededCompletionOfLocalCompatibility
    (criterion : LocalCompatibilityCriterion)
    (functional : CompletionFunctional)
    (hCompat : localCompatibilityCriterionAdmissible criterion)
    (hCompletion : 0 < completionFunctionalValue functional) :
    seededCompletion criterion.target criterion.history functional := by
  rcases hCompat with ⟨hSeed, hGrowth, _, _, _, _⟩
  exact ⟨hSeed, hGrowth, hCompletion⟩

end Technology.Materialization.Source
end PhysicsLean
