import PhysicsLean.Technology.Materialization.Source.«139_MorphogeneticExtension»

namespace PhysicsLean
namespace Technology.Materialization.Source

def selfFabricationFailureModes : List MaterializationFailureMode :=
  [ { code := "M-F59", statement := "Self-repair succeeds locally but template transfer to a successor fails." }
  , { code := "M-F60", statement := "Template copying falls below the fabrication error threshold." }
  , { code := "M-F61", statement := "A successor is produced but does not remain viable for nonzero time." }
  , { code := "M-F62", statement := "Resource competition drives the recursive lineage below replacement." }
  , { code := "M-F63", statement := "A recursive self-model exists without improving successor quality." }
  , { code := "M-F64", statement := "Waste accumulation destroys long-run recursive sustainability." }
  , { code := "M-F65", statement := "Successor identity drifts outside the intended fabrication class." } ]

end Technology.Materialization.Source
end PhysicsLean
