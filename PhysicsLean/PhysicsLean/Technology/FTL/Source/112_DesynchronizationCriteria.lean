import PhysicsLean.Technology.FTL.Source.«111_GeneralCarrierExistence»

namespace PhysicsLean
namespace Technology.FTL.Source

def coefficientRatioMismatch
    (luminal candidate : CarrierDispersionData) : Prop :=
  effectiveConeRatio luminal != effectiveConeRatio candidate

def minimallyDesynchronized
    (luminal candidate : CarrierDispersionData) : Prop :=
  admissibleCarrierDispersion luminal ∧
    admissibleCarrierDispersion candidate ∧
    coefficientRatioMismatch luminal candidate

def stronglyDesynchronized
    (luminal candidate : CarrierDispersionData) : Prop :=
  admissibleCarrierDispersion luminal ∧
    admissibleCarrierDispersion candidate ∧
    effectiveConeRatio luminal < effectiveConeRatio candidate

def candidateHardCarrierSector
    (luminal candidate : CarrierDispersionData) : Prop :=
  stronglyDesynchronized luminal candidate

end Technology.FTL.Source
end PhysicsLean
