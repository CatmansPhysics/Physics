import PhysicsLean.Technology.Materialization.Source.«092_MemoryAndState»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure AdaptiveMaterializedObject where
  subsystem : FunctionalSubsystem
  recoveryLabels : List String
  deriving Repr

structure SelfMonitoringFunctionalObject where
  adaptiveObject : AdaptiveMaterializedObject
  memory : EmbeddedMemorySubsystem
  correctionLabels : List String
  deriving Repr

def adaptiveObjectAdmissible (obj : AdaptiveMaterializedObject) : Prop :=
  0 < obj.recoveryLabels.length

def informationalClosureForFabricatedObject
    (obj : SelfMonitoringFunctionalObject) : Prop :=
  adaptiveObjectAdmissible obj.adaptiveObject ∧
    embeddedMemoryAdmissible obj.memory ∧ 0 < obj.correctionLabels.length

end Technology.Materialization.Source
end PhysicsLean
