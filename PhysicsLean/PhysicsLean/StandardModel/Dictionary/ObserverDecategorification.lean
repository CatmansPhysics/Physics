import PhysicsLean.StandardModel.Anomaly.UniquenessTarget

namespace PhysicsLean

def observerDecategorify (sector : ResidueSector) : List String :=
  sector.observables.map ResidueObservable.name

end PhysicsLean
