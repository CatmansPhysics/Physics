import PhysicsLean.Technology.AGT.Source.«111_ToyV11WallBubbleKernel»

namespace PhysicsLean
namespace Technology.AGT.Source

inductive RunFamily
  | wallOnly
  | wallWithField
  | bubbleOnly
  | bubbleWithField
  deriving DecidableEq, Repr

structure WallBubbleProbe where
  sector : ToySector
  startPosition : Rat
  startMomentum : Rat
  deriving Repr

structure WallBubbleObservable where
  reflectionCoefficient : Rat
  transmissionCoefficient : Rat
  captureCoefficient : Rat
  trappingTime : Rat
  deriving Repr

def reflectionExpected (incomingEnergy stepHeight : Rat) : Prop :=
  incomingEnergy < |stepHeight|

def transmissionExpected (incomingEnergy stepHeight : Rat) : Prop :=
  |stepHeight| < incomingEnergy

def runFamilies : List RunFamily :=
  [RunFamily.wallOnly, RunFamily.wallWithField, RunFamily.bubbleOnly, RunFamily.bubbleWithField]

structure WallBubbleSuccessWindow where
  sectorSelectiveReflection : Prop
  sectorSelectiveCapture : Prop
  robustUnderPerturbation : Prop

def minimalSuccessWindow (window : WallBubbleSuccessWindow) : Prop :=
  window.sectorSelectiveReflection ∧ window.sectorSelectiveCapture ∧ window.robustUnderPerturbation

theorem runFamilies_length : runFamilies.length = 4 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
