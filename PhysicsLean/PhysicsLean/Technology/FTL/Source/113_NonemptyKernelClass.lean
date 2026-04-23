import PhysicsLean.Technology.FTL.Source.«112_DesynchronizationCriteria»

namespace PhysicsLean
namespace Technology.FTL.Source

structure FiniteStateTransportKernel where
  label : String
  observerShiftWeight : Rat
  actionCostWeight : Rat
  timeCoeff : Rat
  spaceCoeff : Rat
  deriving Repr

def kernelDispersionData (kernel : FiniteStateTransportKernel) : CarrierDispersionData :=
  { timeCoeff := kernel.timeCoeff
    spaceCoeff := kernel.spaceCoeff
    massCoeff := kernel.actionCostWeight }

def distinguishedLuminalKernel : FiniteStateTransportKernel :=
  { label := "L"
    observerShiftWeight := 1
    actionCostWeight := 0
    timeCoeff := 1
    spaceCoeff := 1 }

def defaultDesynchronizedKernel : FiniteStateTransportKernel :=
  { label := "T"
    observerShiftWeight := 9 / 5
    actionCostWeight := 1 / 5
    timeCoeff := 1
    spaceCoeff := 9 / 5 }

def nonemptyDesynchronizedKernelClass : List FiniteStateTransportKernel :=
  [defaultDesynchronizedKernel]

def kernelClassHasHardCandidate : Prop :=
  ∃ kernel ∈ nonemptyDesynchronizedKernelClass,
    candidateHardCarrierSector (kernelDispersionData distinguishedLuminalKernel)
      (kernelDispersionData kernel)

end Technology.FTL.Source
end PhysicsLean
