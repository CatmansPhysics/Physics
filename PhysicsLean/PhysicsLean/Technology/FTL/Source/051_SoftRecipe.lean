import PhysicsLean.Technology.FTL.Source.«050_ComputationalRecipe»

namespace PhysicsLean
namespace Technology.FTL.Source

structure SoftRecipeStep where
  step : String
  formula : String
  meaning : String
  deriving Repr

def softRecipe : List SoftRecipeStep :=
  [ { step := "Build reduced detector states"
      formula := "rho_D^(0)(t), rho_D^(1)(t)"
      meaning := "Prepare remote-conditioned local detector states." }
  , { step := "Measure imprint depth"
      formula := "mu_0"
      meaning := "Initial trace-distance contrast between remote-conditioned detector states." }
  , { step := "Measure classicalization rate"
      formula := "Gamma_dec"
      meaning := "Decay rate of off-diagonal detector coherences." }
  , { step := "Measure link decay rate"
      formula := "Gamma_link"
      meaning := "Decay rate of the readout bias carried by the shared sector." }
  , { step := "Check readout window"
      formula := "Gamma_dec^(-1) << t_* << Gamma_link^(-1)"
      meaning := "Verify that the detector classicalizes before the remote imprint disappears." } ]

def softFigureOfMerit (contrast error noise : Rat) : Rat :=
  if error + noise = 0 then 0 else contrast / (error + noise)

theorem softRecipe_length : softRecipe.length = 5 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
