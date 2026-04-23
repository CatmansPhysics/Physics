import PhysicsLean.Audit.Status.Provenance

namespace PhysicsLean

structure LayerEdge where
  source : String
  target : String

def defaultLayerGraph : List LayerEdge :=
  [
    ⟨"StructuralCore", "ObserverDynamics"⟩,
    ⟨"ObserverDynamics", "QuantumStat"⟩,
    ⟨"QuantumStat", "ContinuumField"⟩,
    ⟨"ContinuumField", "HigherOrganization"⟩,
    ⟨"ContinuumField", "StandardModel"⟩,
    ⟨"StandardModel", "Audit"⟩
  ]

end PhysicsLean
