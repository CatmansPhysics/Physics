import PhysicsLean.Technology.Materialization.Source.«025_CrystallineSoftHardSplit»

namespace PhysicsLean
namespace Technology.Materialization.Source

def crystallineFailureModes : List MaterializationFailureMode :=
  [ { code := "MC-F1", statement := "No crystalline reservoir reaches the target lattice class." }
  , { code := "MC-F2", statement := "Defects accumulate faster than repair closes the surface." }
  , { code := "MC-F3", statement := "The target remains only softly sustained by the active channel." } ]

end Technology.Materialization.Source
end PhysicsLean
