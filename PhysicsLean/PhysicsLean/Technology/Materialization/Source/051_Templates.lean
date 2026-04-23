import PhysicsLean.Technology.Materialization.Source.«050_FabricatorArchitecture»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure TemplateSector where
  geometryLabels : List String
  compositionLabels : List String
  orientationLabels : List String
  boundarySites : Nat
  deriving Repr

def templateCompatible (template : TemplateSector) (surface : SurfaceSector) : Prop :=
  surface.exposedSites <= template.boundarySites

def templateStructuralComparator (template : TemplateSector) (surface : SurfaceSector) : Prop :=
  templateCompatible template surface ∧ surfaceSectorAdmissible surface

end Technology.Materialization.Source
end PhysicsLean
