import PhysicsLean.Technology.FTL.Source.«135_ControlClosure»

namespace PhysicsLean
namespace Technology.FTL.Source

structure SoftResourceData where
  linkCost : Rat
  detectorCost : Rat
  writeCost : Rat
  eraseCost : Rat
  dissipativeCost : Rat
  cycleTime : Rat
  inflow : Rat
  deriving Repr

def softCycleCost (data : SoftResourceData) : Rat :=
  data.linkCost + data.detectorCost + data.writeCost + data.eraseCost + data.dissipativeCost

def softResourceClosed (data : SoftResourceData) : Prop :=
  0 < data.cycleTime ∧ softCycleCost data / data.cycleTime < data.inflow

structure HardResourceData where
  entryCost : Rat
  holdCost : Rat
  exitCost : Rat
  verificationCost : Rat
  bindingCost : Rat
  dissipativeCost : Rat
  cycleTime : Rat
  inflow : Rat
  deriving Repr

def hardCycleCost (data : HardResourceData) : Rat :=
  data.entryCost + data.holdCost + data.exitCost + data.verificationCost +
    data.bindingCost + data.dissipativeCost

def hardResourceClosed (data : HardResourceData) : Prop :=
  0 < data.cycleTime ∧ hardCycleCost data / data.cycleTime < data.inflow

def unifiedResourceClosure (soft : SoftResourceData) (hard : HardResourceData) : Prop :=
  softResourceClosed soft ∧ hardResourceClosed hard

def defaultSoftResourceData : SoftResourceData :=
  { linkCost := 1 / 10
    detectorCost := 1 / 10
    writeCost := 1 / 10
    eraseCost := 1 / 10
    dissipativeCost := 1 / 10
    cycleTime := 2
    inflow := 1 }

def defaultHardResourceData : HardResourceData :=
  { entryCost := 1 / 10
    holdCost := 1 / 10
    exitCost := 1 / 10
    verificationCost := 1 / 10
    bindingCost := 1 / 10
    dissipativeCost := 1 / 10
    cycleTime := 2
    inflow := 1 }

end Technology.FTL.Source
end PhysicsLean
