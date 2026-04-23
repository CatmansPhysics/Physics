import Mathlib.CategoryTheory.Discrete.Basic
import PhysicsLean.StructuralCore.HPattern.Quotient

/-!
# The Category of H-Patterns

This file equips extracted patterns with their categorical structure. It is the
formal home for composing pattern maps once the basic `HPattern` objects and
their quotient language have been set up.
-/

namespace PhysicsLean

open CategoryTheory

abbrev HPatCat (X : SeqSEqObject) := HPattern X

instance hpattern_category (X : SeqSEqObject) : CategoryTheory.Category (HPatCat X) where
  Hom P Q := HPatternHom P Q
  id := HPatternHom.id
  comp f g := HPatternHom.comp g f
  id_comp := by
    intro P Q f
    cases f
    rfl
  comp_id := by
    intro P Q f
    cases f
    rfl
  assoc := by
    intro P Q R S f g h
    cases f
    cases g
    cases h
    rfl

def hpattern_extractor_functor {X : SeqSEqObject} (E : HPatternExtractor X) :
    Discrete X.Word ⥤ HPatCat X where
  obj w := E.toPattern w.as
  map := by
    intro w₁ w₂ h
    rcases h with ⟨⟨hw⟩⟩
    exact eqToHom (congrArg E.toPattern hw)
  map_id := by
    intro w
    simp
  map_comp := by
    intro X₁ X₂ X₃ f g
    discrete_cases
    cases f
    cases g
    simp

theorem HPat_functor_exists {X : SeqSEqObject} (E : HPatternExtractor X) :
    Nonempty (Discrete X.Word ⥤ HPatCat X) :=
  ⟨hpattern_extractor_functor E⟩

end PhysicsLean
