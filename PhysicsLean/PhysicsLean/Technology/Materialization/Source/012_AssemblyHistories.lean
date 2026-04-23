import PhysicsLean.Technology.Materialization.Source.«011_PrecursorTheory»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure AssemblyHistory where
  precursor : PrecursorTheory
  stages : List String
  targetLabel : String
  deriving Repr

def controlledAssembly (history : AssemblyHistory) : Prop :=
  precursorNonempty history.precursor ∧ 0 < history.stages.length

end Technology.Materialization.Source
end PhysicsLean
