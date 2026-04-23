import PhysicsLean.Audit.FailureModes.StandardModel
import PhysicsLean.Audit.Status.StatementStatus
import PhysicsLean.Audit.Status.Provenance

namespace PhysicsLean

structure CoverageEntry where
  component : String
  status : StatementStatus
  provenance : Provenance

def defaultCoverageMatrix : List CoverageEntry :=
  [
    ⟨"structural core", StatementStatus.derivedTheorem, Provenance.internal⟩,
    ⟨"observer dictionary", StatementStatus.derivedTheorem, Provenance.internalToEffective⟩,
    ⟨"confinement", StatementStatus.targetTheorem, Provenance.openTarget⟩
  ]

end PhysicsLean
