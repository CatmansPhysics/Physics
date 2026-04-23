import PhysicsLean.Technology.FTL.Source.«100_HardCarrierCandidates»

namespace PhysicsLean
namespace Technology.FTL.Source

structure BranchTransferHardCarrier where
  luminalBranchSpeed : Rat
  carrierBranchSpeed : Rat
  switchingAmplitude : Rat
  identityBudget : Rat
  deriving Repr

def superluminalCarrierWindow (carrier : BranchTransferHardCarrier) : Prop :=
  carrier.luminalBranchSpeed < carrier.carrierBranchSpeed

def adiabaticSwitchingAccessible (carrier : BranchTransferHardCarrier) (switchRate branchGap : Rat) : Prop :=
  adiabaticScore (switchRate * carrier.switchingAmplitude) branchGap < 1

def identityControlled (carrier : BranchTransferHardCarrier) : Prop :=
  carrier.identityBudget < 1 / 10

structure OnePoleTransportProblem where
  carrier : BranchTransferHardCarrier
  branchGap : Rat
  switchRate : Rat
  deriving Repr

def validOnePoleTransportProblem (problem : OnePoleTransportProblem) : Prop :=
  superluminalCarrierWindow problem.carrier ∧
    adiabaticSwitchingAccessible problem.carrier problem.switchRate problem.branchGap ∧
    identityControlled problem.carrier

end Technology.FTL.Source
end PhysicsLean
