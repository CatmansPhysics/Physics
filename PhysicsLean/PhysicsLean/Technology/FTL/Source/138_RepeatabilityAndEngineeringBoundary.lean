import PhysicsLean.Technology.FTL.Source.«137_MaterialEmbedding»

namespace PhysicsLean
namespace Technology.FTL.Source

structure SoftRepeatabilityData where
  perCycleLoad : Rat
  contrastMargin : Rat
  repeatabilityDrift : Rat
  deriving Repr

def softNCycleStable (data : SoftRepeatabilityData) : Prop :=
  data.perCycleLoad + data.repeatabilityDrift < data.contrastMargin

structure HardRepeatabilityData where
  velocityDrift : Rat
  residueDrift : Rat
  bindingDrift : Rat
  onePoleLoss : Rat
  compositeLoss : Rat
  velocityMargin : Rat
  residueMargin : Rat
  bindingMargin : Rat
  deriving Repr

def hardNCycleStable (data : HardRepeatabilityData) : Prop :=
  data.velocityDrift < data.velocityMargin ∧
    data.residueDrift < data.residueMargin ∧
    data.bindingDrift < data.bindingMargin ∧
    data.onePoleLoss < 1 / 10 ∧
    data.compositeLoss < 1 / 10

def engineeringBoundaryReached : Prop :=
  theoremClosureReached ∧
    softControlClosed defaultSoftControlData ∧
    hardControlClosed defaultHardControlData ∧
    softResourceClosed defaultSoftResourceData ∧
    hardResourceClosed defaultHardResourceData ∧
    softMaterialEmbedded defaultSoftMaterialMedium ∧
    hardMaterialEmbedded defaultHardMaterialMedium

def defaultSoftRepeatabilityData : SoftRepeatabilityData :=
  { perCycleLoad := 1 / 20
    contrastMargin := 1 / 5
    repeatabilityDrift := 1 / 20 }

def defaultHardRepeatabilityData : HardRepeatabilityData :=
  { velocityDrift := 1 / 20
    residueDrift := 1 / 20
    bindingDrift := 1 / 20
    onePoleLoss := 1 / 20
    compositeLoss := 1 / 20
    velocityMargin := 1 / 4
    residueMargin := 1 / 5
    bindingMargin := 1 / 5 }

end Technology.FTL.Source
end PhysicsLean
