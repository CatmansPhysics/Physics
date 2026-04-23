import PhysicsLean.Technology.Materialization.Source.«135_SharedResources»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure RecursiveSelfModel where
  capabilityLabels : List String
  repairLabels : List String
  fidelityLabels : List String
  successorQualityLabels : List String
  deriving Repr

def recursiveSelfModelAdmissible (model : RecursiveSelfModel) : Prop :=
  0 < model.capabilityLabels.length ∧
    0 < model.repairLabels.length ∧
      0 < model.fidelityLabels.length ∧ 0 < model.successorQualityLabels.length

def recursiveSelfModelUsefulOnlyIfItImprovesSuccessorQuality
    (model : RecursiveSelfModel)
    (quality : Rat) : Prop :=
  recursiveSelfModelAdmissible model ∧ 0 <= quality

def successorQualityFunctional
    (substrate fidelity control repair lifetime : Rat) : Rat :=
  substrate + fidelity + control + repair + lifetime

end Technology.Materialization.Source
end PhysicsLean
