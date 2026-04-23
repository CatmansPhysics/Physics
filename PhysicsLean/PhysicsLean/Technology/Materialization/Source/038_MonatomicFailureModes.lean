import PhysicsLean.Technology.Materialization.Source.«037_CompletionTime»

namespace PhysicsLean
namespace Technology.Materialization.Source

def monatomicFailureModes : List MaterializationFailureMode :=
  [ { code := "MM-F1", statement := "No compatible seed or nucleation path reaches the monatomic target." }
  , { code := "MM-F2", statement := "Completion time exceeds the admissible fabrication window." }
  , { code := "MM-F3", statement := "Defects outrun completion before a usable body forms." } ]

end Technology.Materialization.Source
end PhysicsLean
