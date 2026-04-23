import PhysicsLean.StructuralCore.HPattern.Basic

/-!
# H-Pattern Extractors

This file defines the interface turning words in a `SeqSEqObject` into
`HPattern`s. The key requirement is compatibility with local reductions in both
directions, so extractor output is stable under rewrite moves.
-/

namespace PhysicsLean

structure HPatternExtractor (X : SeqSEqObject) where
  toPattern : X.Word → HPattern X
  reduction_forward : ∀ {r : X.Word → X.Word},
    X.localReduction r → ∀ w : X.Word,
      HPatternHom (toPattern w) (toPattern (r w))
  reduction_backward : ∀ {r : X.Word → X.Word},
    X.localReduction r → ∀ w : X.Word,
      HPatternHom (toPattern (r w)) (toPattern w)

namespace HPatternExtractor

variable {X : SeqSEqObject}

def well_defined_under_reduction (E : HPatternExtractor X)
    {r : X.Word → X.Word} (hr : X.localReduction r) (w : X.Word) :
    HPatternIsoData (E.toPattern w) (E.toPattern (r w)) where
  hom := E.reduction_forward hr w
  inv := E.reduction_backward hr w

end HPatternExtractor

end PhysicsLean
