import PhysicsLean.Technology.FTL.Source.«108_HardRobustness»

namespace PhysicsLean
namespace Technology.FTL.Source

inductive HardClosureTarget
  | carrierExistence
  | physicalProjectedPole
  | onePoleIdentity
  | compositeBindingObservability
  | openAdmissibleHardClass
  deriving DecidableEq, Repr

structure HardTargetDescriptor where
  target : HardClosureTarget
  code : String
  description : String
  dependsOn : List String
  deriving Repr

def hardRemainingTargets : List HardTargetDescriptor :=
  [ { target := HardClosureTarget.carrierExistence
      code := "H-C1"
      description := "General hard-carrier existence theorem for a nonempty desynchronized class."
      dependsOn := [] }
  , { target := HardClosureTarget.physicalProjectedPole
      code := "H-C2"
      description := "Lift from sector-resolved transported poles to physical projected poles."
      dependsOn := ["H-C1"] }
  , { target := HardClosureTarget.onePoleIdentity
      code := "H-C3"
      description := "General identity-preservation theorem for the one-pole hard cycle."
      dependsOn := ["H-C1", "H-C2"] }
  , { target := HardClosureTarget.compositeBindingObservability
      code := "H-C4"
      description := "General composite binding and observability theorem for hard transport."
      dependsOn := ["H-C1", "H-C2", "H-C3"] }
  , { target := HardClosureTarget.openAdmissibleHardClass
      code := "H-C5"
      description := "Lift the explicit hard package to an open admissible class."
      dependsOn := ["H-C1", "H-C2", "H-C3", "H-C4"] } ]

def hardClosureOpenFrontier : List String :=
  hardRemainingTargets.map HardTargetDescriptor.code

def hardClosureReady
    (onePoleMargins : OnePoleHardMargins)
    (onePoleLoad : OnePoleHardLoad)
    (compositeMargins : CompositeHardMargins)
    (compositeLoad : CompositeHardLoad) : Prop :=
  hardRobustnessWrapper onePoleMargins onePoleLoad compositeMargins compositeLoad

end Technology.FTL.Source
end PhysicsLean
