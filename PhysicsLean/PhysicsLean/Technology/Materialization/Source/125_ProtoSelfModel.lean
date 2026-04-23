import PhysicsLean.Technology.Materialization.Source.«124_ProtoAgencyThreshold»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure ProtoSelfModel where
  admissibilityLabels : List String
  capabilityLabels : List String
  trajectoryLabels : List String
  deriving Repr

def protoSelfModelAdmissible (model : ProtoSelfModel) : Prop :=
  0 < model.admissibilityLabels.length ∧
    0 < model.capabilityLabels.length ∧ 0 < model.trajectoryLabels.length

def protoSelfModelImprovesControlOnlyIfUseful
    (model : ProtoSelfModel)
    (policy : PolicyMap) : Prop :=
  protoSelfModelAdmissible model ∧ policyMapAdmissible policy

end Technology.Materialization.Source
end PhysicsLean
