import PhysicsLean.Technology.FTL.Source.«093_FiniteStateAutomaton»

namespace PhysicsLean
namespace Technology.FTL.Source

structure FiniteAlphabetScanner where
  alphabet : List String
  epsilon : Rat
  deriving Repr

def scannerDenominator (scanner : FiniteAlphabetScanner) : Rat :=
  (1 + scanner.epsilon) ^ 2 + (((scanner.alphabet.length : Rat) - 1) * (1 - scanner.epsilon) ^ 2)

def scannerPairwiseContrast (scanner : FiniteAlphabetScanner) : Rat :=
  if scannerDenominator scanner = 0 then 0 else 4 * scanner.epsilon / scannerDenominator scanner

def scannerInjective (scanner : FiniteAlphabetScanner) : Prop :=
  0 < scannerPairwiseContrast scanner

def defaultFiniteScanner : FiniteAlphabetScanner :=
  { alphabet := ["1", "2", "3"]
    epsilon := 1 / 5 }

end Technology.FTL.Source
end PhysicsLean
