import PhysicsLean.HigherOrganization.FormalKnowledge.FormalSystem

namespace PhysicsLean

def certifiedTheorem (system : FormalSystem) (statement : String) : Bool :=
  statement ∈ system.theorems

end PhysicsLean
