import PhysicsLean.Technology.AGT.Source.«082_FalsifiabilityAudit»

namespace PhysicsLean
namespace Technology.AGT.Source

inductive ProjectStatus
  | internal
  | internalToEffective
  | importedContinuumIdentification
  | asymptoticLowEnergy
  | openTarget
  deriving DecidableEq, Repr

structure WorkPackage where
  code : String
  title : String
  deliverable : String
  mainRisk : String
  deriving Repr

def agtWorkPackages : List WorkPackage :=
  [ { code := "WP-A"
      title := "Structural package"
      deliverable := "A nontrivial transfer-stable microscopic grav-charge"
      mainRisk := "q_g is trivial or representation-dependent" }
  , { code := "WP-B"
      title := "Kernel package"
      deliverable := "A grav-marked kernel with spectral sign compatibility"
      mainRisk := "no stable dominant branch or sign mismatch" }
  , { code := "WP-C"
      title := "Field package"
      deliverable := "Repulsive, neutral-suppressed, and screening field regimes"
      mainRisk := "repulsion does not survive coarse graining" }
  , { code := "WP-D"
      title := "Interface package"
      deliverable := "Stable walls, bubbles, shells, and dipoles"
      mainRisk := "localized interface sectors do not stabilize" }
  , { code := "WP-E"
      title := "Transport package"
      deliverable := "Distinct orbit, scattering, reflection, and trapping classes"
      mainRisk := "transport is not distinct from ordinary potential mechanics" }
  , { code := "WP-F"
      title := "Large-scale package"
      deliverable := "Repulsive void, domain-network, and bubble-percolation regimes"
      mainRisk := "large-scale behavior reduces to ordinary attraction" }
  , { code := "WP-G"
      title := "Audit package"
      deliverable := "Standing assumptions, checkpoints, falsifiers, and audit matrix"
      mainRisk := "the project has no clear internal/effective/open separation" } ]

structure TheoremMilestone where
  code : String
  statement : String
  deriving Repr

def theoremChain : List TheoremMilestone :=
  [ { code := "T1"
      statement := "A nontrivial transfer-stable microscopic grav-charge exists." }
  , { code := "T2"
      statement := "A grav-marked spectral charge matches microscopic charge in sign." }
  , { code := "T3"
      statement := "Opposite-sign sectors generate a repulsive transport branch." }
  , { code := "T4"
      statement := "Neutral composites suppress the leading monopole response." }
  , { code := "T5"
      statement := "Mixed grav-medium admits a screening regime." }
  , { code := "T6"
      statement := "Stable walls, dipoles, shells, and bubbles exist as localized sectors." }
  , { code := "T7"
      statement := "Localized sectors have distinct transport signatures." }
  , { code := "T8"
      statement := "Mixed grav-medium admits multiple large-scale regimes." }
  , { code := "T9"
      statement := "AGT-1 has a finite computational pipeline with explicit falsifiers." } ]

end Technology.AGT.Source
end PhysicsLean
