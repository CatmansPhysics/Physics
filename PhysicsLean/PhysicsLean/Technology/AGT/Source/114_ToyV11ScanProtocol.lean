import PhysicsLean.Technology.AGT.Source.«113_ToyV11Thresholds»

namespace PhysicsLean
namespace Technology.AGT.Source

structure ScanGrid where
  startMomentum : Rat
  endMomentum : Rat
  sampleCount : Nat
  deriving Repr

def wallThresholdScan (threshold : Rat) : ScanGrid :=
  { startMomentum := max (threshold - (threshold / 5 + 1 / 20)) 0
    endMomentum := threshold + (threshold / 5 + 1 / 20)
    sampleCount := 21 }

def zeroThresholdWallScan : ScanGrid :=
  { startMomentum := 1 / 20, endMomentum := 3 / 10, sampleCount := 4 }

def bubbleBarrierScan (threshold : Rat) : ScanGrid :=
  { startMomentum := max (threshold - (threshold / 5 + 1 / 20)) 0
    endMomentum := threshold + (threshold / 5 + 1 / 20)
    sampleCount := 21 }

def bubbleAttractiveScan : ScanGrid :=
  { startMomentum := 1 / 20, endMomentum := 3 / 10, sampleCount := 4 }

structure LaunchWindow where
  leftToRightStarts : List Rat
  rightToLeftStarts : List Rat
  insideStarts : List Rat
  outsideStarts : List Rat
  deriving Repr

def defaultLaunchWindow : LaunchWindow :=
  { leftToRightStarts := [8, 12]
    rightToLeftStarts := [20, 24]
    insideStarts := [15, 16, 17]
    outsideStarts := [8, 10, 12] }

inductive HeatmapAxis
  | h0
  | ellH
  | mu
  | radius
  | gammaInt
  deriving DecidableEq, Repr

structure HeatmapContract where
  code : String
  horizontal : HeatmapAxis
  vertical : HeatmapAxis
  metric : String
  deriving Repr

def scanHeatmaps : List HeatmapContract :=
  [ { code := "Wall-H1", horizontal := HeatmapAxis.h0, vertical := HeatmapAxis.mu, metric := "S_wall_refl" }
  , { code := "Wall-H2", horizontal := HeatmapAxis.ellH, vertical := HeatmapAxis.mu, metric := "tauTrapGap" }
  , { code := "Bubble-H1", horizontal := HeatmapAxis.radius, vertical := HeatmapAxis.mu, metric := "S_capt" }
  , { code := "Bubble-H2", horizontal := HeatmapAxis.radius, vertical := HeatmapAxis.gammaInt, metric := "S_exp" } ]

structure SafeWindowV11 where
  wallH0Min : Rat
  wallH0Max : Rat
  ellHMin : Rat
  ellHMax : Rat
  muMin : Rat
  muMax : Rat
  bubbleRadiusMin : Rat
  bubbleRadiusMax : Rat
  gammaIntMin : Rat
  gammaIntMax : Rat
  deriving Repr

def safeWindowV11 : SafeWindowV11 :=
  { wallH0Min := 2 / 5
    wallH0Max := 1
    ellHMin := 1
    ellHMax := 4
    muMin := 1 / 2
    muMax := 3 / 2
    bubbleRadiusMin := 2
    bubbleRadiusMax := 6
    gammaIntMin := 1 / 50
    gammaIntMax := 1 / 10 }

def inSafeWindowV11 (window : SafeWindowV11) (h0 ellH mu radius gammaInt : Rat) : Prop :=
  window.wallH0Min <= h0 ∧ h0 <= window.wallH0Max ∧
    window.ellHMin <= ellH ∧ ellH <= window.ellHMax ∧
    window.muMin <= mu ∧ mu <= window.muMax ∧
    window.bubbleRadiusMin <= radius ∧ radius <= window.bubbleRadiusMax ∧
    window.gammaIntMin <= gammaInt ∧ gammaInt <= window.gammaIntMax

structure InterpretationRule where
  code : String
  condition : String
  interpretation : String
  deriving Repr

def scanDecisionTree : List InterpretationRule :=
  [ { code := "D1"
      condition := "Wall selectivity present but bubble capture absent"
      interpretation := "Interface mechanics is present but the loss channel or bubble radius is too weak." }
  , { code := "D2"
      condition := "Bubble capture present but wall selectivity weak"
      interpretation := "Bulk asymmetry exists but the wall approximation is too soft or too delocalized." }
  , { code := "D3"
      condition := "Wall and bubble signatures coexist"
      interpretation := "Toy Model v1.1 realizes the first interface-physics layer of AGT-1." }
  , { code := "D4"
      condition := "Neither wall nor bubble distinguishes sectors"
      interpretation := "The local branch design must be revised before the transport code is blamed." } ]

structure ScanOutcome where
  wallSelective : Prop
  bubbleSelective : Prop
  geometricFieldStable : Prop

def successW (outcome : ScanOutcome) : Prop :=
  outcome.wallSelective

def successB (outcome : ScanOutcome) : Prop :=
  outcome.bubbleSelective

def successWB (outcome : ScanOutcome) : Prop :=
  outcome.wallSelective ∧ outcome.bubbleSelective ∧ outcome.geometricFieldStable

def failureW1 (outcome : ScanOutcome) : Prop :=
  ¬ outcome.wallSelective

def failureB1 (outcome : ScanOutcome) : Prop :=
  ¬ outcome.bubbleSelective

def failureWB1 (outcome : ScanOutcome) : Prop :=
  ¬ outcome.geometricFieldStable

theorem scanHeatmaps_length : scanHeatmaps.length = 4 := by
  rfl

theorem scanDecisionTree_length : scanDecisionTree.length = 4 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
