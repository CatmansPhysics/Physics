import PhysicsLean.Technology.Materialization.Source.«136_RecursiveSelfModel»

namespace PhysicsLean
namespace Technology.Materialization.Source

def selfFabricationCriterion
    (system : SelfFabricatingSystem)
    (channel : SelfFabricationChannel)
    (sector : HereditaryFabricationSector)
    (r0 : Rat) : Prop :=
  selfFabricatingSystemAdmissible system ∧
    selfFabricationChannelAdmissible channel ∧
      hereditaryFabricationSectorAdmissible sector ∧ fabricatorLineagePersistenceCriterion r0

def recursivePersistenceTheorem
    (system : SelfFabricatingSystem)
    (channel : SelfFabricationChannel)
    (field : SharedFabricationResourceField)
    (r0 : Rat)
    (budget : FabricationBudget) : Prop :=
  selfFabricationCriterion system channel
      { templates := ["template"] , rawFidelity := 1, repairFactor := 0 } r0 ∧
    sustainableRecursiveRegime field r0 budget

def selfExtensionToSelfFabricationLift
    (system : SelfFabricatingSystem)
    (repairLabels : List String)
    (channel : SelfFabricationChannel)
    (sector : HereditaryFabricationSector) : Prop :=
  selfExtendingFabricatorSystem system repairLabels ∧
    selfFabricationChannelAdmissible channel ∧ hereditaryFabricationSectorAdmissible sector

end Technology.Materialization.Source
end PhysicsLean
