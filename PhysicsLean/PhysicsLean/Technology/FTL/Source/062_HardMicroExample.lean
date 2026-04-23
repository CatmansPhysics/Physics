import PhysicsLean.Technology.FTL.Source.«042_HardProtocolCore»
import PhysicsLean.Technology.FTL.Source.«052_HardRecipe»
import PhysicsLean.Technology.FTL.Source.«060_ToyWorkedExamples»

namespace PhysicsLean
namespace Technology.FTL.Source

def hardMicroParams : HardToyParameters :=
  { mass := 1
    coneSpeed := 1
    carrierSlope := 9 / 5
    carrierOffset := 1 / 5
    switchCoupling := 1 / 20
    identityLoss := 3 / 250
    bindingMargin := 2 / 5 }

def hardMicroSpeedRatio : Rat :=
  carrierSpeedRatio hardMicroParams

def hardMicroAdiabatic : Rat :=
  adiabaticScore (1 / 1000) (3 / 5)

def hardMicroWorks : Prop :=
  hardCheckpoint hardMicroSpeedRatio hardMicroAdiabatic hardMicroParams.identityLoss hardMicroParams.bindingMargin

end Technology.FTL.Source
end PhysicsLean
