import PhysicsLean.Technology.AGT.Source.«116_ToyV11ResonanceRuns»

namespace PhysicsLean
namespace Technology.AGT.Source

structure V11ModuleContract where
  moduleName : String
  responsibilities : List String
  outputs : List String
  deriving Repr

def toyV11Modules : List V11ModuleContract :=
  [ { moduleName := "Geometry"
      responsibilities := ["Build ring graph", "Provide distance and interpolation operators"]
      outputs := ["Adjacency", "Laplacian", "DistanceMatrix"] }
  , { moduleName := "Backgrounds"
      responsibilities := ["Build wall backgrounds", "Build bubble backgrounds", "Combine field and interface inputs"]
      outputs := ["BackgroundField", "BackgroundParameterPack"] }
  , { moduleName := "Local kernels"
      responsibilities := ["Construct sector kernels for each site", "Attach local bias values"]
      outputs := ["LocalToyBranch", "KernelSheet"] }
  , { moduleName := "Spectral extraction"
      responsibilities := ["Extract local on-shell branches", "Fit rest energies and inertial masses", "Read spectral grav-charge"]
      outputs := ["LocalSpectralSheet", "BulkMassSummary"] }
  , { moduleName := "Transport"
      responsibilities := ["Integrate probe trajectories", "Measure dwell, reflection, transmission, capture"]
      outputs := ["WallBubbleObservable", "TrajectorySummary"] }
  , { moduleName := "Resonance analysis"
      responsibilities := ["Smooth dwell-time curves", "Detect peaks", "Estimate widths and peak counts"]
      outputs := ["PeakDescriptor", "ResonanceObservable"] }
  , { moduleName := "Audit"
      responsibilities := ["Check threshold consistency", "Check peak stability", "Check sign consistency"]
      outputs := ["AuditFlags", "RunStatus"] } ]

structure V11DataContract where
  name : String
  fields : List String
  deriving Repr

def toyV11DataContracts : List V11DataContract :=
  [ { name := "InterfaceParams"
      fields := ["kind", "h0", "ellH", "mu", "center", "radius"] }
  , { name := "RunParams"
      fields := ["dt", "timeHorizon", "gammaInt", "qGrid"] }
  , { name := "ProbeConfig"
      fields := ["sector", "startPosition", "startMomentum"] }
  , { name := "LocalSpectralData"
      fields := ["m_sigma(i)", "M_sigma_in(i)", "Q_g_spec_sigma(i)"] }
  , { name := "RunSummary"
      fields := ["tauDwell", "reflection", "transmission", "capture", "peakList"] } ]

structure V11PipelineStep where
  step : String
  inputs : List String
  outputs : List String
  deriving Repr

def toyV11Pipeline : List V11PipelineStep :=
  [ { step := "Build geometry"
      inputs := ["Graph protocol"]
      outputs := ["Geometry"] }
  , { step := "Build backgrounds"
      inputs := ["InterfaceParams", "Field parameters"]
      outputs := ["BackgroundField"] }
  , { step := "Extract local spectral data"
      inputs := ["BackgroundField", "ToyParameters"]
      outputs := ["LocalSpectralData"] }
  , { step := "Compute thresholds"
      inputs := ["LocalSpectralData", "BackgroundField"]
      outputs := ["ThresholdSheet"] }
  , { step := "Run wall and bubble scans"
      inputs := ["ThresholdSheet", "ProbeConfig", "RunParams"]
      outputs := ["TrajectorySummary", "WallBubbleObservable"] }
  , { step := "Detect resonances"
      inputs := ["WallBubbleObservable"]
      outputs := ["PeakDescriptor", "ResonanceObservable"] }
  , { step := "Audit run bundle"
      inputs := ["ResonanceObservable", "ThresholdSheet"]
      outputs := ["RunStatus", "AuditFlags"] } ]

structure StabilityCheck where
  code : String
  change : String
  expectedInvariant : String
  deriving Repr

def stabilityChecks : List StabilityCheck :=
  [ { code := "A"
      change := "Halve the time step"
      expectedInvariant := "Peak positions move only mildly and sector selectivity survives." }
  , { code := "B"
      change := "Perturb one long-range graph edge"
      expectedInvariant := "Prominent peaks remain visible in the same qualitative window." }
  , { code := "C"
      change := "Switch interpolation rule"
      expectedInvariant := "Peak heights and selectivity do not collapse." } ]

structure SummaryMetric where
  name : String
  definition : String
  deriving Repr

def toyV11SummaryMetrics : List SummaryMetric :=
  [ { name := "S_wall_res"
      definition := "Difference between the dominant wall dwell-time peaks of the plus and minus sectors." }
  , { name := "S_wall_q"
      definition := "Difference between wall resonance momenta of the plus and minus sectors." }
  , { name := "S_bub_res"
      definition := "Difference between maximal bubble dwell times of the charged sectors." }
  , { name := "DeltaN_peaks"
      definition := "Growth of bubble peak count when the bubble radius increases." } ]

theorem toyV11Modules_length : toyV11Modules.length = 7 := by
  rfl

theorem toyV11Pipeline_length : toyV11Pipeline.length = 7 := by
  rfl

theorem stabilityChecks_length : stabilityChecks.length = 3 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
