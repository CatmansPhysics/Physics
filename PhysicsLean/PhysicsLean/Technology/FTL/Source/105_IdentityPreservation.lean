import PhysicsLean.Technology.FTL.Source.«104_PoleSurvival»

namespace PhysicsLean
namespace Technology.FTL.Source

structure HardIdentityWeights where
  stateWeight : Rat
  residueWeight : Rat
  observableWeight : Rat
  deriving Repr

structure HardCycleIdentityData where
  stateLoss : Rat
  residueDrift : Rat
  observableDrift : Rat
  deriving Repr

def cycleIdentityLoss
    (weights : HardIdentityWeights)
    (data : HardCycleIdentityData) : Rat :=
  weights.stateWeight * data.stateLoss +
    weights.residueWeight * data.residueDrift +
    weights.observableWeight * data.observableDrift

def identityPreservingHardCycle
    (weights : HardIdentityWeights)
    (data : HardCycleIdentityData) : Prop :=
  cycleIdentityLoss weights data < 1 / 10

def localHardIdentityBound
    (weights : HardIdentityWeights)
    (data : HardCycleIdentityData)
    (adiabaticLeakage : Rat) : Prop :=
  adiabaticLeakage < 1 / 10 ∧
    data.residueDrift < 1 / 10 ∧
    data.observableDrift < 1 / 10 ∧
    identityPreservingHardCycle weights data

def defaultHardIdentityWeights : HardIdentityWeights :=
  { stateWeight := 1 / 2
    residueWeight := 1 / 4
    observableWeight := 1 / 4 }

def defaultHardCycleIdentityData : HardCycleIdentityData :=
  { stateLoss := 1 / 100
    residueDrift := 1 / 200
    observableDrift := 1 / 200 }

def defaultIdentityPreservingCycle : Prop :=
  identityPreservingHardCycle defaultHardIdentityWeights defaultHardCycleIdentityData

end Technology.FTL.Source
end PhysicsLean
