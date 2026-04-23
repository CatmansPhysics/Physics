import PhysicsLean.Technology.Materialization.Source.«120_ProtoAgentObjects»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure StrongInternalSymbolicState where
  label : String
  observerDistinguishable : Bool
  reducibleToInstantInput : Bool
  actionGuiding : Bool
  reusableAcrossCycles : Bool
  deriving Repr

def strongInternalSymbolicStateAdmissible (state : StrongInternalSymbolicState) : Prop :=
  state.label != "" ∧
    state.observerDistinguishable = true ∧
      state.reducibleToInstantInput = false ∧
        state.actionGuiding = true ∧ state.reusableAcrossCycles = true

structure SymbolicMemorySector where
  states : List StrongInternalSymbolicState
  deriving Repr

def symbolicallyAdmissibleMemorySector (sector : SymbolicMemorySector) : Prop :=
  ∀ state, state ∈ sector.states → strongInternalSymbolicStateAdmissible state

end Technology.Materialization.Source
end PhysicsLean
