import PhysicsLean.Technology.Materialization.Source.«138_ErrorThresholds»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure MorphogeneticRecursiveExtension where
  fieldLabels : List String
  patternedSuccessorLabels : List String
  deriving Repr

def morphogeneticRecursiveExtensionAdmissible (extension : MorphogeneticRecursiveExtension) : Prop :=
  0 < extension.fieldLabels.length ∧ 0 < extension.patternedSuccessorLabels.length

def patternedSuccessorsRequireMoreThanPureReplication
    (extension : MorphogeneticRecursiveExtension) : Prop :=
  morphogeneticRecursiveExtensionAdmissible extension

end Technology.Materialization.Source
end PhysicsLean
