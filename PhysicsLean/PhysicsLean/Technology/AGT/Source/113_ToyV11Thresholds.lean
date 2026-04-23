import PhysicsLean.Technology.AGT.Source.«112_ToyV11WallBubbleRuns»

namespace PhysicsLean
namespace Technology.AGT.Source

def wallStepThresholdSq (inertialMass stepHeight : Rat) : Rat :=
  2 * inertialMass * max stepHeight 0

def bubbleEntryThresholdSq (inertialMass stepHeight : Rat) : Rat :=
  2 * inertialMass * max stepHeight 0

def wallSelectivityIndex (deltaUPlus deltaUMinus : Rat) : Rat :=
  deltaUPlus - deltaUMinus

def bubbleSelectivityIndex (deltaUPlus deltaUMinus : Rat) : Rat :=
  deltaUPlus - deltaUMinus

def quasiCaptureRadiusThreshold (incomingEnergy insideVelocity interfaceLossRate : Rat) : Rat :=
  incomingEnergy * insideVelocity / (2 * interfaceLossRate)

structure ThresholdRegime where
  hardReflection : Prop
  nearThresholdSlowing : Prop
  easyTransmission : Prop
  bubbleExclusion : Prop
  bubbleQuasiCapture : Prop
  bubbleTrueCapture : Prop

def classifyThresholdRegime (incomingEnergy wallHeight bubbleHeight energyLoss : Rat) : ThresholdRegime :=
  { hardReflection := incomingEnergy < wallHeight
    nearThresholdSlowing := incomingEnergy = wallHeight
    easyTransmission := wallHeight < incomingEnergy
    bubbleExclusion := incomingEnergy < bubbleHeight
    bubbleQuasiCapture := bubbleHeight < incomingEnergy ∧ energyLoss <= incomingEnergy
    bubbleTrueCapture := incomingEnergy < energyLoss }

structure ThresholdTarget where
  code : String
  statement : String
  deriving Repr

def thresholdTargets : List ThresholdTarget :=
  [ { code := "W-threshold", statement := "Wall reflection changes sharply near q_crit^(sigma)^2 = 2 M_sigma DeltaU_sigma." }
  , { code := "B-threshold", statement := "Bubble entry changes near q_crit,bub^(sigma)^2 = 2 M_sigma DeltaU_sigma^bub." }
  , { code := "Capture-threshold", statement := "True classical capture requires interface energy loss larger than the incoming energy." } ]

end Technology.AGT.Source
end PhysicsLean
