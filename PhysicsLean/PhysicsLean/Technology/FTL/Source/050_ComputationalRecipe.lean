import PhysicsLean.Technology.FTL.Source.«042_HardProtocolCore»

namespace PhysicsLean
namespace Technology.FTL.Source

structure ComputationalInput where
  observer : Observer
  kernelFamily : String
  referenceSector : ReferenceLuminalSector
  identityData : List String
  deriving Repr

structure ComputationalStep where
  step : String
  inputs : List String
  outputs : List String
  deriving Repr

def computationalRecipe : List ComputationalStep :=
  [ { step := "Choose observer window"
      inputs := ["spatial projection", "temporal slicing", "decategorification"]
      outputs := ["Observer"] }
  , { step := "Calibrate luminal reference"
      inputs := ["kernel branch data"]
      outputs := ["Reference cone speed"] }
  , { step := "Extract protocol parameters"
      inputs := ["reduced states or carrier branches"]
      outputs := ["soft parameters", "hard parameters"] }
  , { step := "Check operational inequalities"
      inputs := ["soft or hard parameters"]
      outputs := ["checkpoint status"] } ]

theorem computationalRecipe_length : computationalRecipe.length = 4 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
