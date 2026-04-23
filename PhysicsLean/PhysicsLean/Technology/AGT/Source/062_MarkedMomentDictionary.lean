import PhysicsLean.Technology.AGT.Source.«061_ResolventTransport»

namespace PhysicsLean
namespace Technology.AGT.Source

structure MarkedMomentDictionary where
  firstGravMoment : Rat
  secondGravMoment : Rat
  hasInterfaceLocalizedBranch : Prop
  deriving Repr

def neutralCompositeDictionary (first second : Rat) : MarkedMomentDictionary :=
  { firstGravMoment := first
    secondGravMoment := second
    hasInterfaceLocalizedBranch := False }

def wallDictionary (soft amplitude : Rat) : MarkedMomentDictionary :=
  { firstGravMoment := soft
    secondGravMoment := amplitude
    hasInterfaceLocalizedBranch := True }

def bubbleDictionary (localized resonance : Rat) : MarkedMomentDictionary :=
  { firstGravMoment := localized
    secondGravMoment := resonance
    hasInterfaceLocalizedBranch := True }

theorem neutralComposite_vanishing_firstMoment (second : Rat) :
    (neutralCompositeDictionary 0 second).firstGravMoment = 0 := by
  rfl

theorem wallDictionary_has_interface_branch (soft amplitude : Rat) :
    (wallDictionary soft amplitude).hasInterfaceLocalizedBranch := by
  simp [wallDictionary]

structure SpectralTarget where
  code : String
  statement : String
  deriving Repr

def chapter6Targets : List SpectralTarget :=
  [ { code := "AG-T10"
      statement := "The first grav-marked moment of the dominant branch matches microscopic grav-charge up to a positive scale factor in stable low-energy sectors." }
  , { code := "AG-T11"
      statement := "Stable grav-domain walls carry a translational soft mode, a gapped amplitude mode, and possibly an interface-localized grav-neutral transport branch." }
  , { code := "AG-T12"
      statement := "Antigravity transport admits a spectral description in which grav-charge, screening, neutral composites, walls, bubbles, and observer-level equations arise from marked kernels and dominant branches." } ]

structure SpectralFailureMode where
  code : String
  description : String
  deriving Repr

def chapter6FailureModes : List SpectralFailureMode :=
  [ { code := "AG-F17"
      description := "No grav-marked kernel compatible with microscopic charge can be constructed." }
  , { code := "AG-F18"
      description := "The sign of the first grav-marked moment disagrees with microscopic grav-charge." }
  , { code := "AG-F19"
      description := "The dressed kernel fails to produce a screening gap." }
  , { code := "AG-F20"
      description := "Wall and bubble sectors cannot be represented as branch-changing or inhomogeneous resolvent sectors." }
  , { code := "AG-F21"
      description := "Low-energy observer equations do not emerge from dominant-branch expansion." } ]

theorem chapter6FailureModes_length : chapter6FailureModes.length = 5 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
