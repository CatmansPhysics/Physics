import PhysicsLean.Technology.Materialization.Source.«133_RecursiveMaterialization»

namespace PhysicsLean
namespace Technology.Materialization.Source

def effectiveFabricationReproductiveNumber (viableSuccessorCount : Rat) : Rat :=
  viableSuccessorCount

def fabricatorLineagePersistenceCriterion (r0 : Rat) : Prop :=
  1 < r0

structure FabricatorPopulationDynamics where
  birthRate : Rat
  decayRate : Rat
  couplingRate : Rat
  deriving Repr

def fabricatorPopulationDynamicsAdmissible (dyn : FabricatorPopulationDynamics) : Prop :=
  0 <= dyn.birthRate ∧ 0 <= dyn.decayRate

end Technology.Materialization.Source
end PhysicsLean
