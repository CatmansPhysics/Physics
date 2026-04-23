import PhysicsLean.Technology.FTL.Source.«132_PreEngineeringRoadmap»

namespace PhysicsLean
namespace Technology.FTL.Source

structure SoftCalibrationData where
  epsilon : Rat
  alphabetSize : Rat
  classicalizationConstant : Rat
  decoherenceRate : Rat
  detectorErrorBudget : Rat
  memoryErrorBudget : Rat
  statisticalErrorBudget : Rat
  deriving Repr

def softMinContrast (data : SoftCalibrationData) : Rat :=
  let numerator := 4 * data.epsilon
  let denominator :=
    (1 + data.epsilon) * (1 + data.epsilon) +
      (data.alphabetSize - 1) * (1 - data.epsilon) * (1 - data.epsilon)
  if denominator = 0 then 0 else numerator / denominator

def softReadoutTimeLowerBound (data : SoftCalibrationData) : Rat :=
  if data.decoherenceRate = 0 then 0
  else (1 / data.decoherenceRate) * (data.classicalizationConstant / data.detectorErrorBudget)

def softOperationalErrorLoad (data : SoftCalibrationData) : Rat :=
  data.detectorErrorBudget + data.memoryErrorBudget + data.statisticalErrorBudget

def softlyCalibratable (data : SoftCalibrationData) : Prop :=
  0 < softMinContrast data ∧ softOperationalErrorLoad data < softMinContrast data

def defaultSoftCalibrationData : SoftCalibrationData :=
  { epsilon := 1 / 5
    alphabetSize := 4
    classicalizationConstant := 1
    decoherenceRate := 2
    detectorErrorBudget := 1 / 20
    memoryErrorBudget := 1 / 20
    statisticalErrorBudget := 1 / 20 }

end Technology.FTL.Source
end PhysicsLean
