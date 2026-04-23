import PhysicsLean.Technology.Materialization.Source.«046_RepairCompletion»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure SelfMonitoringChannel where
  monitorLabels : List String
  repairChannel : RepairChannel
  deriving Repr

def selfMonitoringReady (channel : SelfMonitoringChannel) : Prop :=
  0 < channel.monitorLabels.length ∧ repairChannelAdmissible channel.repairChannel

end Technology.Materialization.Source
end PhysicsLean
