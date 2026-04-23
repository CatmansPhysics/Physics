import PhysicsLean.Technology.Materialization.Source.«108_DeviceFailureModes»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure AdmissiblePerturbationClass where
  labels : List String
  preservesObservability : Bool
  nonDestructive : Bool
  deriving Repr

structure PerturbedDeviceState where
  stateLabels : List String
  perturbationLabel : String
  deriving Repr

def admissiblePerturbationClassAdmissible (perturbation : AdmissiblePerturbationClass) : Prop :=
  0 < perturbation.labels.length ∧ perturbation.preservesObservability = true ∧ perturbation.nonDestructive = true

def functionalAdmissibilityRegionUnderUse
    (device : SimpleCompositeDevice)
    (stateSpace : DeviceFunctionalStateSpace) : Prop :=
  functionalAdmissibilityRegion device stateSpace

end Technology.Materialization.Source
end PhysicsLean
