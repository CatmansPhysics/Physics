import PhysicsLean.Technology.FTL.Source.«070_TargetTheoremPackages»

namespace PhysicsLean
namespace Technology.FTL.Source

inductive CommonAxiom
  | structuralPrimacy
  | observerRelativity
  | coneSector
  | causalAdmissibility
  | spectralReadability
  | failureModeCompleteness
  deriving DecidableEq, Repr

inductive SoftAxiom
  | sharedLinkSector
  | nonFactorizableAccessibility
  | remoteCoarseImprint
  | detectorClassicalization
  | temporalReadoutWindow
  deriving DecidableEq, Repr

inductive HardAxiom
  | stableObjectSector
  | superluminalCarrierSector
  | branchTransferAccessibility
  | adiabaticSwitching
  | identityPreservation
  | poleSurvival
  | compositeBindingStability
  deriving DecidableEq, Repr

def commonAxioms : List CommonAxiom :=
  [ CommonAxiom.structuralPrimacy
  , CommonAxiom.observerRelativity
  , CommonAxiom.coneSector
  , CommonAxiom.causalAdmissibility
  , CommonAxiom.spectralReadability
  , CommonAxiom.failureModeCompleteness ]

def softAxioms : List SoftAxiom :=
  [ SoftAxiom.sharedLinkSector
  , SoftAxiom.nonFactorizableAccessibility
  , SoftAxiom.remoteCoarseImprint
  , SoftAxiom.detectorClassicalization
  , SoftAxiom.temporalReadoutWindow ]

def hardAxioms : List HardAxiom :=
  [ HardAxiom.stableObjectSector
  , HardAxiom.superluminalCarrierSector
  , HardAxiom.branchTransferAccessibility
  , HardAxiom.adiabaticSwitching
  , HardAxiom.identityPreservation
  , HardAxiom.poleSurvival
  , HardAxiom.compositeBindingStability ]

theorem commonAxioms_length : commonAxioms.length = 6 := by
  rfl

theorem softAxioms_length : softAxioms.length = 5 := by
  rfl

theorem hardAxioms_length : hardAxioms.length = 7 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
