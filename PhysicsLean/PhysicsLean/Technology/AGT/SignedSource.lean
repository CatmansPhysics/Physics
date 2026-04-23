import PhysicsLean.ObserverDynamics.Geometry.GravityChannel

namespace PhysicsLean

universe u v

structure SignedSourceDensity (beta : Type u) where
  density : beta -> Int

namespace SignedSourceDensity

def value {beta : Type u} (sourceDensity : SignedSourceDensity beta) (state : beta) : Int :=
  sourceDensity.density state

end SignedSourceDensity

abbrev ObserverPotential (beta : Type u) (iota : Type v) := GravityLikeChannel beta iota

structure ProbeInteractionEnergy (beta : Type u) (iota : Type v) where
  energy : beta -> beta -> iota

namespace ProbeInteractionEnergy

def pairEnergy {beta : Type u} {iota : Type v}
    (interaction : ProbeInteractionEnergy beta iota) (source target : beta) : iota :=
  interaction.energy source target

theorem pairEnergy_eq_energy {beta : Type u} {iota : Type v}
    (interaction : ProbeInteractionEnergy beta iota) (source target : beta) :
    interaction.pairEnergy source target = interaction.energy source target := by
  rfl

end ProbeInteractionEnergy

abbrev EffectiveForce (beta : Type u) (iota : Type v) := beta -> beta -> iota

theorem effectiveForce_apply {beta : Type u} {iota : Type v}
    (force : EffectiveForce beta iota) (source target : beta) :
    force source target = force source target := by
  rfl

theorem observerPotential_pairPotential {beta : Type u} {iota : Type v}
    (channel : ObserverPotential beta iota) (source target : beta) :
    GravityLikeChannel.pairPotential channel source target = channel.potential source target := by
  rfl

structure SignedObserverCalibration (beta : Type u) (iota : Type v) where
  sourceDensity : SignedSourceDensity beta
  observerPotential : ObserverPotential beta iota
  interaction : ProbeInteractionEnergy beta iota

def SignedObserverCalibration.effectiveForce {beta : Type u} {iota : Type v}
    (calibration : SignedObserverCalibration beta iota) : EffectiveForce beta iota :=
  fun source target => calibration.observerPotential.potential source target

theorem SignedObserverCalibration.effectiveForce_eq_pairPotential {beta : Type u} {iota : Type v}
    (calibration : SignedObserverCalibration beta iota) (source target : beta) :
    calibration.effectiveForce source target =
      GravityLikeChannel.pairPotential calibration.observerPotential source target := by
  rfl

theorem SignedObserverCalibration.pairEnergy_eq {beta : Type u} {iota : Type v}
    (calibration : SignedObserverCalibration beta iota) (source target : beta) :
    calibration.interaction.pairEnergy source target = calibration.interaction.energy source target := by
  rfl

end PhysicsLean
