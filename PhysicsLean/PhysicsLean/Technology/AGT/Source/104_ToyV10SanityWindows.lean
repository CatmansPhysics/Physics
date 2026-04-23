import PhysicsLean.Technology.AGT.Source.«103_ToyV10Protocol»

namespace PhysicsLean
namespace Technology.AGT.Source

structure SanityWindow where
  qMax : Rat
  deltaBMin : Rat
  deltaBMax : Rat
  betaMin : Rat
  betaMax : Rat
  gammaGMin : Rat
  gammaGMax : Rat
  deltaTMin : Rat
  deltaTMax : Rat
  deriving Repr

def safeWindowW1 : SanityWindow :=
  { qMax := 2 / 5
    deltaBMin := -4 / 5
    deltaBMax := 4 / 5
    betaMin := 3 / 100
    betaMax := 3 / 25
    gammaGMin := 1 / 2
    gammaGMax := 2
    deltaTMin := 1 / 50
    deltaTMax := 1 / 20 }

def inSafeWindow (window : SanityWindow) (qMax deltaB beta gammaG deltaT : Rat) : Prop :=
  qMax <= window.qMax ∧
    window.deltaBMin <= deltaB ∧ deltaB <= window.deltaBMax ∧
    window.betaMin <= beta ∧ beta <= window.betaMax ∧
    window.gammaGMin <= gammaG ∧ gammaG <= window.gammaGMax ∧
    window.deltaTMin <= deltaT ∧ deltaT <= window.deltaTMax

structure SanityDecision where
  name : String
  condition : String
  action : String
  deriving Repr

def toyDecisionTree : List SanityDecision :=
  [ { name := "D1"
      condition := "Sign theorem and sign-sensitive motion both pass"
      action := "Accept Toy Model v1.0 at the minimum viable level" }
  , { name := "D2"
      condition := "Sign theorem passes but screening is absent"
      action := "Retune neutralization parameters before redesigning the kernel" }
  , { name := "D3"
      condition := "Screening appears but sign compatibility fails"
      action := "Redesign the sector kernel rather than the field layer" }
  , { name := "D4"
      condition := "All qualitative tests pass but trajectories are unstable"
      action := "Reduce time step or source amplitude" } ]

end Technology.AGT.Source
end PhysicsLean
