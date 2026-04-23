import PhysicsLean.Technology.AGT.Source.«081_ComputationalPipeline»

namespace PhysicsLean
namespace Technology.AGT.Source

structure Falsifier where
  code : String
  statement : String
  deriving Repr

def falsifiers : List Falsifier :=
  [ { code := "F1"
      statement := "All reasonable microscopic realizations collapse to q_g = 0 or lose sign stability under rewriting and transfer." }
  , { code := "F2"
      statement := "Stable opposite-sign sectors exist but have no spectral image compatible with the grav marker." }
  , { code := "F3"
      statement := "There is microscopic sign but no stable repulsive transport regime." }
  , { code := "F4"
      statement := "All opposite-sign sectors immediately neutralize on every coarse scale." }
  , { code := "F5"
      statement := "All large-scale mixed-medium regimes are dynamically indistinguishable from ordinary attraction." }
  , { code := "F6"
      statement := "Interface sectors have no transport signatures." } ]

structure SuccessLevel where
  title : String
  conditions : List String
  deriving Repr

def successLevels : List SuccessLevel :=
  [ { title := "Structural success"
      conditions := ["q_g is realizable and nontrivial", "grav-kernel builds", "opposite-sign and neutral composite sectors exist"] }
  , { title := "Physical success"
      conditions := ["repulsive transport window exists", "screening regime exists", "interface sectors are observable"] }
  , { title := "Large-scale success"
      conditions := ["mixed medium has its own phase diagram", "repulsive voids or domain networks arise", "large-scale dynamics does not reduce to ordinary attraction"] } ]

structure AuditTarget where
  code : String
  statement : String
  deriving Repr

def chapter8Targets : List AuditTarget :=
  [ { code := "AG-T16"
      statement := "AGT-1 qualifies as a genuine physical research program only if there is an explicit computational pipeline, immediate checkpoints, observer-level signatures, and identifiable falsifiers." } ]

theorem falsifiers_length : falsifiers.length = 6 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
