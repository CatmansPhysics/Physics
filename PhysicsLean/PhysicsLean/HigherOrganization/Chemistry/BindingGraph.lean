import PhysicsLean.ContinuumField.ManyBody.Topology

namespace PhysicsLean

structure BindingGraph (α : Type _) where
  nodes : List α
  bonds : List (α × α)

end PhysicsLean
