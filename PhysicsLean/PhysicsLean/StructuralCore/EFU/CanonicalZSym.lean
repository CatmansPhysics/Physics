import PhysicsLean.StructuralCore.EFU.Decomposition
import PhysicsLean.StructuralCore.Models.ZSym.Object

/-!
# Canonical EFU Decomposition for `Z_sym`

This file specializes the abstract EFU decomposition machinery to the concrete
`Z_sym` object. It packages the data asserting that the chosen decomposition is
canonical on that model.
-/

namespace PhysicsLean

structure ZSymEFUDecompositionData where
  extractor : HPatternExtractor zsym_object
  system : EFUDecompositionSystem zsym_object extractor
  canonical : ∀ w : zsym_object.Word,
    ∀ d₁ d₂ : EFUDecomposition extractor w,
      d₁ = system.decompose w → d₂ = system.decompose w → d₁ = d₂

theorem efu_decomposition_canonical_zsym
    (data : ZSymEFUDecompositionData) (w : zsym_object.Word)
    (d₁ d₂ : EFUDecomposition data.extractor w)
    (h₁ : d₁ = data.system.decompose w)
    (h₂ : d₂ = data.system.decompose w) :
    d₁ = d₂ :=
  data.canonical w d₁ d₂ h₁ h₂

theorem EFU_decomposition_exists
    (data : ZSymEFUDecompositionData) (w : zsym_object.Word) :
    Nonempty (EFUDecomposition data.extractor w) :=
  efu_decomposition_exists data.system w

theorem EFU_decomposition_canonical_Zsym
    (data : ZSymEFUDecompositionData) (w : zsym_object.Word)
    (d₁ d₂ : EFUDecomposition data.extractor w)
    (h₁ : d₁ = data.system.decompose w)
    (h₂ : d₂ = data.system.decompose w) :
    d₁ = d₂ :=
  efu_decomposition_canonical_zsym data w d₁ d₂ h₁ h₂

end PhysicsLean
