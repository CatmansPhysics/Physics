import PhysicsLean.Technology.AGT.Source.«110_ToyV11BackgroundField»

namespace PhysicsLean
namespace Technology.AGT.Source

structure LocalToyBranch where
  sector : ToySector
  position : Rat
  restEnergy : Rat
  inertialMass : Rat
  spectralCharge : Rat
  deriving Repr

def localChargedKernelValue (params : ToyParameters) (background : BackgroundParameterPack)
    (sector : ToySector) (position q eta marker : Rat) : Rat :=
  let base := projectedKernelValue sector (finiteKernelData params q eta) marker
  base + localSectorPreference background.mu (wallBias background.h0 background.center position) sector

def localBubbleKernelValue (params : ToyParameters) (background : BackgroundParameterPack)
    (sector : ToySector) (position q eta marker : Rat) : Rat :=
  let base := projectedKernelValue sector (finiteKernelData params q eta) marker
  base + localSectorPreference background.mu (bubbleBias background.h0 background.center background.radius position) sector

def localRestEnergyShift (background : BackgroundParameterPack) (sector : ToySector) (position : Rat) : Rat :=
  localSectorPreference background.mu (wallBias background.h0 background.center position) sector

def localBubbleRestEnergyShift (background : BackgroundParameterPack) (sector : ToySector) (position : Rat) : Rat :=
  localSectorPreference background.mu (bubbleBias background.h0 background.center background.radius position) sector

def wallStepHeight (background : BackgroundParameterPack) (sector : ToySector) : Rat :=
  2 * background.h0 * background.mu * toySectorCharge sector

def bubbleStepHeight (background : BackgroundParameterPack) (sector : ToySector) : Rat :=
  2 * background.h0 * background.mu * toySectorCharge sector

end Technology.AGT.Source
end PhysicsLean
