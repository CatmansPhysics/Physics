import PhysicsLean.Technology.Materialization.Source.«090_HierarchyCore»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure FunctionalSubsystem where
  labels : List String
  persistent : Bool
  affectsFutureBehavior : Bool
  deriving Repr

structure InterfaceSector where
  leftSubsystem : FunctionalSubsystem
  rightSubsystem : FunctionalSubsystem
  interfaceLabels : List String
  deriving Repr

structure FunctionalChannel where
  sourceSubsystem : FunctionalSubsystem
  targetSubsystem : FunctionalSubsystem
  channelLabels : List String
  deriving Repr

def interfaceSectorAdmissible (sector : InterfaceSector) : Prop :=
  0 < sector.interfaceLabels.length

def functionalChannelAdmissible (channel : FunctionalChannel) : Prop :=
  0 < channel.channelLabels.length

def interfacesAreFirstClassTargets
    (sector : InterfaceSector)
    (channel : FunctionalChannel) : Prop :=
  interfaceSectorAdmissible sector ∧ functionalChannelAdmissible channel

end Technology.Materialization.Source
end PhysicsLean
