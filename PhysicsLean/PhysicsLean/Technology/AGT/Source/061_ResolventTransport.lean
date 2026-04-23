import PhysicsLean.Technology.AGT.Source.«060_SpectralTransportKernel»

namespace PhysicsLean
namespace Technology.AGT.Source

structure DominantBranchData where
  branchValue : Rat
  thetaDerivative : Rat
  etaDerivative : Rat
  gravDerivative : Rat
  deriving Repr

def gravResolventDenominator (kernelValue : Rat) : Rat :=
  1 - kernelValue

def hasResolventPole (kernelValue : Rat) : Prop :=
  gravResolventDenominator kernelValue = 0

def spectralMomentum (branch : DominantBranchData) : Rat :=
  branch.thetaDerivative

def spectralEnergy (branch : DominantBranchData) : Rat :=
  -branch.etaDerivative

def spectralGravCharge (branch : DominantBranchData) : Rat :=
  branch.gravDerivative

def lowEnergyOnShellBranch (restEnergy inertialMass momentumSq : Rat) : Rat :=
  restEnergy + momentumSq / (2 * inertialMass)

structure ScreeningGap where
  gapSquared : Rat
  deriving Repr

def dressedBranchShift (baseBranch gap : Rat) : Rat :=
  baseBranch - gap

end Technology.AGT.Source
end PhysicsLean
