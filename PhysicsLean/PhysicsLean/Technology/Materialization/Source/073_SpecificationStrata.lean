import PhysicsLean.Technology.Materialization.Source.«072_RealizabilityMap»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure SpecificationComplexityIndex where
  geometry : Nat
  composition : Nat
  functionality : Nat
  tolerance : Nat
  persistence : Nat
  deriving Repr

def totalSpecificationComplexity (index : SpecificationComplexityIndex) : Nat :=
  index.geometry + index.composition + index.functionality + index.tolerance + index.persistence

inductive SpecificationStratum where
  | s0
  | s1
  | s2
  | s3
  | s4
  | higher
  deriving Repr, DecidableEq

def specificationStratum (index : SpecificationComplexityIndex) : SpecificationStratum :=
  let total := totalSpecificationComplexity index
  if total <= 2 then
    SpecificationStratum.s0
  else if total <= 4 then
    SpecificationStratum.s1
  else if total <= 6 then
    SpecificationStratum.s2
  else if total <= 8 then
    SpecificationStratum.s3
  else if total <= 10 then
    SpecificationStratum.s4
  else
    SpecificationStratum.higher

def architectureThresholdsGrowWithComplexity (index : SpecificationComplexityIndex) : Prop :=
  match specificationStratum index with
  | .s0 => True
  | .s1 => index.geometry + index.composition <= totalSpecificationComplexity index
  | .s2 => index.functionality <= totalSpecificationComplexity index
  | .s3 => index.tolerance <= totalSpecificationComplexity index
  | .s4 => index.persistence <= totalSpecificationComplexity index
  | .higher => 0 < totalSpecificationComplexity index

end Technology.Materialization.Source
end PhysicsLean
