import PhysicsLean.Technology.FTL.Source.«000_FilePreamble»

namespace PhysicsLean
namespace Technology.FTL.Source

inductive CandidateClass
  | sharedMemoryBridge
  | branchLockedComposite
  | topologicalSoftLink
  | informationBearingChemicalLink
  deriving DecidableEq, Repr

structure DesignCriteria where
  observerAccessible : Prop
  reducedStateNontrivial : Prop
  classicalReadout : Prop
  nonFactorizable : Prop
  auditedFailureModes : Prop

def minimalDesignCriteria (criteria : DesignCriteria) : Prop :=
  criteria.observerAccessible ∧ criteria.reducedStateNontrivial ∧ criteria.classicalReadout ∧
    criteria.nonFactorizable ∧ criteria.auditedFailureModes

structure CandidateSurveyEntry where
  candidate : CandidateClass
  code : String
  description : String
  maturityRank : Nat
  preferredFirstStep : Bool
  deriving Repr

def candidateSurvey : List CandidateSurveyEntry :=
  [ { candidate := CandidateClass.sharedMemoryBridge
      code := "I"
      description := "A shared-memory precursor where the local detector reads a persistent remote record through a common memory sector."
      maturityRank := 1
      preferredFirstStep := false }
  , { candidate := CandidateClass.branchLockedComposite
      code := "II"
      description := "A branch-locked composite sector where local readout depends on the remote coarse class through one non-factorizable branch structure."
      maturityRank := 2
      preferredFirstStep := true }
  , { candidate := CandidateClass.topologicalSoftLink
      code := "III"
      description := "A later topological or many-body soft link sector with a robust global label."
      maturityRank := 3
      preferredFirstStep := false }
  , { candidate := CandidateClass.informationBearingChemicalLink
      code := "IV"
      description := "A material or chemistry-like information-bearing link that is later than the branch-locked construction."
      maturityRank := 4
      preferredFirstStep := false } ]

def preferredCandidate : CandidateClass :=
  CandidateClass.branchLockedComposite

theorem candidateSurvey_length : candidateSurvey.length = 4 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
