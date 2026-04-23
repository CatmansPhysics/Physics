import PhysicsLean.Technology.FTL.Source.«119_GeneralOnePoleIdentity»
import PhysicsLean.Technology.FTL.Source.«106_BindingStability»

namespace PhysicsLean
namespace Technology.FTL.Source

structure CompositeIdentityPackage where
  residueDrift : Rat
  observableDrift : Rat
  bindingDrift : Rat
  deriving Repr

def compositeCycleIdentityLoss (pkg : CompositeIdentityPackage) : Rat :=
  pkg.residueDrift + pkg.observableDrift + pkg.bindingDrift

def generalCompositeBindingObservability
    (luminalSpeed : Rat)
    (branch : CompositeCarrierBranch)
    (pkg : CompositeIdentityPackage) : Prop :=
  firstCompositeHardCriterion luminalSpeed branch ∧
    compositeCycleIdentityLoss pkg < 1 / 10

def defaultCompositeIdentityPackage : CompositeIdentityPackage :=
  { residueDrift := 1 / 200
    observableDrift := 1 / 200
    bindingDrift := 1 / 200 }

end Technology.FTL.Source
end PhysicsLean
