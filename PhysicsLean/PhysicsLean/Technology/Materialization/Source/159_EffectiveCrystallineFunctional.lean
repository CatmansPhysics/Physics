import PhysicsLean.Technology.Materialization.Source.«158_MetastabilityCriterion»
import PhysicsLean.Technology.Materialization.Source.«152_CrystallineOrderScore»
import PhysicsLean.Technology.Materialization.Source.«033_CompletionFunctional»
import PhysicsLean.Technology.Materialization.Source.«034_DefectAccumulation»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure EffectiveCrystallineFunctional where
  orderScore : CrystallineOrderScore
  completion : CompletionFunctional
  defects : DefectAccumulation
  boundaryPenalty : Rat
  contaminationPenalty : Rat
  deriving Repr

def effectiveCrystallineFunctionalValue (functional : EffectiveCrystallineFunctional) : Rat :=
  (functional.orderScore.calibratedThreshold - functional.orderScore.peakScore) +
    (-completionFunctionalValue functional.completion) +
      functional.defects.cumulativeDefect + functional.boundaryPenalty + functional.contaminationPenalty

def crystallineZeroSet (functional : EffectiveCrystallineFunctional) : Prop :=
  orderScorePassesThreshold functional.orderScore ∧
    0 < completionFunctionalValue functional.completion ∧
      functional.defects.cumulativeDefect <= 0 ∧
        functional.boundaryPenalty = 0 ∧ functional.contaminationPenalty = 0

def crystallineLocalMinimum (functional : EffectiveCrystallineFunctional) : Prop :=
  crystallineZeroSet functional

theorem orderScorePassesOfCrystallineZeroSet
    (functional : EffectiveCrystallineFunctional)
    (h : crystallineZeroSet functional) :
    orderScorePassesThreshold functional.orderScore := by
  exact h.1

end Technology.Materialization.Source
end PhysicsLean
