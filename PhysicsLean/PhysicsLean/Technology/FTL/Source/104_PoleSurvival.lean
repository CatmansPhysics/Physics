import PhysicsLean.Technology.FTL.Source.«103_ProjectedResolventPole»

namespace PhysicsLean
namespace Technology.FTL.Source

def projectedPoleGap (family : ExplicitHardCarrierFamily) : Rat :=
  branchGapProxy family

def luminalProjectedResidueNumerator (family : ExplicitHardCarrierFamily) : Rat :=
  family.carrierOffset + family.switchCoupling

def projectedPoleIsSimple (family : ExplicitHardCarrierFamily) : Prop :=
  0 < projectedPoleGap family

def projectedPoleResidueNonzero (family : ExplicitHardCarrierFamily) : Prop :=
  luminalProjectedResidueNumerator family != 0

def selectedPoleSurvives (family : ExplicitHardCarrierFamily) : Prop :=
  projectedPoleIsSimple family ∧ projectedPoleResidueNonzero family

structure PoleSurvivalWrapper where
  family : ExplicitHardCarrierFamily
  transportWindow : String
  selectedBranch : String
  survives : Prop

def explicitPoleSurvivalWrapper (family : ExplicitHardCarrierFamily) : PoleSurvivalWrapper :=
  { family := family
    transportWindow := "avoided-crossing transport window"
    selectedBranch := "adiabatically followed transported pole"
    survives := selectedPoleSurvives family }

def defaultPoleSurvivalWitness : Prop :=
  selectedPoleSurvives defaultExplicitHardCarrierFamily

end Technology.FTL.Source
end PhysicsLean
