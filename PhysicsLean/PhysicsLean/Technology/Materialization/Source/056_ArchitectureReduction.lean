import PhysicsLean.Technology.Materialization.Source.«055_InverseProblemArchitecture»

namespace PhysicsLean
namespace Technology.Materialization.Source

def architectureReduction (template : TemplateSector) (fabricator : Fabricator) : Prop :=
  fabricatorAdmissible fabricator ∧ template.boundarySites <= fabricator.monitorLabels.length + 1

def internalizationTransition
    (fabricator : Fabricator)
    (memory : SpecificationMemory) : Prop :=
  predictiveFabricator fabricator memory

end Technology.Materialization.Source
end PhysicsLean
