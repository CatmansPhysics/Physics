import PhysicsLean.Technology.FTL.Source.«040_ObserverLuminalFramework»

namespace PhysicsLean
namespace Technology.FTL.Source

structure HardToyParameters where
  mass : Rat
  coneSpeed : Rat
  carrierSlope : Rat
  carrierOffset : Rat
  switchCoupling : Rat
  identityLoss : Rat
  bindingMargin : Rat
  deriving Repr

def carrierSpeedRatio (params : HardToyParameters) : Rat :=
  if params.coneSpeed = 0 then 0 else params.carrierSlope / params.coneSpeed

def hardSuperluminalWindow (params : HardToyParameters) : Prop :=
  1 < carrierSpeedRatio params

def adiabaticScore (switchRate branchGap : Rat) : Rat :=
  if branchGap = 0 then 0 else switchRate / (branchGap * branchGap)

def hardIdentityPreserved (params : HardToyParameters) : Prop :=
  params.identityLoss < 1 / 10

def compositeHardAdmissible (params : HardToyParameters) : Prop :=
  0 < params.bindingMargin

structure HardOperationalTarget where
  code : String
  statement : String
  deriving Repr

def hardOperationalTargets : List HardOperationalTarget :=
  [ { code := "Hard-0"
      statement := "A one-pole carrier sector supports superluminal transport if the carrier speed exceeds the reference cone and identity loss remains small." }
  , { code := "Hard-1"
      statement := "A composite carrier sector is admissible only if the binding margin remains positive during transport." } ]

theorem hardOperationalTargets_length : hardOperationalTargets.length = 2 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
