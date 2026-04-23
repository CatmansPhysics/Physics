import PhysicsLean.Technology.FTL.Source.«118_OnShellBranchRetention»
import PhysicsLean.Technology.FTL.Source.«105_IdentityPreservation»

namespace PhysicsLean
namespace Technology.FTL.Source

structure OnePoleIdentityPackage where
  branchMismatch : Rat
  residueDrift : Rat
  observableDrift : Rat
  observerShadowDrift : Rat
  deriving Repr

def refinedOnePoleCycleLoss
    (weights : HardIdentityWeights)
    (pkg : OnePoleIdentityPackage) : Rat :=
  weights.stateWeight * pkg.branchMismatch +
    weights.residueWeight * pkg.residueDrift +
    weights.observableWeight * pkg.observableDrift +
    weights.observableWeight * pkg.observerShadowDrift

def generalOnePoleIdentityTheorem
    (weights : HardIdentityWeights)
    (pkg : OnePoleIdentityPackage)
    (kernel : ProjectedEffectiveKernelData) : Prop :=
  retainsTransportedOnShellBranch explicitHardObserverClass kernel ∧
    refinedOnePoleCycleLoss weights pkg < 1 / 10

def defaultOnePoleIdentityPackage : OnePoleIdentityPackage :=
  { branchMismatch := 1 / 200
    residueDrift := 1 / 200
    observableDrift := 1 / 200
    observerShadowDrift := 1 / 200 }

end Technology.FTL.Source
end PhysicsLean
