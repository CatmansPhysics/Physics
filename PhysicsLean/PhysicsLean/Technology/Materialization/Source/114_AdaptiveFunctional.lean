import PhysicsLean.Technology.Materialization.Source.«113_BoundedCorrection»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure DeviceAdaptiveFunctional where
  viabilityScore : Rat
  usefulPredictiveInformation : Rat
  correctionCost : Rat
  deriving Repr

def adaptiveFunctionalValue (functional : DeviceAdaptiveFunctional) : Rat :=
  functional.viabilityScore + functional.usefulPredictiveInformation - functional.correctionCost

def adaptiveUpdateLaw (functional : DeviceAdaptiveFunctional) : Prop :=
  0 <= adaptiveFunctionalValue functional

end Technology.Materialization.Source
end PhysicsLean
