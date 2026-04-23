import PhysicsLean.Technology.FTL.Source.«105_IdentityPreservation»

namespace PhysicsLean
namespace Technology.FTL.Source

structure CompositeCarrierBranch where
  separationEnergy : Rat
  branchEnergy : Rat
  compositeSpeed : Rat
  residueWeight : Rat
  width : Rat
  deriving Repr

def carrierPhaseBindingMargin (branch : CompositeCarrierBranch) : Rat :=
  branch.separationEnergy - branch.branchEnergy

def isolatedCompositePole (branch : CompositeCarrierBranch) : Prop :=
  branch.width = 0

def narrowCompositeResonance (branch : CompositeCarrierBranch) : Prop :=
  branch.width < 1 / 10

def compositeCarrierPoleSurvives (branch : CompositeCarrierBranch) : Prop :=
  0 < branch.residueWeight ∧ (isolatedCompositePole branch ∨ narrowCompositeResonance branch)

def firstCompositeHardCriterion (luminalSpeed : Rat) (branch : CompositeCarrierBranch) : Prop :=
  0 < carrierPhaseBindingMargin branch ∧
    compositeCarrierPoleSurvives branch ∧
    luminalSpeed < branch.compositeSpeed

end Technology.FTL.Source
end PhysicsLean
