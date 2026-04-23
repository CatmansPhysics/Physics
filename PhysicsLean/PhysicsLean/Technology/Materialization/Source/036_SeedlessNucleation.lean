import PhysicsLean.Technology.Materialization.Source.«035_SeededCompletion»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure SeedlessNucleationData where
  spontaneousClusters : Nat
  nucleationScore : Rat
  deriving Repr

def seedlessNucleationAdmissible (data : SeedlessNucleationData) : Prop :=
  0 < data.spontaneousClusters ∧ 0 < data.nucleationScore

end Technology.Materialization.Source
end PhysicsLean
