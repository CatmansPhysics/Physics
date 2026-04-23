import PhysicsLean.Technology.Materialization.Source.«167_InverseDesignAudit»
import PhysicsLean.Technology.Materialization.Source.«161_GlobalTheorem»

namespace PhysicsLean
namespace Technology.Materialization.Source

def finalAuditedStatement : String :=
  "Materialization is an audited hierarchical realization problem with explicit lower-chain closure and higher-level audited lift structure."

def finalAuditedStatementHolds (realizer : AuditedHierarchicalRealizer) : Prop :=
  auditedHierarchicalRealizerAdmissible realizer ∧ lowerLevelClosed realizer

end Technology.Materialization.Source
end PhysicsLean
