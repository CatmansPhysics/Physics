import PhysicsLean.StandardModel.Color.ConfinementTarget

namespace PhysicsLean

def anomalyCompatible (charges : List Rat) : Prop :=
  charges.sum = 0

theorem anomalyCompatible_nil : anomalyCompatible [] := by
  simp [anomalyCompatible]

end PhysicsLean
