import PhysicsLean.Technology.Materialization.Source.«033_CompletionFunctional»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure DefectAccumulation where
  cumulativeDefect : Rat
  timeElapsed : Rat
  deriving Repr

def boundedDefectAccumulation (budget : Rat) (acc : DefectAccumulation) : Prop :=
  acc.cumulativeDefect <= budget

end Technology.Materialization.Source
end PhysicsLean
