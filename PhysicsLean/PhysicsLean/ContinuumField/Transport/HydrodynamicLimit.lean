import PhysicsLean.ContinuumField.Transport.Conductivity

namespace PhysicsLean

structure HydrodynamicState where
  massDensity : Rat
  velocity : Rat
  pressure : Rat

def coarseFlux (state : HydrodynamicState) : Rat :=
  state.massDensity * state.velocity

end PhysicsLean
