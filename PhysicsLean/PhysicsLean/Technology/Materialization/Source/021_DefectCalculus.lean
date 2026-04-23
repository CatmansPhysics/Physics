import PhysicsLean.Technology.Materialization.Source.«020_CrystallineTarget»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure DefectCalculus where
  vacancyCount : Nat
  dislocationCount : Nat
  mismatchScore : Rat
  deriving Repr

def defectWithinBudget (budget : Rat) (defects : DefectCalculus) : Prop :=
  defects.mismatchScore <= budget

end Technology.Materialization.Source
end PhysicsLean
