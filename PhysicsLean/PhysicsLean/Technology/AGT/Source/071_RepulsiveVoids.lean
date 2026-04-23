import PhysicsLean.Technology.AGT.Source.«070_LargeScaleMedium»

namespace PhysicsLean
namespace Technology.AGT.Source

structure RepulsiveVoid where
  interiorPolarization : Rat
  exteriorPolarization : Rat
  radius : Rat
  deriving Repr

def IsRepulsiveVoid (void : RepulsiveVoid) : Prop :=
  void.interiorPolarization != void.exteriorPolarization ∧ 0 <= void.radius

def voidRepelsOppositeProbe (void : RepulsiveVoid) (probeCharge : Int) : Prop :=
  probeCharge * Int.sign void.interiorPolarization.num < 0

structure DomainNetwork where
  wallSpacing : Rat
  wallTension : Rat
  deriving Repr

def effectiveWallStress (network : DomainNetwork) : Rat :=
  network.wallTension / network.wallSpacing

structure BubblePopulation where
  nucleationRate : Rat
  meanRadius : Rat
  numberDensity : Rat
  deriving Repr

def bubblePopulationControlsGeometry (population : BubblePopulation) : Prop :=
  0 < population.nucleationRate ∧ 0 < population.numberDensity

end Technology.AGT.Source
end PhysicsLean
