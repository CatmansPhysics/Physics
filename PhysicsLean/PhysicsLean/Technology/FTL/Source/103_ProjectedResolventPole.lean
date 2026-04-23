import PhysicsLean.Technology.FTL.Source.«102_ExplicitHardCarrierFamily»

namespace PhysicsLean
namespace Technology.FTL.Source

structure ThreeResolventArchitecture where
  microscopicLayer : String
  sectorLayer : String
  physicalLayer : String
  deriving Repr

def defaultThreeResolventArchitecture : ThreeResolventArchitecture :=
  { microscopicLayer := "microscopic resolvent"
    sectorLayer := "sector-resolved block"
    physicalLayer := "physical observer block" }

structure ProjectedPhysicalResolventBlock where
  transportedSector : String
  selectedEnergy : Rat
  residueWeight : Rat
  regularWindow : String
  deriving Repr

def hasProjectedSimplePole (block : ProjectedPhysicalResolventBlock) : Prop :=
  0 < block.residueWeight

def hardCarrierWindow (family : ExplicitHardCarrierFamily) : Prop :=
  explicitHardCarrierWindow family

def hardObservabilityCriterion
    (family : ExplicitHardCarrierFamily)
    (block : ProjectedPhysicalResolventBlock)
    (identityLoss adiabaticScoreBound : Rat) : Prop :=
  hardCarrierWindow family ∧
    hasProjectedSimplePole block ∧
    adiabaticScoreBound < 1 / 10 ∧
    identityLoss < 1 / 10

def projectedPoleProxy
    (family : ExplicitHardCarrierFamily)
    (block : ProjectedPhysicalResolventBlock)
    (identityLoss adiabaticScoreBound : Rat) : Prop :=
  hardObservabilityCriterion family block identityLoss adiabaticScoreBound

inductive HardObservabilityFailureMode
  | emptyCarrierWindow
  | missingProjectedPole
  | adiabaticBreakdown
  | cycleIdentityLoss
  deriving DecidableEq, Repr

def defaultProjectedPhysicalBlock : ProjectedPhysicalResolventBlock :=
  { transportedSector := "one-pole transported sector"
    selectedEnergy := defaultExplicitHardCarrierFamily.carrierSpeed
    residueWeight := 3 / 5
    regularWindow := "adiabatic transport window" }

def defaultHardObservabilityWitness : Prop :=
  hardObservabilityCriterion defaultExplicitHardCarrierFamily defaultProjectedPhysicalBlock
    (3 / 250) (1 / 1000)

end Technology.FTL.Source
end PhysicsLean
