import PhysicsLean.Technology.AGT.Source.«040_DomainWalls»

namespace PhysicsLean
namespace Technology.AGT.Source

structure ChargedPoint where
  charge : Int
  position : Rat
  deriving Repr

def totalGravCharge (points : List ChargedPoint) : Int :=
  (points.map ChargedPoint.charge).sum

def gravDipoleMoment1D (points : List ChargedPoint) : Rat :=
  (points.map fun point => (point.charge : Rat) * point.position).sum

structure GravDipole where
  leftCharge : Int
  rightCharge : Int
  separation : Rat
  deriving Repr

def GravDipole.totalCharge (dipole : GravDipole) : Int :=
  dipole.leftCharge + dipole.rightCharge

def GravDipole.dipoleMoment (dipole : GravDipole) : Rat :=
  (dipole.leftCharge : Rat) * (-dipole.separation / 2) +
    (dipole.rightCharge : Rat) * (dipole.separation / 2)

def IsNeutralDipole (dipole : GravDipole) : Prop :=
  dipole.totalCharge = 0 ∧ dipole.dipoleMoment != 0

def minimalDipole (charge : Int) (separation : Rat) : GravDipole :=
  { leftCharge := charge, rightCharge := -charge, separation := separation }

theorem minimalDipole_totalCharge (charge : Int) (separation : Rat) :
    (minimalDipole charge separation).totalCharge = 0 := by
  simp [minimalDipole, GravDipole.totalCharge]

theorem minimalDipole_dipoleMoment (charge : Int) (separation : Rat) :
    (minimalDipole charge separation).dipoleMoment = -(charge : Rat) * separation := by
  simp [minimalDipole, GravDipole.dipoleMoment]
  ring

def farFieldDipolePotential (moment radius projection : Rat) : Rat :=
  moment * projection / radius ^ 2

def farFieldDipoleForce (moment radius projection : Rat) : Rat :=
  moment * projection / radius ^ 3

structure ShellConfiguration where
  coreCharge : Int
  shellCharge : Int
  shellSymmetric : Prop
  deriving Repr

def ShellConfiguration.totalCharge (shell : ShellConfiguration) : Int :=
  shell.coreCharge + shell.shellCharge

def IsNeutralShell (shell : ShellConfiguration) : Prop :=
  shell.totalCharge = 0

theorem symmetricNeutralShell_suppresses_monopole (shell : ShellConfiguration)
  (hNeutral : IsNeutralShell shell) :
    shell.totalCharge = 0 := by
  exact hNeutral

structure InterfaceTarget where
  code : String
  statement : String
  deriving Repr

def chapter4InterfaceTargets : List InterfaceTarget :=
  [ { code := "AG-T7"
      statement := "Stable grav-domain walls carry a translational soft mode and possibly interface-localized excitations." }
  , { code := "AG-T8"
      statement := "AGT-1 admits domain walls, grav-dipoles, neutral shells, and antigravity bubbles as localized interface sectors." } ]

end Technology.AGT.Source
end PhysicsLean
