import PhysicsLean.Technology.Materialization.Source.«013_SuccessCriteria»

namespace PhysicsLean
namespace Technology.Materialization.Source

def noExNihiloDerived (history : AssemblyHistory) : Prop :=
  precursorNonempty history.precursor

def observerRelativeIdentityDerived (spec : SpecificationTheory) : Prop :=
  observerSpecificationAdmissible spec

end Technology.Materialization.Source
end PhysicsLean
