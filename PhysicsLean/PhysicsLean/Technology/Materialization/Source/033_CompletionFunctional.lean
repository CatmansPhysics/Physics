import PhysicsLean.Technology.Materialization.Source.«032_GrowthHistories»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure CompletionFunctional where
  completionScore : Rat
  defectPenalty : Rat
  deriving Repr

def completionFunctionalValue (functional : CompletionFunctional) : Rat :=
  functional.completionScore - functional.defectPenalty

end Technology.Materialization.Source
end PhysicsLean
