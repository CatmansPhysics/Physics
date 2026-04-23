import PhysicsLean.StructuralCore.Series.PatternSeries

/-!
# Assembly Series

This file packages graded families of assembled pattern words. It is the series
layer closest to the transfer kernels, where each coefficient is now a list of
assembly words rather than single pattern terms.
-/

namespace PhysicsLean

abbrev AssemblyWord {X : SeqSEqObject} (E : HPatternExtractor X) := List (HPatternQuotient E)

structure AssemblySeries (X : SeqSEqObject) (E : HPatternExtractor X)
    (ι : Type _) [AddMonoid ι] where
  coeff : ι → List (AssemblyWord E)

namespace AssemblySeries

variable {X : SeqSEqObject} {E : HPatternExtractor X} {ι : Type _}
variable [AddMonoid ι]

def supportAt (S : AssemblySeries X E ι) (i : ι) : List (AssemblyWord E) :=
  S.coeff i

def nonemptyAt (S : AssemblySeries X E ι) (i : ι) : Prop :=
  S.supportAt i ≠ []

theorem nonemptyAt_of_mem {S : AssemblySeries X E ι} {i : ι} {word : AssemblyWord E}
    (hmem : word ∈ S.supportAt i) :
    S.nonemptyAt i := by
  intro hempty
  rw [show S.supportAt i = [] from hempty] at hmem
  cases hmem

end AssemblySeries

def assemblySeriesOf {X : SeqSEqObject} (E : HPatternExtractor X)
  {ι : Type _} [AddMonoid ι] [DecidableEq ι] (grading : AdmissibleGrading X ι)
    (support : List (List X.Word)) : AssemblySeries X E ι where
  coeff i :=
    support.foldr (fun factors acc =>
      let assembled := assembleEFUFactors X factors
      if grading.grade assembled = i then
        (factors.map (mkHPatternQuotient E)) :: acc
      else
        acc) []

theorem assembly_series_defined {X : SeqSEqObject} (E : HPatternExtractor X)
  {ι : Type _} [AddMonoid ι] [DecidableEq ι] (grading : AdmissibleGrading X ι)
    (support : List (List X.Word)) :
    Nonempty (AssemblySeries X E ι) :=
  ⟨assemblySeriesOf E grading support⟩

theorem assemblySeries_support_mem {X : SeqSEqObject} (E : HPatternExtractor X)
  {ι : Type _} [AddMonoid ι] [DecidableEq ι] (grading : AdmissibleGrading X ι)
    (support : List (List X.Word)) (i : ι) (factors : List X.Word)
    (hfactors : factors ∈ support)
    (hgrade : grading.grade (assembleEFUFactors X factors) = i) :
    factors.map (mkHPatternQuotient E) ∈ (assemblySeriesOf E grading support).coeff i := by
  unfold assemblySeriesOf
  induction support with
  | nil =>
      cases hfactors
  | cons a rest ih =>
      simp at hfactors
      rcases hfactors with rfl | hfactors
      · simp [hgrade]
      · by_cases hrest : grading.grade (assembleEFUFactors X a) = i
        · simp [hrest, ih hfactors]
        · simp [hrest, ih hfactors]

end PhysicsLean
