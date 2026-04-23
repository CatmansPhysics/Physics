import PhysicsLean.Technology.Materialization.Source.«074_SolutionDominance»

namespace PhysicsLean
namespace Technology.Materialization.Source

def inverseDesignScore
    (completion usability persistence cost architecturePenalty wastePenalty : Rat) : Rat :=
  completion + usability + persistence - cost - architecturePenalty - wastePenalty

def scoredRealizerValue (score : RealizerScore) : Rat :=
  inverseDesignScore score.completion score.usability score.persistence score.totalCost
    (architectureRank score.architecture) score.defectMargin

end Technology.Materialization.Source
end PhysicsLean
