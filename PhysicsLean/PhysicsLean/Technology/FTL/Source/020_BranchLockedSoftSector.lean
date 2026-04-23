import PhysicsLean.Technology.FTL.SoftLink
import PhysicsLean.Technology.FTL.Source.«011_SoftCandidatePackages»

namespace PhysicsLean
namespace Technology.FTL.Source

structure DetectorRecord where
  label : String
  weight : Rat
  deriving Repr

structure BranchLockedState where
  remoteClass : String
  records : List DetectorRecord
  deriving Repr

def readoutWeight (state : BranchLockedState) (label : String) : Rat :=
  (state.records.filter fun record => record.label = label).foldl (fun acc record => acc + record.weight) 0

def binaryReadoutDistinguishable (left right : BranchLockedState) (label : String) : Prop :=
  readoutWeight left label != readoutWeight right label

def branchLockedCompositeSector (states : List BranchLockedState) : Prop :=
  0 < states.length

structure SoftWitnessProfile where
  stateZero : BranchLockedState
  stateOne : BranchLockedState
  preferredLabel : String
  deriving Repr

def hasBinaryWitness (profile : SoftWitnessProfile) : Prop :=
  binaryReadoutDistinguishable profile.stateZero profile.stateOne profile.preferredLabel

structure SharedMemoryPrecursor where
  memoryLabel : String
  remoteValue : String
  localRecord : String
  deriving Repr

def precursorReadout (precursor : SharedMemoryPrecursor) : String :=
  precursor.localRecord ++ ":" ++ precursor.remoteValue

end Technology.FTL.Source
end PhysicsLean
