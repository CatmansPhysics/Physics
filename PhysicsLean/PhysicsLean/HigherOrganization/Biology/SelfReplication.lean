import PhysicsLean.HigherOrganization.Biology.Viability

namespace PhysicsLean

structure SelfReplicationProfile where
  templateCopies : Nat
  fidelity : Rat

def stableReplication (profile : SelfReplicationProfile) : Prop :=
  profile.templateCopies > 0 ∧ profile.fidelity >= 0

end PhysicsLean
