import PhysicsLean.Technology.Materialization.Source.«016_FailureModes»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure CrystallineTarget where
  latticeLabel : String
  cellCount : Nat
  deriving Repr

def crystallineTargetNonempty (target : CrystallineTarget) : Prop :=
  0 < target.cellCount

end Technology.Materialization.Source
end PhysicsLean
