import PhysicsLean.Technology.Materialization.Source.«010_SpecificationTheory»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure PrecursorTheory where
  reservoirLabels : List String
  resourceBudget : Rat
  deriving Repr

def precursorNonempty (theory : PrecursorTheory) : Prop :=
  0 < theory.reservoirLabels.length

end Technology.Materialization.Source
end PhysicsLean
