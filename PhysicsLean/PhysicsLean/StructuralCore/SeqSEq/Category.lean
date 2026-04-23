import PhysicsLean.StructuralCore.SeqSEq.Normalization

/-!
# SeqSEq Category

This file defines homomorphisms between `SeqSEqObject`s and equips them with the
expected categorical structure. The morphisms preserve composition, neutral
elements, semantics, and local reduction behavior.
-/

namespace PhysicsLean

open CategoryTheory

@[ext] structure SeqSEqHom (X Y : SeqSEqObject) where
  baseHom : SymbolicStructureHom X.base Y.base
  toWord : X.Word → Y.Word
  map_compose : ∀ u v : X.Word,
    toWord (X.compose u v) = Y.compose (toWord u) (toWord v)
  map_neutral : toWord X.neutral = Y.neutral
  map_semantics : ∀ w : X.Word,
    baseHom.mapSemantics (X.semantics w) = Y.semantics (toWord w)
  preserves_localReduction : ∀ ⦃r : X.Word → X.Word⦄,
    X.localReduction r →
      ∃ s : Y.Word → Y.Word, Y.localReduction s ∧ ∀ w : X.Word, toWord (r w) = s (toWord w)

namespace SeqSEqHom

instance {X Y : SeqSEqObject} : CoeFun (SeqSEqHom X Y) (fun _ => X.Word → Y.Word) where
  coe f := f.toWord

def id (X : SeqSEqObject) : SeqSEqHom X X where
  baseHom := SymbolicStructureHom.id X.base
  toWord := _root_.id
  map_compose := by
    intro u v
    rfl
  map_neutral := rfl
  map_semantics := by
    intro w
    rfl
  preserves_localReduction := by
    intro r hr
    exact ⟨r, hr, by intro w; rfl⟩

def comp {X Y Z : SeqSEqObject} (g : SeqSEqHom Y Z) (f : SeqSEqHom X Y) : SeqSEqHom X Z where
  baseHom := SymbolicStructureHom.comp g.baseHom f.baseHom
  toWord := g ∘ f
  map_compose := by
    intro u v
    simp [Function.comp, f.map_compose u v, g.map_compose (f u) (f v)]
  map_neutral := by
    simp [Function.comp, f.map_neutral, g.map_neutral]
  map_semantics := by
    intro w
    change g.baseHom.mapSemantics (f.baseHom.mapSemantics (X.semantics w)) =
      Z.semantics (g (f w))
    rw [f.map_semantics w, g.map_semantics (f w)]
  preserves_localReduction := by
    intro r hr
    rcases f.preserves_localReduction hr with ⟨sY, hsY, commY⟩
    rcases g.preserves_localReduction hsY with ⟨sZ, hsZ, commZ⟩
    refine ⟨sZ, hsZ, ?_⟩
    intro w
    calc
      g (f (r w)) = g (sY (f w)) := by rw [commY w]
      _ = sZ (g (f w)) := commZ (f w)

@[simp] theorem id_apply (X : SeqSEqObject) (w : X.Word) : id X w = w := rfl

@[simp] theorem comp_apply {X Y Z : SeqSEqObject}
    (g : SeqSEqHom Y Z) (f : SeqSEqHom X Y) (w : X.Word) :
    comp g f w = g (f w) := rfl

end SeqSEqHom

abbrev SeqSEqCat := SeqSEqObject

instance seqseq_category : CategoryTheory.Category SeqSEqCat where
  Hom X Y := SeqSEqHom X Y
  id := SeqSEqHom.id
  comp f g := SeqSEqHom.comp g f
  id_comp := by
    intro X Y f
    cases f
    rfl
  comp_id := by
    intro X Y f
    cases f
    rfl
  assoc := by
    intro W X Y Z f g h
    cases f
    cases g
    cases h
    rfl

@[simp] theorem seqseq_id_apply (X : SeqSEqCat) (w : X.Word) :
    SeqSEqHom.id X w = w := rfl

@[simp] theorem seqseq_comp_apply {X Y Z : SeqSEqCat}
    (f : SeqSEqHom X Y) (g : SeqSEqHom Y Z) (w : X.Word) :
    SeqSEqHom.comp g f w = g (f w) := rfl

end PhysicsLean
