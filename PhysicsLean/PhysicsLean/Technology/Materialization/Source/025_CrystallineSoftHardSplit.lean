import PhysicsLean.Technology.Materialization.Source.«024_SuccessfulCrystallineMaterialization»

namespace PhysicsLean
namespace Technology.Materialization.Source

inductive CrystallineRegime
  | soft
  | hard
  deriving DecidableEq, Repr

def crystallineSoftMaterialization (regime : CrystallineRegime) : Prop :=
  regime = CrystallineRegime.soft

def crystallineHardMaterialization (regime : CrystallineRegime) : Prop :=
  regime = CrystallineRegime.hard

end Technology.Materialization.Source
end PhysicsLean
