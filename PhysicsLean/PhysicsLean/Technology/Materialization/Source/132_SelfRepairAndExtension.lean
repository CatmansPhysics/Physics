import PhysicsLean.Technology.Materialization.Source.«131_HeredityAndFidelity»

namespace PhysicsLean
namespace Technology.Materialization.Source

def selfRepairingSystem
    (system : SelfFabricatingSystem)
    (repairLabels : List String) : Prop :=
  selfFabricatingSystemAdmissible system ∧ 0 < repairLabels.length

def selfExtendingFabricatorSystem
    (system : SelfFabricatingSystem)
    (repairLabels : List String) : Prop :=
  selfRepairingSystem system repairLabels

def trueSelfFabricatingSystem
    (system : SelfFabricatingSystem)
    (channel : SelfFabricationChannel) : Prop :=
  selfFabricatingSystemAdmissible system ∧ selfFabricationChannelAdmissible channel

def selfRepairNecessaryButNotSufficient
    (system : SelfFabricatingSystem)
    (repairLabels : List String)
    (channel : SelfFabricationChannel) : Prop :=
  selfRepairingSystem system repairLabels ∧ selfFabricationChannelAdmissible channel

end Technology.Materialization.Source
end PhysicsLean
