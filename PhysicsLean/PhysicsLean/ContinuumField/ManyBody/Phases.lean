import PhysicsLean.ContinuumField.QFT.Scattering

namespace PhysicsLean

inductive ManyBodyPhase where
  | disordered
  | ordered
  | topological
  deriving DecidableEq, Repr

end PhysicsLean
