import PhysicsLean.Technology.Materialization.Source.«077_TemplateFirstReduction»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure RepairOrientedStrategy where
  repairModes : List String
  repairableDefectClasses : Nat
  rawPrecisionPenalty : Nat
  deriving Repr

def repairOrientedStrategyAdmissible (strategy : RepairOrientedStrategy) : Prop :=
  0 < strategy.repairModes.length ∧ strategy.rawPrecisionPenalty <= strategy.repairableDefectClasses

def repairabilityCanDominateRawPrecision (strategy : RepairOrientedStrategy) : Prop :=
  repairOrientedStrategyAdmissible strategy

end Technology.Materialization.Source
end PhysicsLean
