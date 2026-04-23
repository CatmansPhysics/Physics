import PhysicsLean.Audit.FailureModes.Core

namespace PhysicsLean

def standardModelFailureModes : List String :=
  coreFailureModes ++ ["branch proliferation", "dictionary normalization mismatch", "confinement target failure"]

end PhysicsLean
