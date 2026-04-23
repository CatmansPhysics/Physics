import PhysicsLean.Technology.Materialization.Source.«039_ComputationalSchema»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure SurfaceSector where
  exposedSites : Nat
  closureScore : Rat
  deriving Repr

def surfaceSectorAdmissible (surface : SurfaceSector) : Prop :=
  0 <= surface.closureScore

end Technology.Materialization.Source
end PhysicsLean
