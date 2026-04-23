import PhysicsLean.StructuralCore.HPattern.Extractor

/-!
# H-Pattern Quotients

This file defines the equivalence relation identifying words whose extracted
patterns are isomorphic. It is the quotient layer that lets later series and
transfer constructions depend only on pattern shape rather than on a specific
word representative.
-/

namespace PhysicsLean

def h_equiv {X : SeqSEqObject} (E : HPatternExtractor X) (u v : X.Word) : Prop :=
  Nonempty (HPatternIsoData (E.toPattern u) (E.toPattern v))

namespace h_equiv

variable {X : SeqSEqObject} (E : HPatternExtractor X)

theorem refl (u : X.Word) : h_equiv E u u :=
  ⟨HPatternIsoData.refl _⟩

theorem symm {u v : X.Word} : h_equiv E u v → h_equiv E v u := by
  intro huv
  rcases huv with ⟨h⟩
  exact ⟨HPatternIsoData.symm h⟩

theorem trans {u v w : X.Word} : h_equiv E u v → h_equiv E v w → h_equiv E u w := by
  intro huv hvw
  rcases huv with ⟨h₁⟩
  rcases hvw with ⟨h₂⟩
  exact ⟨HPatternIsoData.trans h₁ h₂⟩

end h_equiv

def hSetoid {X : SeqSEqObject} (E : HPatternExtractor X) : Setoid X.Word where
  r := h_equiv E
  iseqv := ⟨h_equiv.refl E, h_equiv.symm E, h_equiv.trans E⟩

abbrev HPatternQuotient {X : SeqSEqObject} (E : HPatternExtractor X) :=
  Quotient (hSetoid E)

def mkHPatternQuotient {X : SeqSEqObject} (E : HPatternExtractor X) (w : X.Word) :
    HPatternQuotient E :=
  Quotient.mk _ w

theorem h_equiv_of_reduction {X : SeqSEqObject} (E : HPatternExtractor X)
    {r : X.Word → X.Word} (hr : X.localReduction r) (w : X.Word) :
    h_equiv E w (r w) :=
  ⟨E.well_defined_under_reduction hr w⟩

end PhysicsLean
