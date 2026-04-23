import PhysicsLean.Technology.FTL.Source.«120_GeneralCompositeBindingObservability»
import PhysicsLean.Technology.FTL.Source.«108_HardRobustness»

namespace PhysicsLean
namespace Technology.FTL.Source

structure OpenAdmissibleHardClassData where
  onePoleMargins : OnePoleHardMargins
  onePoleLoad : OnePoleHardLoad
  compositeMargins : CompositeHardMargins
  compositeLoad : CompositeHardLoad
  deriving Repr

def liftsToOpenAdmissibleHardClass (data : OpenAdmissibleHardClassData) : Prop :=
  hardRobustnessWrapper data.onePoleMargins data.onePoleLoad
    data.compositeMargins data.compositeLoad

def defaultOpenAdmissibleHardClassData : OpenAdmissibleHardClassData :=
  { onePoleMargins := { velocityMargin := 1 / 2
                        gapMargin := 1 / 5
                        residueMargin := 1 / 5
                        identityMargin := 1 / 2 }
    onePoleLoad := { branchDrift := 1 / 100
                     residueDrift := 1 / 100
                     nonadiabaticLeakage := 1 / 100
                     identityDrift := 1 / 100 }
    compositeMargins := { bindingMargin := 1 / 5
                          residueMargin := 1 / 5
                          identityMargin := 1 / 2 }
    compositeLoad := { bindingDrift := 1 / 100
                       residueDrift := 1 / 100
                       leakage := 1 / 100
                       identityDrift := 1 / 100 } }

def hardClosureStatement : Prop :=
  strongHC1CarrierClass ∧
    physicalProjectedPole defaultSectorResolvedPoleData defaultProjectedPhysicalBlock ∧
    generalOnePoleIdentityTheorem defaultHardIdentityWeights defaultOnePoleIdentityPackage
      defaultProjectedEffectiveKernelData ∧
    generalCompositeBindingObservability 1
      (explicitCompositeCarrierBranch defaultTwoConstituentHardCarrierModel 0)
      defaultCompositeIdentityPackage ∧
    liftsToOpenAdmissibleHardClass defaultOpenAdmissibleHardClassData

end Technology.FTL.Source
end PhysicsLean
