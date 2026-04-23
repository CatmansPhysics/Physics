namespace PhysicsLean

inductive Provenance
  | internal
  | internalToEffective
  | importedContinuum
  | openTarget
  deriving DecidableEq, Repr

end PhysicsLean
