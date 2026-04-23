import PhysicsLean.Technology.AGT.Source.«100_ToyV10FiniteKernel»

namespace PhysicsLean
namespace Technology.AGT.Source

structure ToyBranch where
  sector : ToySector
  kernelValue : Rat
  eta : Rat
  marker : Rat
  deriving Repr

def onShell (branch : ToyBranch) : Prop :=
  branch.kernelValue = 1

def toySpectralCharge (branch : ToyBranch) : Rat :=
  toySectorCharge branch.sector

def toyRestEnergy (branch : ToyBranch) : Rat :=
  branch.eta

def toyInertialMass (params : ToyParameters) (branch : ToyBranch) : Rat :=
  match branch.sector with
  | ToySector.plus => params.chargedRest + branch.marker
  | ToySector.minus => params.chargedRest + branch.marker
  | ToySector.neutral => params.neutralRest

theorem plus_branch_positive_charge (kernelValue eta marker : Rat) :
    0 < toySpectralCharge { sector := ToySector.plus, kernelValue := kernelValue, eta := eta, marker := marker } := by
  norm_num [toySpectralCharge, toySectorCharge]

theorem minus_branch_negative_charge (kernelValue eta marker : Rat) :
    toySpectralCharge { sector := ToySector.minus, kernelValue := kernelValue, eta := eta, marker := marker } < 0 := by
  norm_num [toySpectralCharge, toySectorCharge]

theorem neutral_branch_zero_charge (kernelValue eta marker : Rat) :
    toySpectralCharge { sector := ToySector.neutral, kernelValue := kernelValue, eta := eta, marker := marker } = 0 := by
  norm_num [toySpectralCharge, toySectorCharge]

end Technology.AGT.Source
end PhysicsLean
