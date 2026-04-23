import PhysicsLean.Technology.FTL.Source.«091_ExplicitTwoBranchFamily»

namespace PhysicsLean
namespace Technology.FTL.Source

structure CoarseAmplitude where
  magnitude : Rat
  phaseMarker : Rat
  deriving Repr

def amplitudeNormSq (amplitude : CoarseAmplitude) : Rat :=
  amplitude.magnitude * amplitude.magnitude

structure KernelGeneratedSoftState where
  leftAmplitude : CoarseAmplitude
  rightAmplitude : CoarseAmplitude
  overlapMarker : Rat
  deriving Repr

def normalizedLeftWeight (state : KernelGeneratedSoftState) : Rat :=
  let total := amplitudeNormSq state.leftAmplitude + amplitudeNormSq state.rightAmplitude
  if total = 0 then 0 else amplitudeNormSq state.leftAmplitude / total

def normalizedRightWeight (state : KernelGeneratedSoftState) : Rat :=
  let total := amplitudeNormSq state.leftAmplitude + amplitudeNormSq state.rightAmplitude
  if total = 0 then 0 else amplitudeNormSq state.rightAmplitude / total

def kernelGeneratedDetectorState (state : KernelGeneratedSoftState) : TwoBranchDetectorState :=
  { leftWeight := normalizedLeftWeight state
    rightWeight := normalizedRightWeight state
    coherence := state.overlapMarker + state.leftAmplitude.phaseMarker - state.rightAmplitude.phaseMarker }

def kernelGeneratedWitnessContrast (left right : KernelGeneratedSoftState) : Rat :=
  fullWitnessContrast (kernelGeneratedDetectorState left) (kernelGeneratedDetectorState right)

def weightSoftSector (left right : KernelGeneratedSoftState) : Prop :=
  normalizedLeftWeight left != normalizedLeftWeight right

def phaseSoftSector (left right : KernelGeneratedSoftState) : Prop :=
  normalizedLeftWeight left = normalizedLeftWeight right ∧ left.overlapMarker != right.overlapMarker

end Technology.FTL.Source
end PhysicsLean
