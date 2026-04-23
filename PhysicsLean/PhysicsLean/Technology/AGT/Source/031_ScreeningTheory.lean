import PhysicsLean.Technology.AGT.Source.«030_FieldChargeDensity»

namespace PhysicsLean
namespace Technology.AGT.Source

structure TwoComponentMedium where
  rhoPlus : Rat
  rhoMinus : Rat
  rhoNeutral : Rat
  deriving Repr

def gravPolarization (medium : TwoComponentMedium) : Rat :=
  medium.rhoPlus - medium.rhoMinus

def totalFreeDensity (medium : TwoComponentMedium) : Rat :=
  medium.rhoPlus + medium.rhoMinus

def localNeutralFraction (medium : TwoComponentMedium) : Rat :=
  medium.rhoNeutral / (medium.rhoPlus + medium.rhoMinus + medium.rhoNeutral)

def screeningRegime (barePotential effectivePotential : Rat) : Prop :=
  |effectivePotential| < |barePotential|

def linearizedChargeResponse (susceptibility potential : Rat) : Rat :=
  -susceptibility * potential

def screeningMassSquared (epsilon susceptibility kappa : Rat) : Rat :=
  (epsilon + susceptibility) / kappa

theorem screeningMassSquared_eq (epsilon susceptibility kappa : Rat) :
    screeningMassSquared epsilon susceptibility kappa = (epsilon + susceptibility) / kappa := by
  rfl

structure ToyHydrodynamicState where
  rhoPlus : Rat
  rhoMinus : Rat
  rhoNeutral : Rat
  potential : Rat
  deriving Repr

structure ToyHydrodynamicParameters where
  diffusionPlus : Rat
  diffusionMinus : Rat
  diffusionNeutral : Rat
  mobilityPlus : Rat
  mobilityMinus : Rat
  bindingRate : Rat
  unbindingRate : Rat
  kappa : Rat
  epsilon : Rat
  deriving Repr

def freeCharge (state : ToyHydrodynamicState) : Rat :=
  state.rhoPlus - state.rhoMinus

def boundNeutralization (params : ToyHydrodynamicParameters) (state : ToyHydrodynamicState) : Rat :=
  params.bindingRate * state.rhoPlus * state.rhoMinus - params.unbindingRate * state.rhoNeutral

end Technology.AGT.Source
end PhysicsLean
