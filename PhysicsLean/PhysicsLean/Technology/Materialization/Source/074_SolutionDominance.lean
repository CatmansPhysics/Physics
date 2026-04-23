import PhysicsLean.Technology.Materialization.Source.«073_SpecificationStrata»

namespace PhysicsLean
namespace Technology.Materialization.Source

def architectureRank : FabricatorClass → Nat
  | .passive => 0
  | .external => 1
  | .templated => 2
  | .reactive => 3
  | .predictive => 4
  | .selfMonitoring => 5

structure RealizerScore where
  completion : Rat
  usability : Rat
  persistence : Rat
  defectMargin : Rat
  totalCost : Rat
  architecture : FabricatorClass
  deriving Repr

def solutionDominates (left right : RealizerScore) : Prop :=
  left.completion >= right.completion ∧
    left.usability >= right.usability ∧
      left.persistence >= right.persistence ∧
        left.defectMargin >= right.defectMargin ∧
          left.totalCost <= right.totalCost ∧
            architectureRank left.architecture <= architectureRank right.architecture

def paretoRealizer (score : RealizerScore) (others : List RealizerScore) : Prop :=
  ∀ other, other ∈ others → ¬ solutionDominates other score

def minimalArchitectureRealizer (fabricatorClass : FabricatorClass) (required : FabricatorClass) : Prop :=
  architectureRank fabricatorClass <= architectureRank required

end Technology.Materialization.Source
end PhysicsLean
