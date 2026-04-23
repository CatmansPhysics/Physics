import PhysicsLean.Technology.Materialization.Source.«040_SurfaceSector»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure SurfaceEnergy where
  bulkEnergy : Rat
  boundaryEnergy : Rat
  deriving Repr

def totalSurfaceEnergy (energy : SurfaceEnergy) : Rat :=
  energy.bulkEnergy + energy.boundaryEnergy

end Technology.Materialization.Source
end PhysicsLean
