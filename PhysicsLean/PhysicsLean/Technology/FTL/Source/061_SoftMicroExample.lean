import PhysicsLean.Technology.FTL.Source.«041_SoftProtocolCore»
import PhysicsLean.Technology.FTL.Source.«051_SoftRecipe»
import PhysicsLean.Technology.FTL.Source.«060_ToyWorkedExamples»

namespace PhysicsLean
namespace Technology.FTL.Source

def softMicroParams : SoftToyParameters :=
  { mu0 := 3 / 10
    gammaDec := 5
    gammaLink := 1 / 5
    sampleCount := 400
    confidenceFactor := 2 }

def softMicroTime : Rat :=
  1

def softMicroContrast : Rat :=
  softReadoutContrast softMicroParams softMicroTime

def softMicroError : Rat :=
  classicalizationError softMicroParams softMicroTime

def softMicroFigure : Rat :=
  softFigureOfMerit softMicroContrast softMicroError (statisticalThreshold softMicroParams)

def softMicroWorks : Prop :=
  softReadoutWindow softMicroParams softMicroTime

end Technology.FTL.Source
end PhysicsLean
