import PhysicsLean.StandardModel.Dictionary.ObserverDecategorification

namespace PhysicsLean

structure EffectiveImage where
  fields : List String

def ofSector (sector : ResidueSector) : EffectiveImage :=
  { fields := observerDecategorify sector }

end PhysicsLean
