import PhysicsLean.Technology.Materialization.Source.«159_EffectiveCrystallineFunctional»
import PhysicsLean.Technology.Materialization.Source.«157_LocalCompatibility»
import PhysicsLean.Technology.Materialization.Source.«156_ReservoirSufficiency»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure CalibrationProtocol where
  positiveFamilyLabels : List String
  negativeFamilyLabels : List String
  marginGood : Rat
  marginBad : Rat
  deriving Repr

def calibrationProtocolAdmissible (protocol : CalibrationProtocol) : Prop :=
  0 < protocol.positiveFamilyLabels.length ∧
    0 < protocol.negativeFamilyLabels.length ∧ protocol.marginGood <= protocol.marginBad

structure LowerCrystallineCalibrationWitness where
  reservoir : ReservoirSufficiency
  localCompatibility : LocalCompatibilityCriterion
  orderScore : CrystallineOrderScore
  persistence : PostControlPersistenceCriterion
  metastability : MetastabilityCriterion
  functional : EffectiveCrystallineFunctional
  completion : CompletionFunctional
  deriving Repr

def lowerCrystallineCalibrationWitnessAdmissible
    (witness : LowerCrystallineCalibrationWitness) : Prop :=
  reservoirSufficiencyCriterion witness.reservoir ∧
    localCompatibilityCriterionAdmissible witness.localCompatibility ∧
      orderScorePassesThreshold witness.orderScore ∧
        postControlPersistenceHolds witness.persistence
          witness.orderScore.calibratedThreshold witness.completion.defectPenalty ∧
          metastableOnWindow witness.metastability ∧
            crystallineZeroSet witness.functional ∧ 0 < completionFunctionalValue witness.completion

def calibratedLowerChain
    (protocol : CalibrationProtocol)
    (witness : LowerCrystallineCalibrationWitness) : Prop :=
  calibrationProtocolAdmissible protocol ∧ lowerCrystallineCalibrationWitnessAdmissible witness

theorem lowerChainSupportsSeededCompletion
    (witness : LowerCrystallineCalibrationWitness)
    (h : lowerCrystallineCalibrationWitnessAdmissible witness) :
    seededCompletion witness.localCompatibility.target witness.localCompatibility.history witness.completion := by
  rcases h with ⟨_, hLocal, _, _, _, _, hCompletion⟩
  exact seededCompletionOfLocalCompatibility witness.localCompatibility witness.completion hLocal hCompletion

end Technology.Materialization.Source
end PhysicsLean
