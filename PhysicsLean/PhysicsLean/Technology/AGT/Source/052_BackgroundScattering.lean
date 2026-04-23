import PhysicsLean.Technology.AGT.Source.«051_OrbitalTransport»

namespace PhysicsLean
namespace Technology.AGT.Source

inductive BackgroundTransportClass
  | anisotropicDipoleScattering
  | wallReflection
  | wallTransmission
  | temporaryWallTrapping
  | bubbleCapture
  | bubbleExpulsion
  | polarizableNeutralDrift
  deriving DecidableEq, Repr

def dipolePotential (coupling bodyCharge dipoleMoment projection radius : Rat) : Rat :=
  -coupling * bodyCharge * dipoleMoment * projection / radius ^ 2

def wallPotential (amplitude profileFactor : Rat) : Rat :=
  amplitude * profileFactor

def bubbleProfile (inside outside transitionFactor : Rat) : Rat :=
  inside * (1 - transitionFactor) / 2 + outside * (1 + transitionFactor) / 2

def wallTransportClass (incomingEnergy barrierHeight : Rat) : BackgroundTransportClass :=
  if incomingEnergy < barrierHeight then
    BackgroundTransportClass.wallReflection
  else if incomingEnergy = barrierHeight then
    BackgroundTransportClass.temporaryWallTrapping
  else
    BackgroundTransportClass.wallTransmission

def bubbleTransportClass (bodyCharge innerSign outerSign : Int) : BackgroundTransportClass :=
  if bodyCharge * innerSign > 0 then
    BackgroundTransportClass.bubbleCapture
  else if bodyCharge * outerSign > 0 then
    BackgroundTransportClass.bubbleExpulsion
  else
    BackgroundTransportClass.anisotropicDipoleScattering

structure TransportTarget where
  code : String
  statement : String
  deriving Repr

def chapter5Targets : List TransportTarget :=
  [ { code := "AG-T9"
      statement := "Test bodies in AGT-1 backgrounds realize bound-orbit transport, repulsive scattering, screened quasi-free transport, anisotropic dipole scattering, wall reflection or transmission, bubble capture or expulsion, and polarizable neutral drift." } ]

structure TransportFailureMode where
  code : String
  description : String
  deriving Repr

def chapter5FailureModes : List TransportFailureMode :=
  [ { code := "AG-F13"
      description := "Observer-level transport equations fail to close from structural dynamics." }
  , { code := "AG-F14"
      description := "Repulsive sectors are trivial and show no structured scattering." }
  , { code := "AG-F15"
      description := "Neutral shells and bubbles have no distinct transport signatures." }
  , { code := "AG-F16"
      description := "Polarizable neutral matter cannot be realized from microscopic composites." } ]

theorem chapter5FailureModes_length : chapter5FailureModes.length = 4 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
