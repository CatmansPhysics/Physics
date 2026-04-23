import PhysicsLean.Technology.Materialization.Source.«015_FirstTargetTheorems»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure MaterializationFailureMode where
  code : String
  statement : String
  deriving Repr

def firstFailureModes : List MaterializationFailureMode :=
  [ { code := "M-F1", statement := "No precursor reservoir is available for the requested object." }
  , { code := "M-F2", statement := "Assembly completes syntactically but violates the defect budget." }
  , { code := "M-F3", statement := "The observer specification is met only while external support remains active." }
  , { code := "M-F4", statement := "The object persists but fails observer-relative identity tests." }
  , { code := "M-F5", statement := "The channel reaches a target image but not a stable material class." } ]

end Technology.Materialization.Source
end PhysicsLean
