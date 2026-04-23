import PhysicsLean.Technology.Materialization.Source.«021_DefectCalculus»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure CrystallineReservoir where
  precursorLabels : List String
  energeticBudget : Rat
  deriving Repr

def crystallineReservoirReady (reservoir : CrystallineReservoir) : Prop :=
  0 < reservoir.precursorLabels.length

end Technology.Materialization.Source
end PhysicsLean
