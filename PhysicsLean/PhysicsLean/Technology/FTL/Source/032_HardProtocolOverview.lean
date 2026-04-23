import PhysicsLean.Technology.FTL.Source.«030_SoftHardSplit»

namespace PhysicsLean
namespace Technology.FTL.Source

structure HardProtocolStep where
  step : String
  requirement : String
  output : String
  deriving Repr

def hardProtocol : List HardProtocolStep :=
  [ { step := "Capture stable object sector"
      requirement := "A stable pole-like object sector in the luminal branch"
      output := "Loaded luminal carrier" }
  , { step := "Switch branch"
      requirement := "A controlled transfer from the luminal branch to a superluminal carrier branch"
      output := "Carrier-loaded transport branch" }
  , { step := "Transport through superluminal window"
      requirement := "A transport interval with effective speed above the luminal reference cone"
      output := "Delivered carrier state" }
  , { step := "Unload and identify"
      requirement := "The output sector preserves charges, residues, and branch identity"
      output := "Recovered luminal object sector" } ]

structure HardCriterion where
  code : String
  statement : String
  deriving Repr

def hardCriteria : List HardCriterion :=
  [ { code := "H1", statement := "The superluminal carrier branch contains a real transport window above the luminal reference speed." }
  , { code := "H2", statement := "Branch switching remains controlled and does not randomize branch occupation." }
  , { code := "H3", statement := "The transported object preserves identity, charges, and residues." }
  , { code := "H4", statement := "For composite objects the carrier branch preserves binding rather than dissolving the assembly." } ]

structure HardFailureMode where
  code : String
  statement : String
  deriving Repr

def hardFailureModes : List HardFailureMode :=
  [ { code := "HF1", statement := "The carrier branch loses its isolated pole and the object dissolves into the continuum." }
  , { code := "HF2", statement := "The output object matches only semantically and fails structural identity." }
  , { code := "HF3", statement := "Composite binding collapses in the carrier branch." }
  , { code := "HF4", statement := "The apparent FTL effect is only an observer projection artifact and not true transport." } ]

theorem hardProtocol_length : hardProtocol.length = 4 := by
  rfl

theorem hardCriteria_length : hardCriteria.length = 4 := by
  rfl

theorem hardFailureModes_length : hardFailureModes.length = 4 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
