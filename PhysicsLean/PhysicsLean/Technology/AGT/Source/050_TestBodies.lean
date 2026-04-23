import PhysicsLean.Technology.AGT.Source.«042_AntigravityBubbles»

namespace PhysicsLean
namespace Technology.AGT.Source

structure TestBody where
  gravCharge : Int
  inertialMass : Rat
  restMass : Rat
  deriving Repr

def lowEnergyTransport (body : TestBody) (momentumNormSq : Rat) : Rat :=
  body.restMass + momentumNormSq / (2 * body.inertialMass)

def testBodyEnergy (coupling fieldPotential momentumNormSq : Rat) (body : TestBody) : Rat :=
  lowEnergyTransport body momentumNormSq - coupling * body.gravCharge * fieldPotential

def velocityFromMomentum (body : TestBody) (momentum : Rat) : Rat :=
  momentum / body.inertialMass

def momentumUpdate (coupling fieldGradient : Rat) (body : TestBody) : Rat :=
  coupling * body.gravCharge * fieldGradient

def acceleration (coupling fieldGradient : Rat) (body : TestBody) : Rat :=
  momentumUpdate coupling fieldGradient body / body.inertialMass

theorem equalCharge_does_not_fix_inertia (charge m1 m2 r1 r2 : Rat)
    (hMass : m1 != m2) :
    ({ gravCharge := Int.ofNat charge.num.natAbs, inertialMass := m1, restMass := r1 } : TestBody).inertialMass !=
      ({ gravCharge := Int.ofNat charge.num.natAbs, inertialMass := m2, restMass := r2 } : TestBody).inertialMass := by
  simpa using hMass

end Technology.AGT.Source
end PhysicsLean
