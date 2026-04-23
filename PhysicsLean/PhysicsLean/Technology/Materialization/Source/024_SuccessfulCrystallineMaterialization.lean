import PhysicsLean.Technology.Materialization.Source.«023_CrystallizationChannels»

namespace PhysicsLean
namespace Technology.Materialization.Source

def successfulCrystallineMaterialization
    (budget : Rat)
    (defects : DefectCalculus)
    (channel : CrystallizationChannel) : Prop :=
  crystallizationChannelAdmissible channel ∧ defectWithinBudget budget defects

end Technology.Materialization.Source
end PhysicsLean
