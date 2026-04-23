import PhysicsLean.Technology.FTL.Source.«109_HardRemainingTargets»

namespace PhysicsLean
namespace Technology.FTL.Source

inductive FTLChapterState
  | softClosed
  | hardOpen
  | fullAuditPending
  deriving DecidableEq, Repr

def currentFTLChapterState : List FTLChapterState :=
  [FTLChapterState.softClosed, FTLChapterState.hardOpen, FTLChapterState.fullAuditPending]

def hardRoadmapOrder : List String :=
  ["Freeze soft", "H-C1", "H-C2", "H-C3", "H-C4", "H-C5", "Final FTL audit"]

structure FTLCompletionConditions where
  softClosureExplicit : Prop
  hardStatusExplicit : Prop
  finalAuditExplicit : Prop

def completeFTLChapter (conditions : FTLCompletionConditions) : Prop :=
  conditions.softClosureExplicit ∧ conditions.hardStatusExplicit ∧ conditions.finalAuditExplicit

def currentFTLCompletionConditions : FTLCompletionConditions :=
  { softClosureExplicit := True
    hardStatusExplicit := hardRemainingTargets.length = 5
    finalAuditExplicit := False }

end Technology.FTL.Source
end PhysicsLean
