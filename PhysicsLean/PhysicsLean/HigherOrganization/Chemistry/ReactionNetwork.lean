import PhysicsLean.HigherOrganization.Chemistry.BindingGraph

namespace PhysicsLean

structure ReactionNetwork (α : Type _) where
  graph : BindingGraph α
  reactions : List (List α × List α)

end PhysicsLean
