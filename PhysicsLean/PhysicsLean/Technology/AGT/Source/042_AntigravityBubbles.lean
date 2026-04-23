import PhysicsLean.Technology.AGT.Source.«041_GravDipoles»

namespace PhysicsLean
namespace Technology.AGT.Source

structure BubbleParameters where
  wallTension : Rat
  freeEnergyGap : Rat
  geometryFactor : Rat
  fieldContribution : Rat -> Rat

def bubbleEnergy (params : BubbleParameters) (radius : Rat) : Rat :=
  params.geometryFactor * radius ^ 2 * params.wallTension +
    (params.geometryFactor / 3) * radius ^ 3 * params.freeEnergyGap +
    params.fieldContribution radius

structure AntigravityBubble where
  innerPhase : Rat
  outerPhase : Rat
  radius : Rat
  deriving Repr

def IsBubble (bubble : AntigravityBubble) : Prop :=
  bubble.innerPhase != bubble.outerPhase ∧ 0 <= bubble.radius

def MetastableBubble (params : BubbleParameters) (radius : Rat) : Prop :=
  0 <= radius ∧ bubbleEnergy params radius <= bubbleEnergy params 0

def CriticalBubbleRadius (params : BubbleParameters) : Prop :=
  ∃ radius > 0, bubbleEnergy params radius <= bubbleEnergy params 0

structure BubbleRegime where
  canCollapse : Prop
  canGrow : Prop
  hasMetastableRadius : Prop

def classifyBubbleRegime (params : BubbleParameters) (trialRadius : Rat) : BubbleRegime :=
  { canCollapse := bubbleEnergy params trialRadius > bubbleEnergy params 0
    canGrow := bubbleEnergy params trialRadius < bubbleEnergy params 0
    hasMetastableRadius := MetastableBubble params trialRadius }

def bubbleFailureModes : List InterfaceFailureMode :=
  [ { code := "AG-F11"
      description := "Dipole and shell sectors never metastabilize into localized interface bodies." }
  , { code := "AG-F12"
      description := "Bubble nucleation has no metastable window and always runs away." } ]

theorem bubbleFailureModes_length : bubbleFailureModes.length = 2 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
