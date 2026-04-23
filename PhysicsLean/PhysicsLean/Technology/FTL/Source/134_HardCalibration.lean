import PhysicsLean.Technology.FTL.Source.«133_SoftCalibration»
import PhysicsLean.Technology.FTL.Source.«121_OpenAdmissibleHardClass»

namespace PhysicsLean
namespace Technology.FTL.Source

structure HardCalibrationData where
  couplingScale : Rat
  adiabaticBudget : Rat
  gapMin : Rat
  velocityMargin : Rat
  residueMargin : Rat
  onePoleLossBudget : Rat
  bindingMargin : Rat
  compositeLossBudget : Rat
  deriving Repr

def hardSwitchingTimeLowerBound (data : HardCalibrationData) : Rat :=
  if data.adiabaticBudget = 0 ∨ data.gapMin = 0 then 0
  else data.couplingScale / (data.adiabaticBudget * data.gapMin * data.gapMin)

def hardCalibrationRegionNonempty (data : HardCalibrationData) : Prop :=
  0 < data.velocityMargin ∧ 0 < data.residueMargin ∧ 0 < data.bindingMargin ∧
    data.onePoleLossBudget < 1 / 10 ∧ data.compositeLossBudget < 1 / 10

def defaultHardCalibrationData : HardCalibrationData :=
  { couplingScale := 1 / 20
    adiabaticBudget := 1 / 100
    gapMin := 1 / 2
    velocityMargin := 1 / 4
    residueMargin := 1 / 5
    onePoleLossBudget := 1 / 20
    bindingMargin := 1 / 5
    compositeLossBudget := 1 / 20 }

end Technology.FTL.Source
end PhysicsLean
