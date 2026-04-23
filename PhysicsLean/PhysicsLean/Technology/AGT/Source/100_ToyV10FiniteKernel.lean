import PhysicsLean.Technology.AGT.Source.«091_ClosureCriteria»

namespace PhysicsLean
namespace Technology.AGT.Source

inductive ToySector
  | plus
  | minus
  | neutral
  deriving DecidableEq, Repr

structure ToyParameters where
  hopCost : Rat
  bindCost : Rat
  unbindCost : Rat
  chargedRest : Rat
  neutralRest : Rat
  deriving Repr

def toySectorCharge : ToySector -> Int
  | ToySector.plus => 1
  | ToySector.minus => -1
  | ToySector.neutral => 0

def toyWeight (cost eta : Rat) : Rat :=
  cost * eta

structure ToyKernelData where
  chargedPropagation : Rat
  bindWeight : Rat
  unbindWeight : Rat
  diagonalWeight : Rat
  neutralWeight : Rat
  deriving Repr

def finiteKernelData (params : ToyParameters) (q eta : Rat) : ToyKernelData :=
  { chargedPropagation := params.hopCost * q * eta
    bindWeight := params.bindCost * eta
    unbindWeight := params.unbindCost * eta
    diagonalWeight := params.chargedRest * eta
    neutralWeight := params.neutralRest * eta }

def projectedKernelValue (sector : ToySector) (kernel : ToyKernelData) (marker : Rat) : Rat :=
  match sector with
  | ToySector.plus => kernel.chargedPropagation * marker + kernel.diagonalWeight + kernel.bindWeight / marker
  | ToySector.minus => kernel.chargedPropagation / marker + kernel.diagonalWeight + kernel.bindWeight * marker
  | ToySector.neutral => kernel.neutralWeight

end Technology.AGT.Source
end PhysicsLean
