import PhysicsLean.Technology.AGT.Source.«022_MicroscopicSpectralCharge»

namespace PhysicsLean
namespace Technology.AGT.Source

structure ChargeMode where
  load : Nat
  positiveDensity : Rat
  negativeDensity : Rat
  neutralDensity : Rat
  massPositive : Rat
  massNegative : Rat
  massNeutral : Rat
  deriving Repr

def signedGravChargeDensity (modes : List ChargeMode) : Rat :=
  (modes.map fun mode => (mode.load : Rat) * (mode.positiveDensity - mode.negativeDensity)).sum

def massLikeDensity (modes : List ChargeMode) : Rat :=
  (modes.map fun mode =>
    mode.massPositive * mode.positiveDensity +
      mode.massNegative * mode.negativeDensity +
      mode.massNeutral * mode.neutralDensity).sum

structure CoarseFieldWindow (β : Type _) where
  potential : β -> Rat
  chargeDensity : β -> Rat
  massDensity : β -> Rat

def observerPotential {β : Type _} (window : CoarseFieldWindow β) : β -> Rat :=
  window.potential

def probeEnergy (coupling : Rat) (probeCharge : Int) {β : Type _}
    (window : CoarseFieldWindow β) (site : β) : Rat :=
  -coupling * probeCharge * window.potential site

def effectiveForceScalar (coupling : Rat) (probeCharge : Int) (potentialGradient : Rat) : Rat :=
  coupling * probeCharge * potentialGradient

@[simp] theorem signedGravChargeDensity_nil : signedGravChargeDensity [] = 0 := by
  simp [signedGravChargeDensity]

@[simp] theorem massLikeDensity_nil : massLikeDensity [] = 0 := by
  simp [massLikeDensity]

end Technology.AGT.Source
end PhysicsLean
