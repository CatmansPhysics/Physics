import PhysicsLean.Technology.Materialization.Source.«014_FirstDerivedPropositions»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure FirstTargetTheorem where
  code : String
  statement : String
  deriving Repr

def firstTargetTheorems : List FirstTargetTheorem :=
  [ { code := "M-T1", statement := "No materialization channel succeeds without precursor support." }
  , { code := "M-T2", statement := "Soft and hard materialization separate by post-channel persistence." }
  , { code := "M-T3", statement := "Observer-relative identity is specification-relative." }
  , { code := "M-T4", statement := "Minimal precursor sufficiency bounds the smallest successful channel." } ]

end Technology.Materialization.Source
end PhysicsLean
