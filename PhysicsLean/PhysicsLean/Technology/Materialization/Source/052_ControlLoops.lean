import PhysicsLean.Technology.Materialization.Source.«051_Templates»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure FabricationControlLoop where
  currentSurface : SurfaceSector
  monitoredState : MonitoringSnapshot
  chosenAction : String
  nextSurface : SurfaceSector
  deriving Repr

def fabricationControlLoopClosed (fabricator : Fabricator) (loop : FabricationControlLoop) : Prop :=
  fabricatorAdmissible fabricator ∧
    loop.monitoredState = monitorSurface loop.currentSurface ∧
      loop.chosenAction = chooseFabricationAction loop.monitoredState fabricator.specification

def fabricationControlLoopOpen (fabricator : Fabricator) (loop : FabricationControlLoop) : Prop :=
  fabricatorAdmissible fabricator ∧ 0 < fabricator.controlAlphabet.length ∧ loop.chosenAction != ""

def defectSensitiveFabrication (snapshot : MonitoringSnapshot) : Prop :=
  0 < snapshot.defectCount ∨ 0 < snapshot.surfaceDefectCount

def closedLoopSuperiority
    (fabricator : Fabricator)
    (loop : FabricationControlLoop) : Prop :=
  defectSensitiveFabrication loop.monitoredState → fabricationControlLoopClosed fabricator loop

end Technology.Materialization.Source
end PhysicsLean
