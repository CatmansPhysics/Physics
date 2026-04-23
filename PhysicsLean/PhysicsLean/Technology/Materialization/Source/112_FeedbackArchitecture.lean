import PhysicsLean.Technology.Materialization.Source.«111_RecoveryChannels»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure FeedbackSector where
  sensorLabels : List String
  memoryLabels : List String
  correctionLabels : List String
  deriving Repr

def feedbackSectorAdmissible (sector : FeedbackSector) : Prop :=
  0 < sector.sensorLabels.length ∧
    0 < sector.memoryLabels.length ∧ 0 < sector.correctionLabels.length

def deviceSensingActionLoop (sector : FeedbackSector) : Prop :=
  feedbackSectorAdmissible sector

def closedAdaptiveLoop (sector : FeedbackSector) : Prop :=
  deviceSensingActionLoop sector ∧ 1 <= sector.correctionLabels.length

end Technology.Materialization.Source
end PhysicsLean
