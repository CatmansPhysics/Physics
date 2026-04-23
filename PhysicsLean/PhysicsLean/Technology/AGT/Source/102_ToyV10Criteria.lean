import PhysicsLean.Technology.AGT.Source.«101_ToyV10OnShellBranch»

namespace PhysicsLean
namespace Technology.AGT.Source

structure ToyCriterion where
  code : String
  statement : String
  deriving Repr

def toyV10Criteria : List ToyCriterion :=
  [ { code := "C1"
      statement := "Positive, negative, and neutral sectors have spectral charges with signs +, -, and 0 respectively." }
  , { code := "C2"
      statement := "The sign of spectral grav-charge matches the sign of microscopic grav-charge." }
  , { code := "C3"
      statement := "Neutral sectors suppress the leading monopole response." }
  , { code := "C4"
      statement := "Opposite-sign probes move in opposite directions in one and the same grav-potential background." }
  , { code := "C5"
      statement := "There is a crossover between a free charged regime and a neutralizing screened regime." } ]

structure ToyIndicator where
  repulsionIndex : Rat
  screeningIndex : Rat
  deriving Repr

def passesRepulsionCriterion (indicator : ToyIndicator) : Prop :=
  indicator.repulsionIndex != 0

def passesScreeningCriterion (indicator : ToyIndicator) : Prop :=
  indicator.screeningIndex < 1

theorem toyV10Criteria_length : toyV10Criteria.length = 5 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
