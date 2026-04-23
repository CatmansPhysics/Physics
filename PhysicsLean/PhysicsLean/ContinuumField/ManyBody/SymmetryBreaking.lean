import PhysicsLean.ContinuumField.ManyBody.Phases

namespace PhysicsLean

def symmetryBroken (phase : ManyBodyPhase) : Prop :=
  phase = ManyBodyPhase.ordered

end PhysicsLean
