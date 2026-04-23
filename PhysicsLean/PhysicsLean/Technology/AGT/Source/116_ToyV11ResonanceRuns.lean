import PhysicsLean.Technology.AGT.Source.«115_ToyV11Resonance»

namespace PhysicsLean
namespace Technology.AGT.Source

structure ResonanceObservable where
  dwellTime : Rat
  reflection : Rat
  transmission : Rat
  capture : Rat
  peakWidth : Rat
  deriving Repr

structure PeakDescriptor where
  resonanceMomentum : Rat
  peakHeight : Rat
  halfHeightWidth : Rat
  deriving Repr

def nontrivialPeak (descriptor : PeakDescriptor) (crossingTime factor : Rat) : Prop :=
  factor * crossingTime < descriptor.peakHeight

def wallCrossingTime (ellH bulkVelocity : Rat) : Rat :=
  if bulkVelocity = 0 then 0 else (4 * ellH + 2) / bulkVelocity

def bubbleCrossingTime (radius insideVelocity : Rat) : Rat :=
  if insideVelocity = 0 then 0 else (2 * radius) / insideVelocity

def resonancePeakCountMonotone (smallRadius largeRadius smallCount largeCount : Rat) : Prop :=
  smallRadius <= largeRadius ∧ smallCount <= largeCount

inductive ResonanceRunGroup
  | wallConservative
  | wallLossy
  | bubbleConservative
  | bubbleLossy
  | wallBubbleWithField
  deriving DecidableEq, Repr

def resonanceRunGroups : List ResonanceRunGroup :=
  [ ResonanceRunGroup.wallConservative
  , ResonanceRunGroup.wallLossy
  , ResonanceRunGroup.bubbleConservative
  , ResonanceRunGroup.bubbleLossy
  , ResonanceRunGroup.wallBubbleWithField ]

structure ResonanceSafeWindow where
  wallH0 : List Rat
  wallEllH : List Rat
  wallMu : List Rat
  bubbleRadius : List Rat
  bubbleH0 : List Rat
  bubbleMu : List Rat
  gammaInt : List Rat
  deriving Repr

def resonanceSafeWindow : ResonanceSafeWindow :=
  { wallH0 := [4 / 5, 6 / 5]
    wallEllH := [2, 4]
    wallMu := [1, 3 / 2]
    bubbleRadius := [4, 6, 8]
    bubbleH0 := [4 / 5, 6 / 5]
    bubbleMu := [1, 3 / 2]
    gammaInt := [0, 1 / 50, 1 / 20] }

structure ResonanceOutcome where
  wallPeak : Prop
  bubblePeak : Prop
  sectorAsymmetry : Prop
  peakCountGrowth : Prop
  robustUnderNumerics : Prop

def successR1 (outcome : ResonanceOutcome) : Prop :=
  outcome.wallPeak

def successR2 (outcome : ResonanceOutcome) : Prop :=
  outcome.bubblePeak

def successR3 (outcome : ResonanceOutcome) : Prop :=
  outcome.sectorAsymmetry

def successR4 (outcome : ResonanceOutcome) : Prop :=
  outcome.peakCountGrowth ∧ outcome.robustUnderNumerics

def failureR1 (outcome : ResonanceOutcome) : Prop :=
  ¬ outcome.wallPeak

def failureR2 (outcome : ResonanceOutcome) : Prop :=
  ¬ outcome.robustUnderNumerics

def failureR3 (outcome : ResonanceOutcome) : Prop :=
  ¬ outcome.peakCountGrowth

theorem resonanceRunGroups_length : resonanceRunGroups.length = 5 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
