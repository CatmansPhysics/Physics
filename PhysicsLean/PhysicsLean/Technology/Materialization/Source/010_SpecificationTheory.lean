import PhysicsLean.Technology.Materialization.Source.«001_ProjectPrelude»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure SpecificationTheory where
  predicateLabels : List String
  defectBudget : Rat
  persistenceWindow : Nat
  deriving Repr

def observerSpecificationAdmissible (spec : SpecificationTheory) : Prop :=
  0 <= spec.defectBudget

end Technology.Materialization.Source
end PhysicsLean
