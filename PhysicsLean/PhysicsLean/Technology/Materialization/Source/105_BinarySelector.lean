import PhysicsLean.Technology.Materialization.Source.«104_FunctionalAdmissibility»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure BinarySelectorDevice where
  memoryState : Nat
  deriving Repr

def binarySelectorOutput (inputBit : Nat) (device : BinarySelectorDevice) : Nat :=
  if device.memoryState = 0 then inputBit else 1 - inputBit

def binarySelectorAdmissible (device : BinarySelectorDevice) : Prop :=
  device.memoryState = 0 ∨ device.memoryState = 1

end Technology.Materialization.Source
end PhysicsLean
