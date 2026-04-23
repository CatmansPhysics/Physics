import PhysicsLean.Technology.Materialization.Source.«042_Annealing»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure RepairChannel where
  repairModes : List String
  monitoredSurface : SurfaceSector
  deriving Repr

def repairChannelAdmissible (channel : RepairChannel) : Prop :=
  0 < channel.repairModes.length ∧ surfaceSectorAdmissible channel.monitoredSurface

end Technology.Materialization.Source
end PhysicsLean
