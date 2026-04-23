import PhysicsLean.Technology.AGT.Source.«114_ToyV11ScanProtocol»

namespace PhysicsLean
namespace Technology.AGT.Source

structure WallLocalizedResonance where
  sector : ToySector
  resonanceEnergy : Rat
  dwellTime : Rat
  width : Rat
  localizedNearInterface : Prop
  deriving Repr

structure BubbleDwellState where
  sector : ToySector
  resonanceEnergy : Rat
  dwellTime : Rat
  leakageWidth : Rat
  localizedInsideBubble : Prop
  deriving Repr

structure LocalizedBranch where
  sector : ToySector
  markerMomentum : Rat
  markerEta : Rat
  localizedValue : Rat
  absentInHomogeneousBulk : Prop
  nearOnShell : Prop
  deriving Repr

def cavityCondition (leftTurningPoint rightTurningPoint leakage : Rat) : Prop :=
  leftTurningPoint < rightTurningPoint ∧ 0 <= leakage

def wallResonanceCriterion (leftTurningPoint rightTurningPoint leakage : Rat) : Prop :=
  cavityCondition leftTurningPoint rightTurningPoint leakage ∧ leakage <= rightTurningPoint - leftTurningPoint

def breitWignerTransmission (gammaL gammaR gammaTotal energy resonanceEnergy : Rat) : Rat :=
  if gammaTotal = 0 then
    0
  else
    gammaL * gammaR / ((energy - resonanceEnergy) ^ 2 + (gammaTotal / 2) ^ 2)

def dwellTimeFromWidth (width : Rat) : Rat :=
  if width = 0 then 0 else 1 / width

def resonantSectorSelectivity (plusDwell minusDwell : Rat) : Prop :=
  plusDwell != minusDwell

structure ResonancePrediction where
  code : String
  statement : String
  deriving Repr

def resonancePredictions : List ResonancePrediction :=
  [ { code := "P1"
      statement := "Soft walls can produce a non-monotone dwell-time peak near a sector-specific resonance momentum." }
  , { code := "P2"
      statement := "As the bubble radius grows, the number of quasi-bound dwell windows should not decrease." }
  , { code := "P3"
      statement := "In a selective regime the resonance widths of the plus and minus sectors differ, so their dwell times differ." } ]

structure ResonanceTarget where
  code : String
  statement : String
  deriving Repr

def resonanceTargets : List ResonanceTarget :=
  [ { code := "Wall-res"
      statement := "A wall-localized resonance is a near-on-shell localized branch whose observer shadow is a sharp dwell-time enhancement." }
  , { code := "Bubble-res"
      statement := "A bubble dwell state is a quasi-localized branch of the bubble-modified resolvent close to the real on-shell branch." }
  , { code := "Localized-branch"
      statement := "Sector-localized quasi-bound branches exist only in the inhomogeneous interface kernel and are absent in the homogeneous bulk." } ]

theorem resonancePredictions_length : resonancePredictions.length = 3 := by
  rfl

theorem resonanceTargets_length : resonanceTargets.length = 3 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
