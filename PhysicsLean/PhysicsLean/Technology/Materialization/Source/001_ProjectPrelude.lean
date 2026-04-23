import PhysicsLean.Technology.Materialization.Source.«000_ProjectBoundary»

namespace PhysicsLean
namespace Technology.Materialization.Source

inductive ProjectStatus
  | imported
  | internal
  | target
  | open
  deriving DecidableEq, Repr

structure ProjectPrelude where
  boundary : ProjectBoundary
  status : ProjectStatus
  thesis : String
  deriving Repr

def defaultProjectPrelude : ProjectPrelude :=
  { boundary := defaultProjectBoundary
    status := ProjectStatus.internal
    thesis := "Materialization is controlled assembly from precursor sectors into an observer-valid object." }

end Technology.Materialization.Source
end PhysicsLean
