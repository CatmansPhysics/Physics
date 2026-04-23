import PhysicsLean.StandardModel.Dictionary.EffectiveImage

namespace PhysicsLean

def lagrangianTerms (image : EffectiveImage) : List String :=
  image.fields.map fun field => s!"L[{field}]"

end PhysicsLean
