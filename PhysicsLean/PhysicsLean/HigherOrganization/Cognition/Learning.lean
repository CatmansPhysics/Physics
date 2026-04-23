import PhysicsLean.HigherOrganization.Cognition.InternalModel

namespace PhysicsLean

def updateBeliefs {σ : Type _} (model : InternalModel σ) (observation : σ) : InternalModel σ :=
  { beliefs := observation :: model.beliefs }

end PhysicsLean
