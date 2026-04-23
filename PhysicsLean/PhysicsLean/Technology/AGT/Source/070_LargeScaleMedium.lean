import PhysicsLean.Technology.AGT.Source.«062_MarkedMomentDictionary»

namespace PhysicsLean
namespace Technology.AGT.Source

structure CosmologicalMedium where
  rhoPlus : Rat
  rhoMinus : Rat
  rhoNeutral : Rat
  wallDensity : Rat
  bubbleDensity : Rat
  deriving Repr

def totalDensity (medium : CosmologicalMedium) : Rat :=
  medium.rhoPlus + medium.rhoMinus + medium.rhoNeutral

def cosmologicalPolarization (medium : CosmologicalMedium) : Rat :=
  medium.rhoPlus - medium.rhoMinus

def neutralFraction (medium : CosmologicalMedium) : Rat :=
  medium.rhoNeutral / (totalDensity medium + 1)

inductive LargeScaleRegime
  | polarizedBulk
  | screenedNeutral
  | repulsiveVoid
  | wallDominated
  | bubblePercolating
  deriving DecidableEq, Repr

def classifyLargeScaleRegime (medium : CosmologicalMedium) : LargeScaleRegime :=
  if medium.bubbleDensity > 0 then
    LargeScaleRegime.bubblePercolating
  else if medium.wallDensity > 0 then
    LargeScaleRegime.wallDominated
  else if cosmologicalPolarization medium = 0 then
    if neutralFraction medium > 0 then LargeScaleRegime.screenedNeutral else LargeScaleRegime.repulsiveVoid
  else
    LargeScaleRegime.polarizedBulk

end Technology.AGT.Source
end PhysicsLean
