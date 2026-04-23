import PhysicsLean.Technology.Materialization.Source.«012_AssemblyHistories»

namespace PhysicsLean
namespace Technology.Materialization.Source

def softMaterializationSuccess (spec : SpecificationTheory) (history : AssemblyHistory) : Prop :=
  observerSpecificationAdmissible spec ∧ controlledAssembly history

def hardMaterializationSuccess (spec : SpecificationTheory) (history : AssemblyHistory) : Prop :=
  softMaterializationSuccess spec history ∧ history.targetLabel != ""

def successfulMaterialization (spec : SpecificationTheory) (history : AssemblyHistory) : Prop :=
  softMaterializationSuccess spec history ∨ hardMaterializationSuccess spec history

end Technology.Materialization.Source
end PhysicsLean
