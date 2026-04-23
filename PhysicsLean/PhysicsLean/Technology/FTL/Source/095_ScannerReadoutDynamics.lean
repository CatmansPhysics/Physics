import PhysicsLean.Technology.FTL.Source.«094_FiniteAlphabetScanner»

namespace PhysicsLean
namespace Technology.FTL.Source

structure ScannerReadoutDynamics where
  scanner : FiniteAlphabetScanner
  classicalizationError : Rat
  memoryWriteError : Rat
  observerInformationGain : Rat
  deriving Repr

def readoutVisible (dynamics : ScannerReadoutDynamics) : Prop :=
  dynamics.classicalizationError + dynamics.memoryWriteError < scannerPairwiseContrast dynamics.scanner

def memoryPersistent (dynamics : ScannerReadoutDynamics) : Prop :=
  0 < dynamics.observerInformationGain

end Technology.FTL.Source
end PhysicsLean
