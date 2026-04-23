import PhysicsLean.Technology.FTL.Source.«136_ResourceClosure»

namespace PhysicsLean
namespace Technology.FTL.Source

structure SoftMaterialMedium where
  metastableSectors : Nat
  memoryPersistence : Rat
  readableLifetime : Rat
  deriving Repr

def softMaterialEmbedded (medium : SoftMaterialMedium) : Prop :=
  1 < medium.metastableSectors ∧ medium.readableLifetime < medium.memoryPersistence

structure HardMaterialMedium where
  branchTransferInterface : Prop
  poleStable : Prop
  bindingStable : Prop
  resourceCompatible : Prop

def hardMaterialEmbedded (medium : HardMaterialMedium) : Prop :=
  medium.branchTransferInterface ∧ medium.poleStable ∧ medium.bindingStable ∧ medium.resourceCompatible

def defaultSoftMaterialMedium : SoftMaterialMedium :=
  { metastableSectors := 2
    memoryPersistence := 10
    readableLifetime := 1 }

def defaultHardMaterialMedium : HardMaterialMedium :=
  { branchTransferInterface := True
    poleStable := True
    bindingStable := True
    resourceCompatible := True }

end Technology.FTL.Source
end PhysicsLean
