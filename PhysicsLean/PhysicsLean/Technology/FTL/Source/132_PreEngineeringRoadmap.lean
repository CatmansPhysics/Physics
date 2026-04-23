import PhysicsLean.Technology.FTL.Source.«131_PreEngineeringBlocks»

namespace PhysicsLean
namespace Technology.FTL.Source

def preEngineeringRoadmapOrder : List String :=
  ["E-C1", "E-C2", "E-C3", "E-C4", "E-C5", "E-C6"]

structure FullTheoreticalClosure where
  theoremClosure : Prop
  quantitativeCalibration : Prop
  controlClosure : Prop
  resourceClosure : Prop
  materialEmbedding : Prop
  repeatability : Prop

def fullyClosedBeforeEngineering (closure : FullTheoreticalClosure) : Prop :=
  closure.theoremClosure ∧ closure.quantitativeCalibration ∧ closure.controlClosure ∧
    closure.resourceClosure ∧ closure.materialEmbedding ∧ closure.repeatability

end Technology.FTL.Source
end PhysicsLean
