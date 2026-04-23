import PhysicsLean.Technology.AGT.Source.«105_ToyV10ImplementationBlueprint»

namespace PhysicsLean
namespace Technology.AGT.Source

structure BackgroundField where
  amplitude : Rat
  center : Rat
  width : Rat
  deriving Repr

def wallBias (amplitude center position : Rat) : Rat :=
  if position < center then -amplitude else amplitude

def bubbleBias (amplitude center radius position : Rat) : Rat :=
  if |position - center| <= radius then amplitude else -amplitude

def localSectorPreference (mu biasValue : Rat) (sector : ToySector) : Rat :=
  match sector with
  | ToySector.plus => mu * biasValue
  | ToySector.minus => -mu * biasValue
  | ToySector.neutral => 0

structure BackgroundParameterPack where
  h0 : Rat
  ellH : Rat
  mu : Rat
  radius : Rat
  center : Rat
  deriving Repr

def defaultWallPack : BackgroundParameterPack :=
  { h0 := 4 / 5, ellH := 2, mu := 1, radius := 0, center := 16 }

def defaultBubblePack : BackgroundParameterPack :=
  { h0 := 4 / 5, ellH := 0, mu := 1, radius := 4, center := 16 }

end Technology.AGT.Source
end PhysicsLean
