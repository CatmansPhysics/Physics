namespace PhysicsLean
namespace Technology.FTL.Source

def sourceFile : String := "docs/Technology/FTL_v1.md"

inductive ScopeLabel
  | sourceAligned
  | observerRelative
  | effectiveTransport
  | targetLevel
  deriving DecidableEq, Repr

structure ProjectPreamble where
  projectCode : String
  chapterCode : String
  sourceLineStart : Nat
  sourceLineEnd : Nat
  labels : List ScopeLabel
  deriving Repr

def ftlSourcePreamble : ProjectPreamble :=
  { projectCode := "FTL"
    chapterCode := "X"
    sourceLineStart := 1
    sourceLineEnd := 20844
    labels := [ScopeLabel.sourceAligned, ScopeLabel.observerRelative, ScopeLabel.effectiveTransport, ScopeLabel.targetLevel] }

theorem ftlSourceLineRange : ftlSourcePreamble.sourceLineStart = 1 ∧ ftlSourcePreamble.sourceLineEnd = 20844 := by
  exact And.intro rfl rfl

end Technology.FTL.Source
end PhysicsLean
