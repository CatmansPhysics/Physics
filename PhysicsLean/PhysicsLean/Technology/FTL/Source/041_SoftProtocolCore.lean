import PhysicsLean.Technology.FTL.Source.«040_ObserverLuminalFramework»

namespace PhysicsLean
namespace Technology.FTL.Source

structure SoftToyParameters where
  mu0 : Rat
  gammaDec : Rat
  gammaLink : Rat
  sampleCount : Nat
  confidenceFactor : Rat
  deriving Repr

def softReadoutContrast (params : SoftToyParameters) (time : Rat) : Rat :=
  params.mu0 / (1 + params.gammaLink * time)

def classicalizationError (params : SoftToyParameters) (time : Rat) : Rat :=
  1 / (1 + params.gammaDec * time)

def statisticalThreshold (params : SoftToyParameters) : Rat :=
  if params.sampleCount = 0 then 0 else params.confidenceFactor / params.sampleCount

def softReadoutWindow (params : SoftToyParameters) (time : Rat) : Prop :=
  classicalizationError params time < softReadoutContrast params time ∧
    statisticalThreshold params <= softReadoutContrast params time

structure SoftOperationalTarget where
  code : String
  statement : String
  deriving Repr

def softOperationalTargets : List SoftOperationalTarget :=
  [ { code := "Soft-0"
      statement := "A binary remote witness becomes operational once the detector classicalizes before the shared link decays." }
  , { code := "Soft-1"
      statement := "A finite remote scanner exists once remote classes map injectively to local detector readouts." } ]

theorem softOperationalTargets_length : softOperationalTargets.length = 2 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
