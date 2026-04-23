import PhysicsLean.Technology.FTL.Source.«020_BranchLockedSoftSector»

namespace PhysicsLean
namespace Technology.FTL.Source

structure ObserverWindow where
  observerCode : String
  luminalSpeed : Rat
  deriving Repr

inductive FTLMode
  | soft
  | hard
  deriving DecidableEq, Repr

def observerRelativeSpeed (distance duration : Rat) : Rat :=
  if duration = 0 then 0 else distance / duration

def superluminalStatus (window : ObserverWindow) (effectiveSpeed : Rat) : Prop :=
  window.luminalSpeed < effectiveSpeed

structure SuperluminalComparison where
  mode : FTLMode
  effectiveSpeed : Rat
  referenceSpeed : Rat
  derivation : String
  deriving Repr

def projectiveFTL (speedOne speedTwo referenceOne referenceTwo : Rat) : Prop :=
  referenceOne < speedOne ∧ speedTwo <= referenceTwo

def sectorRelativeFTL (transportSpeed luminalSpeed : Rat) : Prop :=
  luminalSpeed < transportSpeed

def admissibleFTL (causalOrderPreserved observerStable : Prop) : Prop :=
  causalOrderPreserved ∧ observerStable

end Technology.FTL.Source
end PhysicsLean
