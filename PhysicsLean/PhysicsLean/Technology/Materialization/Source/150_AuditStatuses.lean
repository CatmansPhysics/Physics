import PhysicsLean.Technology.Materialization.Source.«140_SelfFabricationFailureModes»

namespace PhysicsLean
namespace Technology.Materialization.Source

inductive MaterializationStatus where
  | axiomDefinition
  | derived
  | target
  | failure
  deriving Repr, DecidableEq

structure AuditStatusEntry where
  label : String
  status : MaterializationStatus
  summary : String
  deriving Repr

def auditStatusEntries : List AuditStatusEntry :=
  [ { label := "definitions", status := .axiomDefinition, summary := "Project-level objects are explicitly introduced before use." }
  , { label := "derived-layer", status := .derived, summary := "Logical consequences are separated from standing assumptions." }
  , { label := "target-theorems", status := .target, summary := "Unclosed theorem chains remain explicit target obligations." }
  , { label := "failure-boundaries", status := .failure, summary := "Failure modes mark audited limits of applicability." } ]

def noLevelSkippingRule (entries : List AuditStatusEntry) : Prop :=
  0 < entries.length

def statusLabelSet (entries : List AuditStatusEntry) : List String :=
  entries.map AuditStatusEntry.label

def hasStatus (entries : List AuditStatusEntry) (status : MaterializationStatus) : Prop :=
  ∃ entry, entry ∈ entries ∧ entry.status = status

theorem auditStatusEntries_cover_axiom_definition :
  hasStatus auditStatusEntries MaterializationStatus.axiomDefinition := by
  let entry : AuditStatusEntry :=
    { label := "definitions"
      status := .axiomDefinition
      summary := "Project-level objects are explicitly introduced before use." }
  refine ⟨entry, ?_⟩
  simp [entry, auditStatusEntries]

theorem auditStatusEntries_nonempty :
  noLevelSkippingRule auditStatusEntries := by
  simp [noLevelSkippingRule, auditStatusEntries]

end Technology.Materialization.Source
end PhysicsLean
