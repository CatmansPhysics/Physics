import PhysicsLean.Technology.Materialization.Source.«079_InversePipeline»

namespace PhysicsLean
namespace Technology.Materialization.Source

def inverseFailureModes : List MaterializationFailureMode :=
  [ { code := "M-F29", statement := "The candidate search space grows too quickly with specification complexity." }
  , { code := "M-F30", statement := "A coarse abstraction creates false feasibility for the fabrication plan." }
  , { code := "M-F31", statement := "Template-first search commits too early and misses the optimal channel." }
  , { code := "M-F32", statement := "Budget-myopic search optimizes one coordinate and loses Pareto quality." }
  , { code := "M-F33", statement := "Search ignores repairability and overvalues low initial defect counts." }
  , { code := "M-F34", statement := "The architecture class is underfit and the search never escalates it." } ]

end Technology.Materialization.Source
end PhysicsLean
