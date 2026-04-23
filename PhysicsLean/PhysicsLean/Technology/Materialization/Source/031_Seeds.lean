import PhysicsLean.Technology.Materialization.Source.«030_MonatomicTargets»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure SeedConfiguration where
  species : String
  seedSites : Nat
  deriving Repr

def seedCompatible (seed : SeedConfiguration) (target : MonatomicTarget) : Prop :=
  seed.species = target.species ∧ 0 < seed.seedSites

end Technology.Materialization.Source
end PhysicsLean
