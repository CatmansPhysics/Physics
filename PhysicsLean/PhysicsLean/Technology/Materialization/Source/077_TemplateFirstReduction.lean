import PhysicsLean.Technology.Materialization.Source.«076_LayeredInverseDesign»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure TemplateFirstStrategy where
  template : TemplateSector
  reducedMonitoringDemand : Nat
  deriving Repr

def templateFirstReduction (strategy : TemplateFirstStrategy) : Prop :=
  strategy.reducedMonitoringDemand <= strategy.template.boundarySites + 1

def templateFirstLowersOnlineInformationDemand (strategy : TemplateFirstStrategy) : Prop :=
  strategy.reducedMonitoringDemand <= strategy.template.geometryLabels.length + strategy.template.boundarySites + 1

end Technology.Materialization.Source
end PhysicsLean
