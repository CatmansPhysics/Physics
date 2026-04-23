import PhysicsLean.Technology.FTL.Source.«062_HardMicroExample»

namespace PhysicsLean
namespace Technology.FTL.Source

inductive PackageStatus
  | internal
  | internalToEffective
  | openTarget
  deriving DecidableEq, Repr

structure TheoremPackageItem where
  regime : ProtocolRegime
  code : String
  status : PackageStatus
  statement : String
  deriving Repr

def theoremPackages : List TheoremPackageItem :=
  [ { regime := ProtocolRegime.softReadout
      code := "Soft-Existence"
      status := PackageStatus.openTarget
      statement := "A non-factorizable link sector exists and supports local reduced-state dependence on a remote coarse class." }
  , { regime := ProtocolRegime.softReadout
      code := "Soft-Operational"
      status := PackageStatus.internalToEffective
      statement := "A readout window converts reduced-state dependence into a classical local witness." }
  , { regime := ProtocolRegime.hardTransport
      code := "Hard-Carrier"
      status := PackageStatus.openTarget
      statement := "A superluminal carrier branch exists and supports admissible branch transfer." }
  , { regime := ProtocolRegime.hardTransport
      code := "Hard-Identity"
      status := PackageStatus.openTarget
      statement := "Identity and binding survive a complete luminal to carrier to luminal cycle." } ]

structure ImmediateCheckpoint where
  code : String
  condition : String
  deriving Repr

def immediateCheckpoints : List ImmediateCheckpoint :=
  [ { code := "S-CP1", condition := "The shared link sector exists and remote-conditioned detector states are distinguishable." }
  , { code := "S-CP2", condition := "The soft figure of merit exceeds one in a stable readout window." }
  , { code := "H-CP1", condition := "The carrier speed ratio exceeds one and switching stays adiabatic." }
  , { code := "H-CP2", condition := "Identity loss stays small and composite binding remains positive." } ]

theorem theoremPackages_length : theoremPackages.length = 4 := by
  rfl

theorem immediateCheckpoints_length : immediateCheckpoints.length = 4 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
