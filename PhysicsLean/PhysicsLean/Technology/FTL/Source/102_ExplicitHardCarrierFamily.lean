import PhysicsLean.Technology.FTL.Source.«101_BranchTransferHardCarrier»

namespace PhysicsLean
namespace Technology.FTL.Source

structure ExplicitHardCarrierFamily where
  mass : Rat
  coneSpeed : Rat
  carrierOffset : Rat
  carrierSpeed : Rat
  gapScale : Rat
  switchCoupling : Rat
  deriving Repr

def branchGapProxy (family : ExplicitHardCarrierFamily) : Rat :=
  family.gapScale + 2 * family.switchCoupling

def superluminalSpeedRatio (family : ExplicitHardCarrierFamily) : Rat :=
  if family.coneSpeed = 0 then 0 else family.carrierSpeed / family.coneSpeed

def explicitHardCarrierWindow (family : ExplicitHardCarrierFamily) : Prop :=
  1 < superluminalSpeedRatio family

def onePoleProxySurvives (family : ExplicitHardCarrierFamily) : Prop :=
  0 < branchGapProxy family

def explicitCycleIdentityProxy (identityLoss : Rat) : Prop :=
  identityLoss < 1 / 10

def defaultExplicitHardCarrierFamily : ExplicitHardCarrierFamily :=
  { mass := 1
    coneSpeed := 1
    carrierOffset := 1 / 5
    carrierSpeed := 9 / 5
    gapScale := 1 / 2
    switchCoupling := 1 / 20 }

def defaultOnePoleTransportProblem : OnePoleTransportProblem :=
  { carrier := { luminalBranchSpeed := defaultExplicitHardCarrierFamily.coneSpeed
                 carrierBranchSpeed := defaultExplicitHardCarrierFamily.carrierSpeed
                 switchingAmplitude := defaultExplicitHardCarrierFamily.switchCoupling
                 identityBudget := 3 / 250 }
    branchGap := branchGapProxy defaultExplicitHardCarrierFamily
    switchRate := 1 / 1000 }

def defaultOnePoleTransportCandidate : Prop :=
  explicitHardCarrierWindow defaultExplicitHardCarrierFamily ∧
    onePoleProxySurvives defaultExplicitHardCarrierFamily ∧
    validOnePoleTransportProblem defaultOnePoleTransportProblem

end Technology.FTL.Source
end PhysicsLean
