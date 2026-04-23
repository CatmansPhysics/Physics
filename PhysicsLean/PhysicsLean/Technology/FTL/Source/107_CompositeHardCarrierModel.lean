import PhysicsLean.Technology.FTL.Source.«106_BindingStability»

namespace PhysicsLean
namespace Technology.FTL.Source

structure TwoConstituentHardCarrierModel where
  energyOffset : Rat
  carrierSpeed : Rat
  bindingGain : Rat
  width : Rat
  deriving Repr

def compositeSeparationThreshold (model : TwoConstituentHardCarrierModel) (totalMomentum : Rat) : Rat :=
  2 * model.energyOffset + model.carrierSpeed * totalMomentum

def compositeCarrierEnergy (model : TwoConstituentHardCarrierModel) (totalMomentum : Rat) : Rat :=
  compositeSeparationThreshold model totalMomentum - model.bindingGain

def explicitCompositeCarrierBranch
    (model : TwoConstituentHardCarrierModel)
    (totalMomentum : Rat) : CompositeCarrierBranch :=
  { separationEnergy := compositeSeparationThreshold model totalMomentum
    branchEnergy := compositeCarrierEnergy model totalMomentum
    compositeSpeed := model.carrierSpeed
    residueWeight := 1
    width := model.width }

def defaultTwoConstituentHardCarrierModel : TwoConstituentHardCarrierModel :=
  { energyOffset := 1
    carrierSpeed := 9 / 5
    bindingGain := 1 / 5
    width := 0 }

def firstExplicitBoundTransportExample (totalMomentum luminalSpeed : Rat) : Prop :=
  let branch := explicitCompositeCarrierBranch defaultTwoConstituentHardCarrierModel totalMomentum
  firstCompositeHardCriterion luminalSpeed branch

end Technology.FTL.Source
end PhysicsLean
