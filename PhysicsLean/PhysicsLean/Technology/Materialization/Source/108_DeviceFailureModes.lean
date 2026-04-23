import PhysicsLean.Technology.Materialization.Source.«107_DeviceTheoremChain»

namespace PhysicsLean
namespace Technology.Materialization.Source

def deviceFailureModes : List MaterializationFailureMode :=
  [ { code := "M-F41", statement := "The body is stable but the interface does not accept usable input." }
  , { code := "M-F42", statement := "Internal transfer occurs but the output is not observer-readable." }
  , { code := "M-F43", statement := "Apparent memory states exist but do not persist or affect the output." }
  , { code := "M-F44", statement := "Subsystem coupling remains too fragile under normal use." }
  , { code := "M-F45", statement := "A nominally stateful device collapses into a single usable mode." }
  , { code := "M-F46", statement := "Interface contamination corrupts function below bulk defect thresholds." } ]

end Technology.Materialization.Source
end PhysicsLean
