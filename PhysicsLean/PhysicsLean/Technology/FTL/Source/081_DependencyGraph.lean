import PhysicsLean.Technology.FTL.Source.«080_MinimalAxioms»

namespace PhysicsLean
namespace Technology.FTL.Source

inductive DependencyNode
  | a0 | a1 | a2 | a3 | a4 | a5
  | k0 | k1
  | s0 | s1 | s2 | s3 | s4 | s5 | s6 | s7
  | h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7 | h8 | h9
  deriving DecidableEq, Repr

structure DependencyEdge where
  source : DependencyNode
  target : DependencyNode
  reason : String
  deriving Repr

def baseEdges : List DependencyEdge :=
  [ { source := DependencyNode.a0, target := DependencyNode.k0, reason := "Structural primacy feeds kernel closure." }
  , { source := DependencyNode.a1, target := DependencyNode.k0, reason := "Observer relativity fixes the observer-dependent kernel reading." }
  , { source := DependencyNode.a4, target := DependencyNode.k1, reason := "Spectral readability allows branch and pole extraction." }
  , { source := DependencyNode.k0, target := DependencyNode.k1, reason := "Kernels must close before dominant branches are extracted." }
  , { source := DependencyNode.a2, target := DependencyNode.h1, reason := "The luminal reference is required before a carrier can be called superluminal." }
  , { source := DependencyNode.k1, target := DependencyNode.h1, reason := "Carrier existence is read at the branch level." } ]

def softEdges : List DependencyEdge :=
  [ { source := DependencyNode.k0, target := DependencyNode.s0, reason := "A soft link sector must be kernel-admissible." }
  , { source := DependencyNode.s0, target := DependencyNode.s1, reason := "Non-factorizable accessibility refines the link-sector object." }
  , { source := DependencyNode.s1, target := DependencyNode.s2, reason := "Remote imprint is meaningful only after non-factorizable accessibility is fixed." }
  , { source := DependencyNode.s2, target := DependencyNode.s3, reason := "Detector classicalization acts on remote-conditioned detector states." }
  , { source := DependencyNode.s3, target := DependencyNode.s4, reason := "A temporal readout window depends on detector classicalization." }
  , { source := DependencyNode.s4, target := DependencyNode.s5, reason := "The binary witness theorem uses the stabilized readout window." }
  , { source := DependencyNode.s5, target := DependencyNode.s6, reason := "Finite scanning strengthens the binary witness theorem." }
  , { source := DependencyNode.a5, target := DependencyNode.s7, reason := "Soft robustness requires explicit failure-mode completeness." } ]

def hardEdges : List DependencyEdge :=
  [ { source := DependencyNode.k1, target := DependencyNode.h0, reason := "Stable object sectors are read from branch and pole data." }
  , { source := DependencyNode.h0, target := DependencyNode.h2, reason := "Branch transfer needs a stable object sector." }
  , { source := DependencyNode.h1, target := DependencyNode.h2, reason := "Branch transfer also needs a carrier sector." }
  , { source := DependencyNode.h2, target := DependencyNode.h3, reason := "Adiabatic switching is a property of the transfer shell." }
  , { source := DependencyNode.h2, target := DependencyNode.h4, reason := "Identity preservation is checked across the transfer cycle." }
  , { source := DependencyNode.h2, target := DependencyNode.h5, reason := "Pole survival is checked along the transfer path." }
  , { source := DependencyNode.h5, target := DependencyNode.h6, reason := "Composite binding is relevant only after pole survival is secured." }
  , { source := DependencyNode.h5, target := DependencyNode.h7, reason := "One-pole hard transport requires pole survival." }
  , { source := DependencyNode.h4, target := DependencyNode.h7, reason := "One-pole hard transport also requires identity preservation." }
  , { source := DependencyNode.h6, target := DependencyNode.h8, reason := "Composite hard transport extends the one-pole theorem by adding binding stability." }
  , { source := DependencyNode.a5, target := DependencyNode.h9, reason := "Hard robustness needs explicit failure-mode completeness." } ]

theorem baseEdges_length : baseEdges.length = 6 := by
  rfl

theorem softEdges_length : softEdges.length = 8 := by
  rfl

theorem hardEdges_length : hardEdges.length = 11 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
