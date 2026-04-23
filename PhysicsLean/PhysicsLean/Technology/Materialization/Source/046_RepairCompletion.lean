import PhysicsLean.Technology.Materialization.Source.«045_UsableObject»

namespace PhysicsLean
namespace Technology.Materialization.Source

def repairCompletion
    (channel : RepairChannel)
    (surface : SurfaceSector)
    (energy : SurfaceEnergy)
    (budget : Rat) : Prop :=
  repairStable channel budget ∧ usableObject surface energy

end Technology.Materialization.Source
end PhysicsLean
