import PhysicsLean.Technology.Materialization.Source.«034_DefectAccumulation»

namespace PhysicsLean
namespace Technology.Materialization.Source

def seededCompletion
    (target : MonatomicTarget)
    (history : GrowthHistory)
    (functional : CompletionFunctional) : Prop :=
  seedCompatible history.seed target ∧ growthHistoryAdmissible history ∧ 0 < completionFunctionalValue functional

end Technology.Materialization.Source
end PhysicsLean
