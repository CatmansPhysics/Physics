import PhysicsLean.Audit.Status.StatementStatus
import PhysicsLean.Audit.Status.Provenance

namespace PhysicsLean
namespace Technology.AGT.Source

inductive AGTStatementLabel
  | definitionAxiom
  | derivedProposition
  | targetTheorem
  | failureMode
  deriving DecidableEq, Repr

namespace AGTStatementLabel

def shortCode : AGTStatementLabel -> String
  | definitionAxiom => "A"
  | derivedProposition => "D"
  | targetTheorem => "T"
  | failureMode => "F"

def toStatementStatus : AGTStatementLabel -> StatementStatus
  | definitionAxiom => StatementStatus.definitionAxiom
  | derivedProposition => StatementStatus.derivedTheorem
  | targetTheorem => StatementStatus.targetTheorem
  | failureMode => StatementStatus.failureMode

theorem shortCode_nonempty (label : AGTStatementLabel) : label.shortCode != "" := by
  cases label <;> decide

end AGTStatementLabel

inductive AGTImportedLayer
  | symbolicStructures
  | seqSEq
  | hPattern
  | efu
  | transfer
  | spectralControl
  | observer
  | geometricProjection
  | effectiveForce
  deriving DecidableEq, Repr

namespace AGTImportedLayer

def provenance : AGTImportedLayer -> Provenance
  | symbolicStructures => Provenance.internal
  | seqSEq => Provenance.internal
  | hPattern => Provenance.internal
  | efu => Provenance.internal
  | transfer => Provenance.internalToEffective
  | spectralControl => Provenance.internalToEffective
  | observer => Provenance.internalToEffective
  | geometricProjection => Provenance.importedContinuum
  | effectiveForce => Provenance.openTarget

end AGTImportedLayer

def baseImportedLayers : List AGTImportedLayer :=
  [AGTImportedLayer.symbolicStructures,
    AGTImportedLayer.seqSEq,
    AGTImportedLayer.hPattern,
    AGTImportedLayer.efu,
    AGTImportedLayer.transfer,
    AGTImportedLayer.spectralControl,
    AGTImportedLayer.observer,
    AGTImportedLayer.geometricProjection,
    AGTImportedLayer.effectiveForce]

theorem observer_mem_baseImportedLayers : AGTImportedLayer.observer ∈ baseImportedLayers := by
  simp [baseImportedLayers]

theorem effectiveForce_mem_baseImportedLayers : AGTImportedLayer.effectiveForce ∈ baseImportedLayers := by
  simp [baseImportedLayers]

end Technology.AGT.Source
end PhysicsLean
