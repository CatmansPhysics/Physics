import PhysicsLean.ContinuumField.Transport.Diffusion

namespace PhysicsLean

structure ConductiveResponse where
  conductivity : Rat

def responseCurrent (response : ConductiveResponse) (gradient : Rat) : Rat :=
  response.conductivity * gradient

end PhysicsLean
