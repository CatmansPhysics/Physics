import PhysicsLean.Technology.Materialization.Source.«117_AdaptiveToyRegime»

namespace PhysicsLean
namespace Technology.Materialization.Source

def adaptiveFailureModes : List MaterializationFailureMode :=
  [ { code := "M-F47", statement := "Correction overshoots and leaves the admissible region in another direction." }
  , { code := "M-F48", statement := "Recovery is possible in principle but exceeds the usable time window." }
  , { code := "M-F49", statement := "The device stabilizes after perturbation but not in the required functional region." }
  , { code := "M-F50", statement := "Memory drift causes the recovery policy to choose the wrong mode." }
  , { code := "M-F51", statement := "Sensor blindness prevents reliable perturbation-class discrimination." }
  , { code := "M-F52", statement := "Correction cost destroys the budget feasibility of adaptation." } ]

end Technology.Materialization.Source
end PhysicsLean
