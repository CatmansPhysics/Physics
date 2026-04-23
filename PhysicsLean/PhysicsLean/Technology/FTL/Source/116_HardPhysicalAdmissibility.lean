import PhysicsLean.Technology.FTL.Source.«115_PhysicalProjectedPole»

namespace PhysicsLean
namespace Technology.FTL.Source

structure HardPhysicalAdmissibilityData where
  preservesResidueLabels : Prop
  preservesProjectedSector : Prop
  preservesLowEnergyPoleData : Prop

def hardPhysicallyAdmissible (data : HardPhysicalAdmissibilityData) : Prop :=
  data.preservesResidueLabels ∧
    data.preservesProjectedSector ∧
    data.preservesLowEnergyPoleData

def projectionCompatible
    (data : HardPhysicalAdmissibilityData)
    (pole : SectorResolvedPoleData) : Prop :=
  hardPhysicallyAdmissible data ∧ sectorResolvedSimplePole pole

def defaultHardPhysicalAdmissibilityData : HardPhysicalAdmissibilityData :=
  { preservesResidueLabels := True
    preservesProjectedSector := True
    preservesLowEnergyPoleData := True }

end Technology.FTL.Source
end PhysicsLean
