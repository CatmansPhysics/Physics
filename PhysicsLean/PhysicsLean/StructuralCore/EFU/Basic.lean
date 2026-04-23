import PhysicsLean.StructuralCore.HPattern.Category

/-!
# EFU Basic Layer

This file defines the elementary EFU notions used later in canonical
decomposition arguments: irreducibility of extracted patterns, EFU objects, and
assembly of EFU factors back into a word.
-/

namespace PhysicsLean

def HPatternIrreducible {X : SeqSEqObject} (P : HPattern X) : Prop :=
  ∀ u v : P.Cell, ¬ P.precedes u v → ¬ P.precedes v u → u = v

def EFUObject {X : SeqSEqObject} (E : HPatternExtractor X) (w : X.Word) : Prop :=
  HPatternIrreducible (E.toPattern w)

def assembleEFUFactors (X : SeqSEqObject) (factors : List X.Word) : X.Word :=
  factors.foldl X.compose X.neutral

@[simp] theorem assembleEFUFactors_nil (X : SeqSEqObject) :
    assembleEFUFactors X [] = X.neutral := rfl

@[simp] theorem assembleEFUFactors_cons (X : SeqSEqObject) (w : X.Word) (factors : List X.Word) :
    assembleEFUFactors X (w :: factors) =
      List.foldl X.compose (X.compose X.neutral w) factors := by
  rfl

structure EFUDecomposition {X : SeqSEqObject} (E : HPatternExtractor X) (w : X.Word) where
  residue : X.Word
  factors : List X.Word
  residue_trivial : h_equiv E residue X.neutral
  factors_are_efu : ∀ u : X.Word, u ∈ factors → EFUObject E u
  assembles : h_equiv E w (X.compose residue (assembleEFUFactors X factors))

def EFUDecomposition.rank {X : SeqSEqObject} {E : HPatternExtractor X} {w : X.Word}
    (d : EFUDecomposition E w) : Nat :=
  d.factors.length

def EFUNeutral {X : SeqSEqObject} (E : HPatternExtractor X) (w : X.Word) : Prop :=
  EFUObject E w ∧ X.semantics w = X.semantics X.neutral

def EFUCharged {X : SeqSEqObject} (E : HPatternExtractor X) (w : X.Word) : Prop :=
  EFUObject E w ∧ X.semantics w ≠ X.semantics X.neutral

def EFUAdmissibleDecomposition {X : SeqSEqObject} (E : HPatternExtractor X) (w : X.Word) : Prop :=
  Nonempty (EFUDecomposition E w)

end PhysicsLean
