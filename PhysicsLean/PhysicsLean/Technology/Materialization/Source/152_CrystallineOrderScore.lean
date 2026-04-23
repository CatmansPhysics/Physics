import PhysicsLean.Technology.Materialization.Source.«151_ClosureChainV1»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure CrystallineOrderScore where
  reciprocalModes : List String
  peakScore : Rat
  calibratedThreshold : Rat
  deriving Repr

def crystallineOrderScoreAdmissible (score : CrystallineOrderScore) : Prop :=
  0 < score.reciprocalModes.length ∧ 0 <= score.peakScore ∧ 0 <= score.calibratedThreshold

def orderScorePassesThreshold (score : CrystallineOrderScore) : Prop :=
  crystallineOrderScoreAdmissible score ∧ score.calibratedThreshold <= score.peakScore

def orderScoreGap (score : CrystallineOrderScore) : Rat :=
  score.peakScore - score.calibratedThreshold

theorem nonnegativeOrderScoreGap
    (score : CrystallineOrderScore)
    (h : orderScorePassesThreshold score) :
    score.calibratedThreshold <= score.peakScore := by
  exact h.2

end Technology.Materialization.Source
end PhysicsLean
