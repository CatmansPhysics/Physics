import PhysicsLean.Technology.Materialization.Source.«041_SurfaceEnergy»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure AnnealingSchedule where
  temperatureSteps : List Rat
  dwellTime : Rat
  deriving Repr

def annealingAdmissible (schedule : AnnealingSchedule) : Prop :=
  0 < schedule.temperatureSteps.length ∧ 0 <= schedule.dwellTime

end Technology.Materialization.Source
end PhysicsLean
