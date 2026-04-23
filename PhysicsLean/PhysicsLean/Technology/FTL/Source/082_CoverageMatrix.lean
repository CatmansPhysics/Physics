import PhysicsLean.Technology.FTL.Source.«081_DependencyGraph»

namespace PhysicsLean
namespace Technology.FTL.Source

inductive ProvenanceLabel
  | internal
  | internalToEffective
  | importedContinuumIdentification
  | asymptoticLowEnergy
  | openTarget
  deriving DecidableEq, Repr

structure CoverageEntry where
  regime : ProtocolRegime
  component : String
  provenance : ProvenanceLabel
  status : String
  blocker : String
  deriving Repr

def softCoverage : List CoverageEntry :=
  [ { regime := ProtocolRegime.softReadout
      component := "Observer-relative notion of FTL"
      provenance := ProvenanceLabel.internal
      status := "covered"
      blocker := "none" }
  , { regime := ProtocolRegime.softReadout
      component := "Reduced-state language for local detector readout"
      provenance := ProvenanceLabel.internal
      status := "covered"
      blocker := "generic only, not yet FTL-specific" }
  , { regime := ProtocolRegime.softReadout
      component := "Soft link-sector as an admissible object type"
      provenance := ProvenanceLabel.internalToEffective
      status := "partial"
      blocker := "no existence theorem for non-factorizable sectors" }
  , { regime := ProtocolRegime.softReadout
      component := "Binary remote witness protocol"
      provenance := ProvenanceLabel.internalToEffective
      status := "toy-covered"
      blocker := "no closed robustness theorem" }
  , { regime := ProtocolRegime.softReadout
      component := "Finite remote scanner"
      provenance := ProvenanceLabel.openTarget
      status := "open"
      blocker := "no injectivity theorem on a finite class of remote states" } ]

def hardCoverage : List CoverageEntry :=
  [ { regime := ProtocolRegime.hardTransport
      component := "Observer-relative notion of superluminal transport"
      provenance := ProvenanceLabel.internal
      status := "covered"
      blocker := "none" }
  , { regime := ProtocolRegime.hardTransport
      component := "Pole-residue language for object sectors"
      provenance := ProvenanceLabel.internal
      status := "covered"
      blocker := "none at the language level" }
  , { regime := ProtocolRegime.hardTransport
      component := "Existence of a superluminal carrier sector"
      provenance := ProvenanceLabel.openTarget
      status := "open"
      blocker := "no derived carrier theorem" }
  , { regime := ProtocolRegime.hardTransport
      component := "One-pole hard transport"
      provenance := ProvenanceLabel.openTarget
      status := "open"
      blocker := "blocked by carrier existence, pole survival, and identity preservation" }
  , { regime := ProtocolRegime.hardTransport
      component := "Composite hard transport"
      provenance := ProvenanceLabel.importedContinuumIdentification
      status := "strongly open"
      blocker := "blocked by identity and binding stability for transported composite sectors" } ]

theorem softCoverage_length : softCoverage.length = 5 := by
  rfl

theorem hardCoverage_length : hardCoverage.length = 5 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
