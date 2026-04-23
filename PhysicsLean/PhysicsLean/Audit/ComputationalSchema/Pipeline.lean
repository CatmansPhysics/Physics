import PhysicsLean.Audit.Coverage.Matrix

namespace PhysicsLean

inductive ComputationalStep
  | structuralInitialization
  | poleResidueExtraction
  | internalObservableExtraction
  | electroweakRestriction
  | flavourColorConstruction
  | observableExtraction
  | observerDictionary
  deriving DecidableEq, Repr

def defaultPipeline : List ComputationalStep :=
  [ .structuralInitialization
  , .poleResidueExtraction
  , .internalObservableExtraction
  , .electroweakRestriction
  , .flavourColorConstruction
  , .observableExtraction
  , .observerDictionary
  ]

end PhysicsLean
