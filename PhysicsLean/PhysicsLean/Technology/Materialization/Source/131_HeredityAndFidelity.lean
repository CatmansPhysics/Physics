import PhysicsLean.Technology.Materialization.Source.«130_SelfFabrication»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure HereditaryFabricationSector where
  templates : List String
  rawFidelity : Rat
  repairFactor : Rat
  deriving Repr

def hereditaryFabricationSectorAdmissible (sector : HereditaryFabricationSector) : Prop :=
  0 < sector.templates.length ∧ 0 <= sector.rawFidelity ∧ 0 <= sector.repairFactor

def effectivePostRepairFabricationFidelity (sector : HereditaryFabricationSector) : Rat :=
  sector.rawFidelity + sector.repairFactor * (1 - sector.rawFidelity)

def selfFabricationRequiresMoreThanSelfModel
    (sector : HereditaryFabricationSector)
    (model : ProtoSelfModel) : Prop :=
  hereditaryFabricationSectorAdmissible sector ∧ protoSelfModelAdmissible model

end Technology.Materialization.Source
end PhysicsLean
