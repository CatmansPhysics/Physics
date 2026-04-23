import PhysicsLean.Technology.Materialization.Source.«071_CandidateSpaces»

namespace PhysicsLean
namespace Technology.Materialization.Source

open Classical

def realizesSpecificationInClass
    (problem : InverseMaterializationProblem)
    (fabricatorClass : FabricatorClass)
    (realizer : MaterializationRealizer) : Prop :=
  realizesSpecification problem realizer ∧ architectureClassCompatible fabricatorClass realizer.fabricator

noncomputable def realizabilityMap
    (problem : InverseMaterializationProblem)
    (fabricatorClass : FabricatorClass)
    (realizer : MaterializationRealizer) : Bool :=
  decide (realizesSpecificationInClass problem fabricatorClass realizer)

def feasibleRegion
    (problem : InverseMaterializationProblem)
    (fabricatorClass : FabricatorClass)
    (realizer : MaterializationRealizer) : Prop :=
  realizesSpecificationInClass problem fabricatorClass realizer

theorem feasibleRegionArchitectureSensitive
    (problem : InverseMaterializationProblem)
    (realizer : MaterializationRealizer)
    (h : feasibleRegion problem FabricatorClass.predictive realizer) :
    feasibleRegion problem FabricatorClass.external realizer := by
  rcases h with ⟨hRealizes, hPredictive⟩
  exact ⟨hRealizes, by
    rcases hRealizes with ⟨_, hFabricator, _, _, _⟩
    exact hFabricator⟩

end Technology.Materialization.Source
end PhysicsLean
