import PhysicsLean.Technology.Materialization.Source.«061_FabricationCost»

namespace PhysicsLean
namespace Technology.Materialization.Source

def fabricationUsefulInformation (memory : SpecificationMemory) : Rat :=
  fabricationPredictiveInformation memory

def usefulFabricationInformationCriterion (memory : SpecificationMemory) : Prop :=
  0 <= fabricationUsefulInformation memory

def informationWithoutControlIsInert
    (memory : SpecificationMemory)
    (fabricator : Fabricator) : Prop :=
  fabricationUsefulInformation memory = 0 ∨ 0 < fabricator.actionLabels.length

end Technology.Materialization.Source
end PhysicsLean
