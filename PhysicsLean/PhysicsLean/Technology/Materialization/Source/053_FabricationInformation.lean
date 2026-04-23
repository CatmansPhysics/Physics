import PhysicsLean.Technology.Materialization.Source.«052_ControlLoops»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure SpecificationMemory where
  encodedPredicates : List String
  predictiveInformation : Rat
  deriving Repr

def fabricationRelevantInformation (memory : SpecificationMemory) : Rat :=
  memory.predictiveInformation

def fabricationPredictiveInformation (memory : SpecificationMemory) : Rat :=
  fabricationRelevantInformation memory

def usefulFabricationMemory
    (memory : SpecificationMemory)
    (loop : FabricationControlLoop) : Prop :=
  0 <= fabricationPredictiveInformation memory ∧ loop.chosenAction != ""

end Technology.Materialization.Source
end PhysicsLean
