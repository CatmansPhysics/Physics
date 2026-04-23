import PhysicsLean.Technology.AGT.Source.«000_ProjectScope»
import PhysicsLean.ObserverDynamics.Observer.Basic
import PhysicsLean.ObserverDynamics.Geometry.GravityChannel

namespace PhysicsLean
namespace Technology.AGT.Source

universe u v w y z

structure LocalizedSector (W : Type u) (β : Type v) where
  state : W
  densityAt : β -> Nat

structure ProjectKernel (W : Type u) (ℓ : Type v) (β : Type w) (τ : Type w)
    (ι : Type y) (κ : Type z) where
  scope : ProjectScope W
  observer : Observer W ℓ β τ
  geometricChannel : GravityLikeChannel β ι
  markedKernel : β -> κ

namespace ProjectKernel

def signedSourceDensity {W : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    {ι : Type y} {κ : Type z} (kernel : ProjectKernel W ℓ β τ ι κ)
    (support : List (LocalizedSector W β)) (site : β) : Int :=
  (support.map fun sector =>
    (kernel.scope.gravResidue sector.state).toInt * Int.ofNat (sector.densityAt site)).sum

@[simp] theorem signedSourceDensity_nil {W : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    {ι : Type y} {κ : Type z} (kernel : ProjectKernel W ℓ β τ ι κ) (site : β) :
    kernel.signedSourceDensity [] site = 0 := by
  simp [signedSourceDensity]

@[simp] theorem signedSourceDensity_cons {W : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    {ι : Type y} {κ : Type z} (kernel : ProjectKernel W ℓ β τ ι κ)
    (head : LocalizedSector W β) (tail : List (LocalizedSector W β)) (site : β) :
    kernel.signedSourceDensity (head :: tail) site =
      (kernel.scope.gravResidue head.state).toInt * Int.ofNat (head.densityAt site) +
        kernel.signedSourceDensity tail site := by
  simp [signedSourceDensity]

end ProjectKernel

def probeInteractionEnergy (coupling potential : Rat) (probeResidue : SignedResidue) : Rat :=
  -coupling * probeResidue.toInt * potential

def radialForceCoefficient (coupling amplitude : Rat)
    (sourceResidue probeResidue : SignedResidue) : Rat :=
  -coupling * amplitude * (sourceResidue.toInt * probeResidue.toInt)

@[simp] theorem probeInteractionEnergy_zero (coupling potential : Rat) :
    probeInteractionEnergy coupling potential SignedResidue.zero = 0 := by
  simp [probeInteractionEnergy, SignedResidue.toInt]

@[simp] theorem radialForceCoefficient_zero_left (coupling amplitude : Rat)
    (probeResidue : SignedResidue) :
    radialForceCoefficient coupling amplitude SignedResidue.zero probeResidue = 0 := by
  simp [radialForceCoefficient, SignedResidue.toInt]

@[simp] theorem radialForceCoefficient_zero_right (coupling amplitude : Rat)
    (sourceResidue : SignedResidue) :
    radialForceCoefficient coupling amplitude sourceResidue SignedResidue.zero = 0 := by
  simp [radialForceCoefficient, SignedResidue.toInt]

theorem pairRegime_of_nonzero_pair {sourceResidue probeResidue : SignedResidue}
    (hLeft : sourceResidue != SignedResidue.zero) (hRight : probeResidue != SignedResidue.zero) :
    pairRegime sourceResidue probeResidue = PairRegime.attractive \/
      pairRegime sourceResidue probeResidue = PairRegime.repulsive := by
  cases sourceResidue <;> cases probeResidue <;> simp [pairRegime] at hLeft hRight ⊢

end Technology.AGT.Source
end PhysicsLean
