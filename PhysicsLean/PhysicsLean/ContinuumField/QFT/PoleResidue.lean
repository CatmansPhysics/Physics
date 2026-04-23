import PhysicsLean.ContinuumField.QFT.Propagator

namespace PhysicsLean

structure PoleResidueData where
  poles : List Rat
  residue : Rat → Rat

def poleCount (data : PoleResidueData) : Nat :=
  data.poles.length

end PhysicsLean
