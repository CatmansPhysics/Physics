import PhysicsLean.Technology.Materialization.Source.«137_SelfFabricationCriteria»

namespace PhysicsLean
namespace Technology.Materialization.Source

def fabricationErrorThreshold (selfFitness competingFitness fidelity : Rat) : Prop :=
  fidelity * selfFitness <= competingFitness

def longRecursiveMemoryCriterion (selfFitness competingFitness fidelity : Rat) : Prop :=
  competingFitness < fidelity * selfFitness

def repairAssistedRecursion
    (sector : HereditaryFabricationSector)
    (selfFitness competingFitness : Rat) : Prop :=
  longRecursiveMemoryCriterion selfFitness competingFitness (effectivePostRepairFabricationFidelity sector)

end Technology.Materialization.Source
end PhysicsLean
