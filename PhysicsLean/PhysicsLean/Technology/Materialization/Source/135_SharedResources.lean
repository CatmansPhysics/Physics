import PhysicsLean.Technology.Materialization.Source.«134_FabricationReproductiveNumber»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure SharedFabricationResourceField where
  inputFlux : Rat
  extractionRate : Rat
  outputFlux : Rat
  deriving Repr

def sharedFabricationResourceFieldAdmissible (field : SharedFabricationResourceField) : Prop :=
  0 <= field.inputFlux ∧ 0 <= field.extractionRate ∧ 0 <= field.outputFlux

def recursiveMaterializationResourceConditioned
    (field : SharedFabricationResourceField)
    (r0 : Rat) : Prop :=
  sharedFabricationResourceFieldAdmissible field ∧ 0 <= r0

def sustainableRecursiveRegime
    (field : SharedFabricationResourceField)
    (r0 : Rat)
    (budget : FabricationBudget) : Prop :=
  sharedFabricationResourceFieldAdmissible field ∧
    fabricatorLineagePersistenceCriterion r0 ∧ fabricationBudgetAdmissible budget

end Technology.Materialization.Source
end PhysicsLean
