import PhysicsLean.Technology.Materialization.Source.«043_RepairChannels»

namespace PhysicsLean
namespace Technology.Materialization.Source

def repairStable (channel : RepairChannel) (budget : Rat) : Prop :=
  repairChannelAdmissible channel ∧ channel.monitoredSurface.closureScore <= budget

end Technology.Materialization.Source
end PhysicsLean
