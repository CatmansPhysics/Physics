import PhysicsLean.Technology.Materialization.Source.«068_SelfExtendingFabricator»

namespace PhysicsLean
namespace Technology.Materialization.Source

def budgetFailureModes : List MaterializationFailureMode :=
  [ { code := "M-F23", statement := "The action cost exceeds the allowed actuation regime." }
  , { code := "M-F24", statement := "Target information exists but control resources cannot exploit it." }
  , { code := "M-F25", statement := "Completion is affordable but usability repair exceeds the remaining budget." }
  , { code := "M-F26", statement := "Waste output exceeds the admissible disposal envelope." }
  , { code := "M-F27", statement := "A predictive fabricator succeeds but costs more than a templated one." }
  , { code := "M-F28", statement := "Separate budget coordinates look sufficient but no joint allocation exists." } ]

end Technology.Materialization.Source
end PhysicsLean
