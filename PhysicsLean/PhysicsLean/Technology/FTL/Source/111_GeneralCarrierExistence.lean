import PhysicsLean.Technology.FTL.Source.«110_HardRoadmap»

namespace PhysicsLean
namespace Technology.FTL.Source

structure CarrierDispersionData where
  timeCoeff : Rat
  spaceCoeff : Rat
  massCoeff : Rat
  deriving Repr

def effectiveConeRatio (data : CarrierDispersionData) : Rat :=
  if data.timeCoeff = 0 then 0 else data.spaceCoeff / data.timeCoeff

def carrierConeSpeedSquared (data : CarrierDispersionData) : Rat :=
  effectiveConeRatio data

def admissibleCarrierDispersion (data : CarrierDispersionData) : Prop :=
  0 < data.timeCoeff ∧ 0 < data.spaceCoeff

structure HardCarrierExistenceData where
  luminal : CarrierDispersionData
  candidate : CarrierDispersionData
  observerWindow : String
  deriving Repr

def weakCarrierExistenceCriterion (data : HardCarrierExistenceData) : Prop :=
  admissibleCarrierDispersion data.luminal ∧
    admissibleCarrierDispersion data.candidate ∧
    carrierConeSpeedSquared data.luminal < carrierConeSpeedSquared data.candidate

def strongCarrierExistenceCriterion
    (data : HardCarrierExistenceData)
    (margin : Rat) : Prop :=
  weakCarrierExistenceCriterion data ∧ 0 < margin

def defaultHardCarrierExistenceData : HardCarrierExistenceData :=
  { luminal := { timeCoeff := 1, spaceCoeff := 1, massCoeff := 0 }
    candidate := { timeCoeff := 1, spaceCoeff := 9 / 5, massCoeff := 1 }
    observerWindow := "shared transport window" }

end Technology.FTL.Source
end PhysicsLean
