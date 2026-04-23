import PhysicsLean.Technology.Materialization.Source.«056_ArchitectureReduction»

namespace PhysicsLean
namespace Technology.Materialization.Source

def architectureFailureModes : List MaterializationFailureMode :=
  [ { code := "M-F17", statement := "Blind control follows an open-loop schedule and ignores realized defects." }
  , { code := "M-F18", statement := "Template drift destroys local compatibility with the target specification." }
  , { code := "M-F19", statement := "Monitoring under-resolution merges defect-relevant states too early." }
  , { code := "M-F20", statement := "Control latency allows defect cascades to outrun correction." }
  , { code := "M-F21", statement := "Stored memory remains fabrication-useless because it changes no action." }
  , { code := "M-F22", statement := "The chosen fabricator class is weaker than the specification requires." } ]

end Technology.Materialization.Source
end PhysicsLean
