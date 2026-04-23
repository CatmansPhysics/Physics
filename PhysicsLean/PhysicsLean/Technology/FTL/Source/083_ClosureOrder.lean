import PhysicsLean.Technology.FTL.Source.«082_CoverageMatrix»

namespace PhysicsLean
namespace Technology.FTL.Source

structure ClosureStage where
  order : Nat
  title : String
  goals : List String
  deriving Repr

def closureOrder : List ClosureStage :=
  [ { order := 0
      title := "Freeze audit language"
      goals := ["Fix axioms", "Fix dependency graph", "Fix coverage matrix"] }
  , { order := 1
      title := "Close minimal soft language"
      goals := ["Link-sector wrapper", "Non-factorizable accessibility", "Remote imprint", "Detector classicalization"] }
  , { order := 2
      title := "Prove binary soft protocol"
      goals := ["Binary witness theorem", "Operational readout window", "First quantitative checkpoints"] }
  , { order := 3
      title := "Extend soft protocol to a scanner"
      goals := ["Finite scanner target", "Remote-state injectivity", "Soft robustness"] }
  , { order := 4
      title := "Formulate one-pole hard transport"
      goals := ["Carrier existence problem", "Branch-transfer accessibility", "Pole-level transport setup"] }
  , { order := 5
      title := "Prove one-pole hard transport"
      goals := ["Adiabatic transfer", "Pole survival", "Identity preservation"] }
  , { order := 6
      title := "Extend to composite hard transport"
      goals := ["Binding stability", "Composite theorem", "Composite checkpoints"] }
  , { order := 7
      title := "Close robustness and audit"
      goals := ["Soft robustness", "Hard robustness", "Failure localization", "Quantitative checkpoint persistence"] } ]

def closurePriority : List ProtocolRegime :=
  [ ProtocolRegime.softReadout, ProtocolRegime.hardTransport ]

theorem closureOrder_length : closureOrder.length = 8 := by
  rfl

theorem closurePriority_length : closurePriority.length = 2 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
