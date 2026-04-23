import PhysicsLean.Technology.Materialization.Source.«161_GlobalTheorem»

namespace PhysicsLean
namespace Technology.Materialization.Source

def closureLadder : List String :=
  [ "H0 hard body"
  , "H1 usable body"
  , "H2 simple device"
  , "H3 stateful device"
  , "H4 adaptive device"
  , "H5 strongly adaptive device"
  , "H6 proto-agent object"
  , "H7 self-extending fabricator"
  , "H8 self-fabricating system" ]

def closureLadderAdmissible : Prop :=
  0 < closureLadder.length

def closureLevelIndex (label : String) : Nat :=
  match closureLadder.idxOf? label with
  | some index => index
  | none => closureLadder.length

theorem closureLadder_nonempty : closureLadderAdmissible := by
  simp [closureLadderAdmissible, closureLadder]

end Technology.Materialization.Source
end PhysicsLean
