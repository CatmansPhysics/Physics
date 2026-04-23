import PhysicsLean.Technology.FTL.Source.«097_HierarchicalSoftScanner»

namespace PhysicsLean
namespace Technology.FTL.Source

structure SoftRobustnessBudget where
  structuralLoad : Rat
  classicalizationLoad : Rat
  memoryLoad : Rat
  deriving Repr

def totalRobustnessLoad (budget : SoftRobustnessBudget) : Rat :=
  budget.structuralLoad + budget.classicalizationLoad + budget.memoryLoad

structure ScaleRobustness where
  minimalContrast : Rat
  budget : SoftRobustnessBudget
  deriving Repr

def scaleRobust (scale : ScaleRobustness) : Prop :=
  totalRobustnessLoad scale.budget < scale.minimalContrast

def allScalesRobust : List ScaleRobustness -> Prop
  | [] => True
  | scale :: rest => scaleRobust scale ∧ allScalesRobust rest

structure SoftClosureWitness where
  scales : List ScaleRobustness
  consistencyPreserved : Prop
  deriving Repr

def softClosure (witness : SoftClosureWitness) : Prop :=
  allScalesRobust witness.scales ∧ witness.consistencyPreserved

structure SoftClosureFailureMode where
  code : String
  statement : String
  deriving Repr

def softClosureFailureModes : List SoftClosureFailureMode :=
  [ { code := "SC-F1", statement := "Some hierarchical scale loses its positive contrast margin under the perturbation budget." }
  , { code := "SC-F2", statement := "Scale-wise labels remain readable but lose hierarchical consistency." }
  , { code := "SC-F3", statement := "Fine-scale memory persistence fails before readout completes." }
  , { code := "SC-F4", statement := "Attempted refinement beyond the available contrast budget destroys operational readability." }
  , { code := "SC-F5", statement := "Selective branch information exists, but unselective averaging destroys repeated operational use." } ]

theorem softClosureFailureModes_length : softClosureFailureModes.length = 5 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
