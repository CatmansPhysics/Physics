import PhysicsLean.Technology.AGT.Source.«052_BackgroundScattering»

namespace PhysicsLean
namespace Technology.AGT.Source

structure GravKernelEvent where
  weight : Rat
  grading : Int
  observerShift : Rat
  actionWeight : Rat
  gravIncrement : Int
  deriving Repr

def gravMarkedWeight (event : GravKernelEvent)
    (z theta eta s : Rat) : Rat :=
  event.weight * z ^ event.grading.natAbs * theta * eta * s ^ event.gravIncrement.natAbs

def gravMarkedKernel (events : List GravKernelEvent) (z theta eta s : Rat) : Rat :=
  (events.map fun event => gravMarkedWeight event z theta eta s).sum

structure SpectralObservable where
  momentumShadow : Rat
  energyShadow : Rat
  gravChargeShadow : Rat
  deriving Repr

def firstMomentObservable (thetaMoment etaMoment gravMoment : Rat) : SpectralObservable :=
  { momentumShadow := thetaMoment
    energyShadow := -etaMoment
    gravChargeShadow := gravMoment }

end Technology.AGT.Source
end PhysicsLean
