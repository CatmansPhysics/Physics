import PhysicsLean.Technology.FTL.Source.«010_CandidateSurvey»

namespace PhysicsLean
namespace Technology.FTL.Source

structure CandidatePackage where
  candidate : CandidateClass
  theoremCode : String
  target : String
  deliverables : List String
  deriving Repr

def softCandidatePackages : List CandidatePackage :=
  [ { candidate := CandidateClass.sharedMemoryBridge
      theoremCode := "Package-I"
      target := "Persistent remote record readout from a shared memory sector."
      deliverables := ["shared-memory sector", "two-step readout map", "local detector summary"] }
  , { candidate := CandidateClass.branchLockedComposite
      theoremCode := "Package-II"
      target := "A branch-locked soft witness theorem with binary remote distinguishability."
      deliverables := ["precise sector definition", "binary witness family", "failure modes"] }
  , { candidate := CandidateClass.topologicalSoftLink
      theoremCode := "Package-III"
      target := "A topological robustness theorem for a non-factorizable soft sector."
      deliverables := ["global label", "local windows", "robustness audit"] }
  , { candidate := CandidateClass.informationBearingChemicalLink
      theoremCode := "Package-IV"
      target := "A material realization bridge from soft link sectors to information-bearing structures."
      deliverables := ["material carrier sketch", "observer readout map", "material failure ledger"] } ]

structure PackageSelection where
  firstCandidate : CandidateClass
  controlCandidate : CandidateClass
  laterCandidates : List CandidateClass
  deriving Repr

def candidateSelection : PackageSelection :=
  { firstCandidate := CandidateClass.branchLockedComposite
    controlCandidate := CandidateClass.sharedMemoryBridge
    laterCandidates := [CandidateClass.topologicalSoftLink, CandidateClass.informationBearingChemicalLink] }

theorem softCandidatePackages_length : softCandidatePackages.length = 4 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
