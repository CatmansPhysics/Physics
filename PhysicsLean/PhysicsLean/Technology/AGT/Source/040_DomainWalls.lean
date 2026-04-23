import PhysicsLean.Technology.AGT.Source.«032_PhaseClassification»

namespace PhysicsLean
namespace Technology.AGT.Source

structure DoubleWellParameters where
  stiffness : Rat
  quarticScale : Rat
  vacuumAmplitude : Rat
  deriving Repr

def gravPhasePotential (params : DoubleWellParameters) (polarization : Rat) : Rat :=
  params.quarticScale / 4 * (polarization ^ 2 - params.vacuumAmplitude ^ 2) ^ 2

structure DomainWallProfile where
  leftVacuum : Rat
  rightVacuum : Rat
  center : Rat
  width : Rat
  deriving Repr

def IsGravDomainWall (params : DoubleWellParameters) (profile : DomainWallProfile) : Prop :=
  profile.leftVacuum = params.vacuumAmplitude ∧
    profile.rightVacuum = -params.vacuumAmplitude ∧
    0 < profile.width

def kinkProfile (params : DoubleWellParameters) (center : Rat) : DomainWallProfile :=
  { leftVacuum := params.vacuumAmplitude
    rightVacuum := -params.vacuumAmplitude
    center := center
    width := params.stiffness / (params.quarticScale * params.vacuumAmplitude ^ 2) }

theorem kinkProfile_isDomainWall (params : DoubleWellParameters) (center : Rat)
    (hStiffness : 0 < params.stiffness) (hQuartic : 0 < params.quarticScale)
    (hVacuum : 0 < params.vacuumAmplitude) :
    IsGravDomainWall params (kinkProfile params center) := by
  constructor
  · rfl
  constructor
  · rfl
  · dsimp [kinkProfile]
    positivity

def wallTensionDensity (params : DoubleWellParameters) (gradient polarization : Rat) : Rat :=
  params.stiffness / 2 * gradient ^ 2 + gravPhasePotential params polarization

def wallTensionPositive (params : DoubleWellParameters) : Prop :=
  0 < params.stiffness ∧ 0 < params.quarticScale ∧ 0 < params.vacuumAmplitude

theorem wallTensionDensity_nonneg (params : DoubleWellParameters)
    (hQuartic : 0 <= params.quarticScale) (hStiffness : 0 <= params.stiffness)
    (gradient polarization : Rat) :
    0 <= wallTensionDensity params gradient polarization := by
  dsimp [wallTensionDensity, gravPhasePotential]
  positivity

structure InterfaceFailureMode where
  code : String
  description : String
  deriving Repr

def domainWallFailureModes : List InterfaceFailureMode :=
  [ { code := "AG-F9"
      description := "The effective potential has no disconnected minima, so no grav-domain walls exist." }
  , { code := "AG-F10"
      description := "The wall tension is not positive or not well defined." } ]

end Technology.AGT.Source
end PhysicsLean
