import PhysicsLean.Technology.FTL.Source.«084_NonFactorizableSoftSector»

namespace PhysicsLean
namespace Technology.FTL.Source

structure BranchLockedSoftState where
  remoteLabel : String
  detectorBasis : List String
  primaryWeight : Rat
  classicalReadable : Prop
  deriving Repr

def branchLockCompatible (left right : BranchLockedSoftState) : Prop :=
  left.detectorBasis = right.detectorBasis

def nontrivialReducedShadow (left right : BranchLockedSoftState) : Prop :=
  left.primaryWeight != right.primaryWeight

structure BinaryWitnessBundle where
  stateZero : BranchLockedSoftState
  stateOne : BranchLockedSoftState
  deriving Repr

def validBinaryWitnessBundle (bundle : BinaryWitnessBundle) : Prop :=
  branchLockCompatible bundle.stateZero bundle.stateOne ∧
    nontrivialReducedShadow bundle.stateZero bundle.stateOne ∧
    bundle.stateZero.classicalReadable ∧ bundle.stateOne.classicalReadable

structure BranchLockedFailureMode where
  code : String
  statement : String
  deriving Repr

def branchLockedFailureModes : List BranchLockedFailureMode :=
  [ { code := "BL-F1", statement := "All remote labels induce the same local reduced detector shadow." }
  , { code := "BL-F2", statement := "No stable shared detector basis persists across remote labels." }
  , { code := "BL-F3", statement := "Detector classicalization never reaches a readable regime." }
  , { code := "BL-F4", statement := "A re-encoding trivializes the local factor and destroys operational non-factorizability." }
  , { code := "BL-F5", statement := "A formal reduced-state distinction exists but remains below operational readout threshold." } ]

theorem branchLockedFailureModes_length : branchLockedFailureModes.length = 5 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
