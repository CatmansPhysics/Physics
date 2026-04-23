import PhysicsLean.HigherOrganization.Chemistry.ReactionNetwork

namespace PhysicsLean

inductive MaterialClass
  | molecular
  | crystalline
  | glassy
  deriving DecidableEq, Repr

end PhysicsLean
