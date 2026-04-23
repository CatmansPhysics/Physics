import PhysicsLean.Technology.Materialization.Source.«091_FunctionalSubsystems»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure EmbeddedMemorySubsystem where
  stateLabels : List String
  metastableStates : Nat
  readoutFasterThanFlip : Bool
  deriving Repr

structure FunctionalStateSpace where
  observableStates : List String
  internalStates : List String
  deriving Repr

def embeddedMemoryAdmissible (memory : EmbeddedMemorySubsystem) : Prop :=
  2 <= memory.metastableStates ∧ 0 < memory.stateLabels.length

def statefulSpecificationRequired
    (stateSpace : FunctionalStateSpace)
    (memory : EmbeddedMemorySubsystem) : Prop :=
  embeddedMemoryAdmissible memory ∧ 0 < stateSpace.internalStates.length

end Technology.Materialization.Source
end PhysicsLean
