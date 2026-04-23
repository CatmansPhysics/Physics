import PhysicsLean.Technology.FTL.Source.«096_SoftOperationalProtocol»

namespace PhysicsLean
namespace Technology.FTL.Source

structure ScaleScanner where
  level : Nat
  protocol : SoftOperationalProtocol
  deriving Repr

structure HierarchicalRemoteLabel where
  labels : List String
  deriving Repr

structure HierarchicalSoftScanner where
  levels : List ScaleScanner
  deriving Repr

structure ScaleReadoutResult where
  minimalContrast : Rat
  totalError : Rat
  deriving Repr

def levelReadable (result : ScaleReadoutResult) : Prop :=
  result.totalError < result.minimalContrast

def allLevelsReadable : List ScaleReadoutResult -> Prop
  | [] => True
  | result :: rest => levelReadable result ∧ allLevelsReadable rest

def hierarchicalReadable (results : List ScaleReadoutResult) : Prop :=
  allLevelsReadable results

end Technology.FTL.Source
end PhysicsLean
