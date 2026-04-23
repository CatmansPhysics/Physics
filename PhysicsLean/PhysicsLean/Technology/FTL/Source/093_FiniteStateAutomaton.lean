import PhysicsLean.Technology.FTL.Source.«092_KernelGeneratedSoftFamily»

namespace PhysicsLean
namespace Technology.FTL.Source

structure SoftWitnessAutomaton where
  stateCodes : List String
  initialState : String
  terminalState : String
  branchCodes : List String
  deriving Repr

def minimalSoftWitnessAutomaton : SoftWitnessAutomaton :=
  { stateCodes := ["I", "T"]
    initialState := "I"
    terminalState := "T"
    branchCodes := ["e1", "e2"] }

structure AutomatonWitnessData where
  automaton : SoftWitnessAutomaton
  zeroState : KernelGeneratedSoftState
  oneState : KernelGeneratedSoftState
  deriving Repr

def finiteStateWitnessExists (data : AutomatonWitnessData) : Prop :=
  data.automaton.branchCodes.length = 2 ∧ 0 < kernelGeneratedWitnessContrast data.zeroState data.oneState

theorem minimalSoftWitnessAutomaton_branchCount : minimalSoftWitnessAutomaton.branchCodes.length = 2 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
