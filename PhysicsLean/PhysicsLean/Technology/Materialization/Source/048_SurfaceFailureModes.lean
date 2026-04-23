import PhysicsLean.Technology.Materialization.Source.«047_SelfMonitoringChannels»

namespace PhysicsLean
namespace Technology.Materialization.Source

def surfaceFailureModes : List MaterializationFailureMode :=
  [ { code := "MS-F1", statement := "Surface closure never reaches a usable observer-level object." }
  , { code := "MS-F2", statement := "Annealing destabilizes the target faster than repair compensates." }
  , { code := "MS-F3", statement := "Self-monitoring channels exist but fail to trigger effective repair." } ]

end Technology.Materialization.Source
end PhysicsLean
