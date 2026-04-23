import PhysicsLean.Technology.FTL.Source.«117_AuditedHardObserverClass»

namespace PhysicsLean
namespace Technology.FTL.Source

structure ProjectedEffectiveKernelData where
  onShellEnergy : Rat
  residueWeight : Rat
  sectorNotAnnihilated : Prop
  deriving Repr

def retainsTransportedOnShellBranch
    (observerClass : AuditedHardObserverClass)
    (kernel : ProjectedEffectiveKernelData) : Prop :=
  memberOfAuditedHardObserverClass observerClass ∧
    kernel.sectorNotAnnihilated ∧
    0 < kernel.residueWeight

def defaultProjectedEffectiveKernelData : ProjectedEffectiveKernelData :=
  { onShellEnergy := defaultProjectedPhysicalBlock.selectedEnergy
    residueWeight := defaultProjectedPhysicalBlock.residueWeight
    sectorNotAnnihilated := True }

end Technology.FTL.Source
end PhysicsLean
