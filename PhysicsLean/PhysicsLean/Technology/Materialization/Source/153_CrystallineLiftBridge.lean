import PhysicsLean.Technology.Materialization.Source.«152_CrystallineOrderScore»

namespace PhysicsLean
namespace Technology.Materialization.Source

def crystallineLiftBridge
    (score : CrystallineOrderScore)
    (baseline : Rat) : Prop :=
  orderScorePassesThreshold score ∧ baseline < score.calibratedThreshold

def theoremChainWeakPointAnalysis
    (score : CrystallineOrderScore)
    (baseline : Rat) : Prop :=
  crystallineLiftBridge score baseline

theorem orderScorePassesOfCrystallineLift
    (score : CrystallineOrderScore)
    (baseline : Rat)
    (h : crystallineLiftBridge score baseline) :
    orderScorePassesThreshold score := by
  exact h.1

end Technology.Materialization.Source
end PhysicsLean
