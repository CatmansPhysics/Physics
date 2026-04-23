import PhysicsLean.Technology.Materialization.Source.«160_CalibrationProtocol»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure AuditedHierarchicalRealizer where
  protocol : CalibrationProtocol
  lowerChain : LowerCrystallineCalibrationWitness
  levelLabels : List String
  persistent : Bool
  deriving Repr

def auditedHierarchicalRealizerAdmissible (realizer : AuditedHierarchicalRealizer) : Prop :=
  calibratedLowerChain realizer.protocol realizer.lowerChain ∧
    0 < realizer.levelLabels.length ∧ realizer.persistent = true

def lowerLevelClosed (realizer : AuditedHierarchicalRealizer) : Prop :=
  seededCompletion realizer.lowerChain.localCompatibility.target
    realizer.lowerChain.localCompatibility.history
    realizer.lowerChain.completion

theorem auditedMaterializationTheorem
    (realizer : AuditedHierarchicalRealizer)
    (h : auditedHierarchicalRealizerAdmissible realizer) :
    lowerLevelClosed realizer := by
  exact lowerChainSupportsSeededCompletion realizer.lowerChain h.1.2

theorem auditedMaterializationHasPersistentLevels
    (realizer : AuditedHierarchicalRealizer)
    (h : auditedHierarchicalRealizerAdmissible realizer) :
    0 < realizer.levelLabels.length := by
  exact h.2.1

end Technology.Materialization.Source
end PhysicsLean
