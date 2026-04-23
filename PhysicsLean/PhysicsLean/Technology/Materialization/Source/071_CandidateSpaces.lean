import PhysicsLean.Technology.Materialization.Source.«070_InverseDesignCore»

namespace PhysicsLean
namespace Technology.Materialization.Source

inductive FabricatorClass where
  | passive
  | external
  | templated
  | reactive
  | predictive
  | selfMonitoring
  deriving Repr, DecidableEq

def architectureClassCompatible
    (fabricatorClass : FabricatorClass)
    (fabricator : Fabricator) : Prop :=
  match fabricatorClass with
  | .passive => passiveFabricator fabricator
  | .external => fabricatorAdmissible fabricator
  | .templated => fabricatorAdmissible fabricator
  | .reactive => reactiveFabricator fabricator
  | .predictive => ∃ memory, predictiveFabricator fabricator memory
  | .selfMonitoring => reactiveFabricator fabricator

structure CandidateChannelSpace where
  channels : List (List String)
  deriving Repr

structure CandidateReservoirSpace where
  reservoirs : List PrecursorTheory
  deriving Repr

structure CandidateBudgetSpace where
  budgets : List FabricationBudget
  deriving Repr

end Technology.Materialization.Source
end PhysicsLean
