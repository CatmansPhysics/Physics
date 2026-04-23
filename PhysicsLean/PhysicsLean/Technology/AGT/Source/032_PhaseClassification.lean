import PhysicsLean.Technology.AGT.Source.«031_ScreeningTheory»

namespace PhysicsLean
namespace Technology.AGT.Source

inductive MesoscopicPhase
  | unscreenedAttractive
  | mixedRepulsive
  | screening
  | segregatedAntigravity
  | polarizedNeutral
  deriving DecidableEq, Repr

structure PhaseIndicators where
  meanPolarization : Rat
  neutralFraction : Rat
  dipoleMoment : Rat
  segregationParameter : Rat
  deriving Repr

def classifyPhase (indicators : PhaseIndicators) : MesoscopicPhase :=
  if indicators.neutralFraction > 0 then
    if indicators.dipoleMoment = 0 then MesoscopicPhase.screening else MesoscopicPhase.polarizedNeutral
  else if indicators.segregationParameter > 0 then
    MesoscopicPhase.segregatedAntigravity
  else if indicators.meanPolarization = 0 then
    MesoscopicPhase.mixedRepulsive
  else
    MesoscopicPhase.unscreenedAttractive

structure MesoscopicTarget where
  code : String
  statement : String
  deriving Repr

def chapter3Targets : List MesoscopicTarget :=
  [ { code := "AG-T6"
      statement := "Depending on control parameters, the mesoscopic medium admits unscreened attraction, mixed repulsion, screening, and segregated antigravity domains." } ]

structure Chapter3FailureMode where
  code : String
  description : String
  deriving Repr

def chapter3FailureModes : List Chapter3FailureMode :=
  [ { code := "AG-F5"
      description := "No stable coarse-grained window exists for the grav potential." }
  , { code := "AG-F6"
      description := "Neutral composites fail to suppress the monopole field macroscopically." }
  , { code := "AG-F7"
      description := "The mixed phase always collapses into runaway segregation." }
  , { code := "AG-F8"
      description := "Continuum closure is incompatible with the transfer-stable microscopic charge." } ]

theorem chapter3FailureModes_length : chapter3FailureModes.length = 4 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
