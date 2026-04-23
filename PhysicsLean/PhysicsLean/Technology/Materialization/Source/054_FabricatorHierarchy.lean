import PhysicsLean.Technology.Materialization.Source.«053_FabricationInformation»

namespace PhysicsLean
namespace Technology.Materialization.Source

def passiveFabricator (fabricator : Fabricator) : Prop :=
  precursorNonempty fabricator.precursor ∧ observerSpecificationAdmissible fabricator.specification

def reactiveFabricator (fabricator : Fabricator) : Prop :=
  passiveFabricator fabricator ∧ 0 < fabricator.monitorLabels.length

def predictiveFabricator (fabricator : Fabricator) (memory : SpecificationMemory) : Prop :=
  reactiveFabricator fabricator ∧ 0 < memory.encodedPredicates.length ∧ 0 <= memory.predictiveInformation

def predictiveAdvantage (fabricator : Fabricator) (memory : SpecificationMemory) : Prop :=
  predictiveFabricator fabricator memory

end Technology.Materialization.Source
end PhysicsLean
