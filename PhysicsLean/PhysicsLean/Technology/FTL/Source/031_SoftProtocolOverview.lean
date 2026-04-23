import PhysicsLean.Technology.FTL.Source.«030_SoftHardSplit»

namespace PhysicsLean
namespace Technology.FTL.Source

structure SoftProtocolStep where
  step : String
  requirement : String
  output : String
  deriving Repr

def softProtocol : List SoftProtocolStep :=
  [ { step := "Prepare link sector"
      requirement := "A non-factorizable observer-accessible composite sector with local and remote windows"
      output := "Shared branch-locked sector" }
  , { step := "Calibrate remote imprint"
      requirement := "A map from remote coarse classes to local reduced detector states"
      output := "Readout profile" }
  , { step := "Classicalize detector basis"
      requirement := "A stable local record basis with controlled decoherence"
      output := "Diagonal detector limit" }
  , { step := "Read local records"
      requirement := "Local record frequencies remain distinguishable across remote classes"
      output := "Remote witness or finite scanner readout" } ]

structure SoftFailureMode where
  code : String
  statement : String
  deriving Repr

def softFailureModes : List SoftFailureMode :=
  [ { code := "S1", statement := "The proposed shared sector factorizes into independent local subsystems." }
  , { code := "S2", statement := "The observer cut is unstable, so the reduced detector state is not physically meaningful." }
  , { code := "S3", statement := "The detector classicalizes in the wrong basis and loses operational readout." }
  , { code := "S4", statement := "Backreaction destroys the shared sector before the local readout stabilizes." } ]

theorem softProtocol_length : softProtocol.length = 4 := by
  rfl

theorem softFailureModes_length : softFailureModes.length = 4 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
