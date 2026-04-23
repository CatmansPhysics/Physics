import PhysicsLean.Technology.AGT.Source.«102_ToyV10Criteria»

namespace PhysicsLean
namespace Technology.AGT.Source

structure GraphProtocol where
  nodeCount : Nat
  alpha : Rat
  epsilon : Rat
  longEdges : List (Nat × Nat)
  deriving Repr

def defaultGraphProtocol : GraphProtocol :=
  { nodeCount := 32
    alpha := 11 / 5
    epsilon := 1 / 50
    longEdges := [(0, 8), (4, 16), (8, 20), (12, 28), (2, 10), (6, 18), (14, 26), (22, 30)] }

structure ParameterPack where
  gammaG : Rat
  deltaT : Rat
  bindCost : Rat
  unbindCost : Rat
  neutralBeta : Rat
  neutralGamma : Rat
  deriving Repr

def repulsionDominantPack : ParameterPack :=
  { gammaG := 1, deltaT := 1 / 20, bindCost := 27 / 20, unbindCost := 17 / 20, neutralBeta := 2 / 25, neutralGamma := 2 / 25 }

def neutralizationDominantPack : ParameterPack :=
  { gammaG := 1, deltaT := 1 / 20, bindCost := 7 / 10, unbindCost := 7 / 5, neutralBeta := 2 / 25, neutralGamma := 2 / 25 }

structure SourceConfiguration where
  code : String
  plusSites : List Nat
  minusSites : List Nat
  neutralSites : List Nat
  deriving Repr

def sourceSuite : List SourceConfiguration :=
  [ { code := "S1", plusSites := [0], minusSites := [], neutralSites := [] }
  , { code := "S2", plusSites := [], minusSites := [0], neutralSites := [] }
  , { code := "S3", plusSites := [0], minusSites := [16], neutralSites := [] }
  , { code := "S4", plusSites := [0, 6], minusSites := [16, 23], neutralSites := [] }
  , { code := "S5", plusSites := [0, 6], minusSites := [16, 23], neutralSites := [3, 19] } ]

structure ProbeConfiguration where
  code : String
  sector : ToySector
  startSite : Nat
  startMomentum : Rat
  deriving Repr

def probeSuite : List ProbeConfiguration :=
  [ { code := "P+", sector := ToySector.plus, startSite := 8, startMomentum := 0 }
  , { code := "P-", sector := ToySector.minus, startSite := 8, startMomentum := 0 }
  , { code := "P0", sector := ToySector.neutral, startSite := 8, startMomentum := 0 } ]

end Technology.AGT.Source
end PhysicsLean
