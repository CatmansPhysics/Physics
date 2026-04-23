import PhysicsLean.Technology.Materialization.Source.«026_CrystallineFailureModes»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure MonatomicTarget where
  species : String
  siteCount : Nat
  deriving Repr

def monatomicTargetAdmissible (target : MonatomicTarget) : Prop :=
  0 < target.siteCount

end Technology.Materialization.Source
end PhysicsLean
