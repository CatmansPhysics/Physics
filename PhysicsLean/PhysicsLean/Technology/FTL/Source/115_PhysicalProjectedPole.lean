import PhysicsLean.Technology.FTL.Source.«114_StrongDesynchronization»
import PhysicsLean.Technology.FTL.Source.«103_ProjectedResolventPole»

namespace PhysicsLean
namespace Technology.FTL.Source

structure SectorResolvedPoleData where
  branchEnergy : Rat
  residueWeight : Rat
  physicallyAdmissible : Prop
  deriving Repr

def sectorResolvedSimplePole (data : SectorResolvedPoleData) : Prop :=
  0 < data.residueWeight

def physicalProjectedPole
    (data : SectorResolvedPoleData)
    (block : ProjectedPhysicalResolventBlock) : Prop :=
  sectorResolvedSimplePole data ∧
    data.physicallyAdmissible ∧
    hasProjectedSimplePole block

def defaultSectorResolvedPoleData : SectorResolvedPoleData :=
  { branchEnergy := defaultProjectedPhysicalBlock.selectedEnergy
    residueWeight := defaultProjectedPhysicalBlock.residueWeight
    physicallyAdmissible := strongHC1CarrierClass }

end Technology.FTL.Source
end PhysicsLean
