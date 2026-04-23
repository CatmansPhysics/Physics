import PhysicsLean.Technology.Materialization.Source.«048_SurfaceFailureModes»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure MonitoringSnapshot where
  completionLabel : String
  defectCount : Nat
  surfaceDefectCount : Nat
  predictedCompletionTime : Rat
  deriving Repr

abbrev MonitoringMap := SurfaceSector → MonitoringSnapshot

abbrev ActionSelectionRule := MonitoringSnapshot → SpecificationTheory → String

structure Fabricator where
  precursor : PrecursorTheory
  specification : SpecificationTheory
  controlAlphabet : List String
  monitorLabels : List String
  actionLabels : List String
  deriving Repr

def fabricatorAdmissible (fabricator : Fabricator) : Prop :=
  precursorNonempty fabricator.precursor ∧
    observerSpecificationAdmissible fabricator.specification ∧
      0 < fabricator.controlAlphabet.length ∧
        0 < fabricator.monitorLabels.length ∧ 0 < fabricator.actionLabels.length

def monitorSurface (surface : SurfaceSector) : MonitoringSnapshot :=
  { completionLabel := if surface.exposedSites = 0 then "surface-admissible" else "surface-open"
    defectCount := surface.exposedSites
    surfaceDefectCount := surface.exposedSites
    predictedCompletionTime := surface.closureScore }

def chooseFabricationAction (snapshot : MonitoringSnapshot) (spec : SpecificationTheory) : String :=
  if snapshot.defectCount = 0 ∧ spec.persistenceWindow > 0 then "stabilize" else "repair"

end Technology.Materialization.Source
end PhysicsLean
