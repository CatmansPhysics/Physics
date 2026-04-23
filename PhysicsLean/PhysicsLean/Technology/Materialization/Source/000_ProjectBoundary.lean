namespace PhysicsLean
namespace Technology.Materialization.Source

structure ProjectBoundary where
  observerRelative : Prop
  noExNihilo : Prop
  persistenceWindow : Nat
  deriving Repr

def defaultProjectBoundary : ProjectBoundary :=
  { observerRelative := True
    noExNihilo := True
    persistenceWindow := 1 }

end Technology.Materialization.Source
end PhysicsLean
