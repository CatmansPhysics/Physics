import PhysicsLean.Technology.FTL.Source.«113_NonemptyKernelClass»

namespace PhysicsLean
namespace Technology.FTL.Source

def desynchronizationMargin
    (luminal candidate : CarrierDispersionData) : Rat :=
  effectiveConeRatio candidate - effectiveConeRatio luminal

structure AdmissibleCoefficientPerturbation where
  luminalTimeDelta : Rat
  luminalSpaceDelta : Rat
  candidateTimeDelta : Rat
  candidateSpaceDelta : Rat
  deriving Repr

def applyPerturbation
    (data : HardCarrierExistenceData)
    (delta : AdmissibleCoefficientPerturbation) : HardCarrierExistenceData :=
  { luminal := { timeCoeff := data.luminal.timeCoeff + delta.luminalTimeDelta
                 spaceCoeff := data.luminal.spaceCoeff + delta.luminalSpaceDelta
                 massCoeff := data.luminal.massCoeff }
    candidate := { timeCoeff := data.candidate.timeCoeff + delta.candidateTimeDelta
                   spaceCoeff := data.candidate.spaceCoeff + delta.candidateSpaceDelta
                   massCoeff := data.candidate.massCoeff }
    observerWindow := data.observerWindow }

def strongDesynchronizationOpen
    (data : HardCarrierExistenceData)
    (margin : Rat) : Prop :=
  strongCarrierExistenceCriterion data margin

def strongHC1CarrierClass : Prop :=
  kernelClassHasHardCandidate ∧
    strongDesynchronizationOpen defaultHardCarrierExistenceData (4 / 5)

end Technology.FTL.Source
end PhysicsLean
