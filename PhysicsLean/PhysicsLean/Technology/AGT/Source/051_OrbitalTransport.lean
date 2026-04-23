import PhysicsLean.Technology.AGT.Source.«050_TestBodies»

namespace PhysicsLean
namespace Technology.AGT.Source

def centralPotential (coupling kernelCharge sourceCharge radius : Rat) : Rat :=
  -coupling * kernelCharge * sourceCharge / radius

def effectiveRadialPotential (angularMomentum inertialMass coupling kernelCharge sourceCharge radius : Rat) : Rat :=
  angularMomentum ^ 2 / (2 * inertialMass * radius ^ 2) +
    centralPotential coupling kernelCharge sourceCharge radius

inductive CentralTransportClass
  | boundOrbit
  | repulsiveScattering
  | screenedQuasiFree
  deriving DecidableEq, Repr

def classifyCentralTransport (kernelCharge sourceCharge : Int) (screeningMass : Rat) : CentralTransportClass :=
  if screeningMass > 0 then
    CentralTransportClass.screenedQuasiFree
  else if kernelCharge * sourceCharge > 0 then
    CentralTransportClass.boundOrbit
  else
    CentralTransportClass.repulsiveScattering

theorem opposite_sign_not_bound (kernelCharge sourceCharge : Int) :
    kernelCharge * sourceCharge < 0 ->
      classifyCentralTransport kernelCharge sourceCharge 0 = CentralTransportClass.repulsiveScattering := by
  intro hOpposite
  have hNonpos : ¬kernelCharge * sourceCharge > 0 := by
    exact not_lt_of_ge (le_of_lt hOpposite)
  simp [classifyCentralTransport, hNonpos]

def screenedPotential (coupling kernelCharge sourceCharge radius screeningFactor : Rat) : Rat :=
  -coupling * kernelCharge * sourceCharge * screeningFactor / radius

end Technology.AGT.Source
end PhysicsLean
