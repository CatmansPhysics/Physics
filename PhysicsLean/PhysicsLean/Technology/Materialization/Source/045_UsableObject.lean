import PhysicsLean.Technology.Materialization.Source.«044_RepairStability»

namespace PhysicsLean
namespace Technology.Materialization.Source

def usableObject (surface : SurfaceSector) (energy : SurfaceEnergy) : Prop :=
  surfaceSectorAdmissible surface ∧ 0 <= totalSurfaceEnergy energy

end Technology.Materialization.Source
end PhysicsLean
