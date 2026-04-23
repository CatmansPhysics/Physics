namespace PhysicsLean

inductive StatementStatus
  | definitionAxiom
  | derivedTheorem
  | targetTheorem
  | failureMode
  deriving DecidableEq, Repr

end PhysicsLean
