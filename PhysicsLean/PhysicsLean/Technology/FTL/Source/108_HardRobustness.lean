import PhysicsLean.Technology.FTL.Source.«107_CompositeHardCarrierModel»

namespace PhysicsLean
namespace Technology.FTL.Source

structure OnePoleHardMargins where
  velocityMargin : Rat
  gapMargin : Rat
  residueMargin : Rat
  identityMargin : Rat
  deriving Repr

structure CompositeHardMargins where
  bindingMargin : Rat
  residueMargin : Rat
  identityMargin : Rat
  deriving Repr

structure OnePoleHardLoad where
  branchDrift : Rat
  residueDrift : Rat
  nonadiabaticLeakage : Rat
  identityDrift : Rat
  deriving Repr

structure CompositeHardLoad where
  bindingDrift : Rat
  residueDrift : Rat
  leakage : Rat
  identityDrift : Rat
  deriving Repr

def onePoleMarginFloor (margins : OnePoleHardMargins) : Rat :=
  min margins.velocityMargin (min margins.gapMargin (min margins.residueMargin margins.identityMargin))

def compositeMarginFloor (margins : CompositeHardMargins) : Rat :=
  min margins.bindingMargin (min margins.residueMargin margins.identityMargin)

def onePoleHardLoadValue (load : OnePoleHardLoad) : Rat :=
  load.branchDrift + load.residueDrift + load.nonadiabaticLeakage + load.identityDrift

def compositeHardLoadValue (load : CompositeHardLoad) : Rat :=
  load.bindingDrift + load.residueDrift + load.leakage + load.identityDrift

def locallyRobustOnePoleHardTransport
    (margins : OnePoleHardMargins)
    (load : OnePoleHardLoad) : Prop :=
  onePoleHardLoadValue load < onePoleMarginFloor margins

def locallyRobustCompositeHardTransport
    (margins : CompositeHardMargins)
    (load : CompositeHardLoad) : Prop :=
  compositeHardLoadValue load < compositeMarginFloor margins

def hardRobustnessWrapper
    (onePoleMargins : OnePoleHardMargins)
    (onePoleLoad : OnePoleHardLoad)
    (compositeMargins : CompositeHardMargins)
    (compositeLoad : CompositeHardLoad) : Prop :=
  locallyRobustOnePoleHardTransport onePoleMargins onePoleLoad ∧
    locallyRobustCompositeHardTransport compositeMargins compositeLoad

end Technology.FTL.Source
end PhysicsLean
