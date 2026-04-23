import PhysicsLean.StructuralCore.EFU.CanonicalZSym

/-!
# Pattern Coefficients

This file defines the coefficient objects used in the pattern-series layer.
Each coefficient stores a list of pattern-quotient terms, together with the
basic empty/append operations needed to assemble formal series.
-/

namespace PhysicsLean

structure PatternCoefficient {X : SeqSEqObject} (E : HPatternExtractor X) where
  terms : List (HPatternQuotient E)

def PatternCoefficient.empty {X : SeqSEqObject} (E : HPatternExtractor X) : PatternCoefficient E where
  terms := []

def PatternCoefficient.append {X : SeqSEqObject} {E : HPatternExtractor X}
    (a b : PatternCoefficient E) : PatternCoefficient E where
  terms := a.terms ++ b.terms

@[simp] theorem PatternCoefficient.empty_terms {X : SeqSEqObject} (E : HPatternExtractor X) :
    (PatternCoefficient.empty E).terms = [] := rfl

@[simp] theorem PatternCoefficient.append_terms {X : SeqSEqObject} {E : HPatternExtractor X}
    (a b : PatternCoefficient E) :
    (PatternCoefficient.append a b).terms = a.terms ++ b.terms := rfl

structure AdmissibleGrading (X : SeqSEqObject) (ι : Type _) [AddMonoid ι] where
  grade : X.Word → ι
  map_compose : ∀ u v : X.Word, grade (X.compose u v) = grade u + grade v

end PhysicsLean
