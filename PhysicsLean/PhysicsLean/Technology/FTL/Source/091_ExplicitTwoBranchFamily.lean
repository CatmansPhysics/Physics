import PhysicsLean.Technology.FTL.Source.«090_BranchLockedSoftSector»

namespace PhysicsLean
namespace Technology.FTL.Source

structure TwoBranchDetectorState where
  leftWeight : Rat
  rightWeight : Rat
  coherence : Rat
  deriving Repr

def diagonalWitnessContrast (left right : TwoBranchDetectorState) : Rat :=
  Rat.abs (left.leftWeight - right.leftWeight)

def coherenceWitnessContrast (left right : TwoBranchDetectorState) : Rat :=
  Rat.abs (left.coherence - right.coherence)

def fullWitnessContrast (left right : TwoBranchDetectorState) : Rat :=
  max (diagonalWitnessContrast left right) (coherenceWitnessContrast left right)

def explicitBinaryWitness (left right : TwoBranchDetectorState) : Prop :=
  0 < fullWitnessContrast left right

def explicitTwoBranchModelZero : TwoBranchDetectorState :=
  { leftWeight := 4 / 5, rightWeight := 1 / 5, coherence := 0 }

def explicitTwoBranchModelOne : TwoBranchDetectorState :=
  { leftWeight := 3 / 10, rightWeight := 7 / 10, coherence := 0 }

def explicitTwoBranchWitness : Prop :=
  explicitBinaryWitness explicitTwoBranchModelZero explicitTwoBranchModelOne

end Technology.FTL.Source
end PhysicsLean
