import PhysicsLean.Technology.Materialization.Source

namespace PhysicsLean

abbrev CrystallineTargetSpecification := Technology.Materialization.Source.CrystallineTarget
abbrev CrystallineDefectSector := Technology.Materialization.Source.DefectCalculus
abbrev CrystallinePrecursorReservoir := Technology.Materialization.Source.CrystallineReservoir
abbrev CrystallineAssemblyChannel := Technology.Materialization.Source.CrystallizationChannel
abbrev CrystallineRegime := Technology.Materialization.Source.CrystallineRegime
abbrev CrystallineOrderScore := Technology.Materialization.Source.CrystallineOrderScore
abbrev CrystallinePersistenceCriterion := Technology.Materialization.Source.PostControlPersistenceCriterion
abbrev SeededHardMaterializationWitness := Technology.Materialization.Source.SeededHardMaterializationV1

def canonicalCrystallineTarget : CrystallineTargetSpecification where
  latticeLabel := "cubic"
  cellCount := 64

def canonicalCrystallineDefects : CrystallineDefectSector where
  vacancyCount := 1
  dislocationCount := 0
  mismatchScore := 0

def canonicalCrystallineReservoir : CrystallinePrecursorReservoir where
  precursorLabels := ["atom", "cluster"]
  energeticBudget := 5

def canonicalCrystallizationChannel : CrystallineAssemblyChannel where
  reservoir := canonicalCrystallineReservoir
  target := canonicalCrystallineTarget
  controlStages := ["nucleation", "growth", "cooling"]

def canonicalCrystallineRegime : CrystallineRegime :=
  Technology.Materialization.Source.CrystallineRegime.hard

def canonicalCrystallineOrderScore : CrystallineOrderScore where
  reciprocalModes := ["(100)", "(110)"]
  peakScore := 5
  calibratedThreshold := 3

def canonicalCrystallinePersistenceCriterion : CrystallinePersistenceCriterion where
  orderWindowScore := 5
  defectWindowBound := 0
  observationWindow := 3

def canonicalSeededHardMaterializationWitness : SeededHardMaterializationWitness where
  targetLabel := "cubic-body"
  seedLabel := "oriented-seed"
  reservoirLabel := "binary-precursor"
  completionScore := 4

theorem canonicalCrystallineTarget_nonempty :
    Technology.Materialization.Source.crystallineTargetNonempty canonicalCrystallineTarget := by
  simp [Technology.Materialization.Source.crystallineTargetNonempty, canonicalCrystallineTarget]

theorem canonicalCrystallizationChannel_admissible :
    Technology.Materialization.Source.crystallizationChannelAdmissible canonicalCrystallizationChannel := by
  simp [Technology.Materialization.Source.crystallizationChannelAdmissible,
    Technology.Materialization.Source.crystallineReservoirReady,
    Technology.Materialization.Source.crystallineTargetNonempty,
    canonicalCrystallizationChannel,
    canonicalCrystallineReservoir,
    canonicalCrystallineTarget]

theorem canonicalCrystallineMaterialization_success :
    Technology.Materialization.Source.successfulCrystallineMaterialization
      0 canonicalCrystallineDefects canonicalCrystallizationChannel := by
  simp [Technology.Materialization.Source.successfulCrystallineMaterialization,
    Technology.Materialization.Source.crystallizationChannelAdmissible,
    Technology.Materialization.Source.crystallineReservoirReady,
    Technology.Materialization.Source.crystallineTargetNonempty,
    Technology.Materialization.Source.defectWithinBudget,
    canonicalCrystallizationChannel,
    canonicalCrystallineReservoir,
    canonicalCrystallineTarget,
    canonicalCrystallineDefects]

theorem canonicalCrystallineHardRegime :
    Technology.Materialization.Source.crystallineHardMaterialization canonicalCrystallineRegime := by
  simp [Technology.Materialization.Source.crystallineHardMaterialization, canonicalCrystallineRegime]

theorem canonicalCrystallineOrderPassesThreshold :
    Technology.Materialization.Source.orderScorePassesThreshold canonicalCrystallineOrderScore := by
  simp [Technology.Materialization.Source.orderScorePassesThreshold,
    Technology.Materialization.Source.crystallineOrderScoreAdmissible,
    canonicalCrystallineOrderScore]
  constructor
  · constructor <;> native_decide
  · native_decide

theorem canonicalCrystallinePersistence_holds :
    Technology.Materialization.Source.postControlPersistenceHolds
      canonicalCrystallinePersistenceCriterion 3 0 := by
  simp [Technology.Materialization.Source.postControlPersistenceHolds,
    Technology.Materialization.Source.postControlPersistenceCriterionAdmissible,
    canonicalCrystallinePersistenceCriterion]
  constructor
  · constructor <;> native_decide
  · constructor <;> native_decide

theorem canonicalSeededHardMaterializationWitness_admissible :
    Technology.Materialization.Source.seededHardMaterializationV1Admissible
      canonicalSeededHardMaterializationWitness := by
  simp [Technology.Materialization.Source.seededHardMaterializationV1Admissible,
    canonicalSeededHardMaterializationWitness]
  native_decide

end PhysicsLean
