import PhysicsLean.StructuralCore.Series.Coefficients

/-!
# Pattern Series

This file upgrades pattern coefficients to graded series. The grading indexes
which pattern-quotient terms appear in each component and prepares the data for
the later assembly-series and transfer layers.
-/

namespace PhysicsLean

structure PatternSeries (X : SeqSEqObject) (E : HPatternExtractor X)
    (ι : Type _) [AddMonoid ι] where
  coeff : ι → PatternCoefficient E

namespace PatternSeries

variable {X : SeqSEqObject} {E : HPatternExtractor X} {ι κ : Type _}
variable [AddMonoid ι] [AddMonoid κ]

def supportAt (S : PatternSeries X E ι) (i : ι) : List (HPatternQuotient E) :=
  (S.coeff i).terms

end PatternSeries

def patternSeriesOf {X : SeqSEqObject} (E : HPatternExtractor X)
  {ι : Type _} [AddMonoid ι] [DecidableEq ι] (grading : AdmissibleGrading X ι)
    (support : List X.Word) : PatternSeries X E ι where
  coeff i :=
    { terms := support.foldr (fun w acc =>
        if grading.grade w = i then mkHPatternQuotient E w :: acc else acc) [] }

theorem patternSeries_support_mem {X : SeqSEqObject} (E : HPatternExtractor X)
  {ι : Type _} [AddMonoid ι] [DecidableEq ι] (grading : AdmissibleGrading X ι)
    (support : List X.Word) (i : ι) (w : X.Word)
    (hw : w ∈ support) (hgrade : grading.grade w = i) :
  mkHPatternQuotient E w ∈ ((patternSeriesOf E grading support).coeff i).terms := by
  unfold patternSeriesOf
  induction support with
  | nil =>
      cases hw
  | cons a rest ih =>
      simp at hw
      rcases hw with rfl | hw
      · simp [hgrade]
      · by_cases hrest : grading.grade a = i
        · simp [hrest, ih hw]
        · simp [hrest, ih hw]

end PhysicsLean
