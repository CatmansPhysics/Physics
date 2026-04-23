import PhysicsLean.Technology.FTL.Source.«032_HardProtocolOverview»

namespace PhysicsLean
namespace Technology.FTL.Source

structure Observer where
  spatialProjection : String
  temporalSlicing : String
  decategorification : String
  deriving Repr

structure ReferenceLuminalSector where
  code : String
  coneSpeed : Rat
  stabilityClaim : String
  deriving Repr

def effectiveVelocity (distance duration : Rat) : Rat :=
  if duration = 0 then 0 else distance / duration

def ftlStatus (sector : ReferenceLuminalSector) (velocity : Rat) : Prop :=
  sector.coneSpeed < velocity

structure ObserverRelativeProcess where
  observer : Observer
  luminal : ReferenceLuminalSector
  processCode : String
  speed : Rat
  deriving Repr

def observerRelativeFTL (process : ObserverRelativeProcess) : Prop :=
  ftlStatus process.luminal process.speed

end Technology.FTL.Source
end PhysicsLean
