import PhysicsLean.Technology.FTL.Source.«050_ComputationalRecipe»

namespace PhysicsLean
namespace Technology.FTL.Source

structure HardRecipeStep where
  step : String
  formula : String
  meaning : String
  deriving Repr

def hardRecipe : List HardRecipeStep :=
  [ { step := "Calibrate luminal cone"
      formula := "c_L"
      meaning := "Extract the reference cone speed from the luminal branch." }
  , { step := "Measure carrier slope"
      formula := "s_*"
      meaning := "Compute the maximal carrier speed relative to the reference cone." }
  , { step := "Estimate switching strength"
      formula := "Delta"
      meaning := "Measure the coupling that transfers the object sector between branches." }
  , { step := "Check adiabaticity"
      formula := "A_max"
      meaning := "Verify that switching is slow relative to the branch gap." }
  , { step := "Audit identity and binding"
      formula := "epsilon_h, B_T"
      meaning := "Check identity preservation and composite binding in the carrier sector." } ]

def hardCheckpoint (speedRatio adiabatic identityLoss bindingMargin : Rat) : Prop :=
  1 < speedRatio ∧ adiabatic < 1 ∧ identityLoss < 1 / 10 ∧ 0 < bindingMargin

theorem hardRecipe_length : hardRecipe.length = 5 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
