import PhysicsLean.Technology.Materialization.Source.«031_Seeds»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure GrowthHistory where
  seed : SeedConfiguration
  growthStages : List String
  deriving Repr

def growthHistoryAdmissible (history : GrowthHistory) : Prop :=
  0 < history.growthStages.length

end Technology.Materialization.Source
end PhysicsLean
