import PhysicsLean.Technology.Materialization.Source.«022_CrystallineReservoirs»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure CrystallizationChannel where
  reservoir : CrystallineReservoir
  target : CrystallineTarget
  controlStages : List String
  deriving Repr

def crystallizationChannelAdmissible (channel : CrystallizationChannel) : Prop :=
  crystallineReservoirReady channel.reservoir ∧ crystallineTargetNonempty channel.target

end Technology.Materialization.Source
end PhysicsLean
