import PhysicsLean.Technology.FTL.Source.«083_ClosureOrder»

namespace PhysicsLean
namespace Technology.FTL.Source

structure SoftSectorConstruction where
  candidate : CandidateClass
  usesReducedStateLayer : Bool
  supportsClassicalReadout : Bool
  requiresLateManyBodyLayer : Bool
  mainLinePriority : Nat
  deriving Repr

def secondPassCandidateConstructions : List SoftSectorConstruction :=
  [ { candidate := CandidateClass.sharedMemoryBridge
      usesReducedStateLayer := true
      supportsClassicalReadout := true
      requiresLateManyBodyLayer := false
      mainLinePriority := 2 }
  , { candidate := CandidateClass.branchLockedComposite
      usesReducedStateLayer := true
      supportsClassicalReadout := true
      requiresLateManyBodyLayer := false
      mainLinePriority := 1 }
  , { candidate := CandidateClass.topologicalSoftLink
      usesReducedStateLayer := false
      supportsClassicalReadout := true
      requiresLateManyBodyLayer := true
      mainLinePriority := 3 }
  , { candidate := CandidateClass.informationBearingChemicalLink
      usesReducedStateLayer := false
      supportsClassicalReadout := true
      requiresLateManyBodyLayer := true
      mainLinePriority := 4 } ]

def nonFactorizableSoftSectorPreferred (construction : SoftSectorConstruction) : Prop :=
  construction.candidate = CandidateClass.branchLockedComposite ∧
    construction.usesReducedStateLayer ∧ construction.supportsClassicalReadout ∧
    ¬ construction.requiresLateManyBodyLayer

structure SoftSectorRestatement where
  packageCode : String
  target : String
  controlMode : String
  deriving Repr

def secondPassSoftPackages : List SoftSectorRestatement :=
  [ { packageCode := "Package-I"
      target := "Shared-memory precursor with persistent remote record readout."
      controlMode := "Baseline control construction" }
  , { packageCode := "Package-II"
      target := "Branch-locked composite sector with a first binary witness theorem."
      controlMode := "Preferred main-line soft package" }
  , { packageCode := "Package-III"
      target := "Topological soft link with robustness at late many-body scale."
      controlMode := "Deferred stronger construction" } ]

theorem secondPassCandidateConstructions_length : secondPassCandidateConstructions.length = 4 := by
  rfl

theorem secondPassSoftPackages_length : secondPassSoftPackages.length = 3 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
