import PhysicsLean.StructuralCore.SeqSEq.Object

/-!
# H-Pattern Basic Geometry

This file introduces the elementary interval language used to talk about
boundary locations inside pattern objects. These interval predicates are the
lowest-level geometric vocabulary for the `HPattern` layer.
-/

namespace PhysicsLean

structure BoundaryInterval where
  left : Nat
  right : Nat
  left_le_right : left ≤ right

namespace BoundaryInterval

def Contains (I J : BoundaryInterval) : Prop :=
  I.left ≤ J.left ∧ J.right ≤ I.right

def Intersects (I J : BoundaryInterval) : Prop :=
  max I.left J.left ≤ min I.right J.right

def Disjoint (I J : BoundaryInterval) : Prop :=
  I.right < J.left ∨ J.right < I.left

def OrderedBefore (I J : BoundaryInterval) : Prop :=
  I.right < J.left

@[simp] theorem contains_refl (I : BoundaryInterval) : Contains I I := by
  exact ⟨le_rfl, le_rfl⟩

theorem orderedBefore_disjoint {I J : BoundaryInterval} (h : OrderedBefore I J) : Disjoint I J :=
  Or.inl h

end BoundaryInterval

structure HPattern (X : SeqSEqObject) where
  boundaryCount : Nat
  Cell : Type
  cellFinite : Fintype Cell
  label : Cell → X.Word
  support : Cell → BoundaryInterval
  support_within : ∀ c : Cell, (support c).right ≤ boundaryCount
  precedes : Cell → Cell → Prop
  residue : X.Word
  laminar : ∀ u v : Cell,
    BoundaryInterval.Intersects (support u) (support v) →
      BoundaryInterval.Contains (support u) (support v) ∨
        BoundaryInterval.Contains (support v) (support u)
  precedes_support : ∀ {u v : Cell},
    precedes u v → BoundaryInterval.Contains (support v) (support u)
  incomparable_disjoint : ∀ {u v : Cell},
    ¬ precedes u v → ¬ precedes v u → u ≠ v →
      BoundaryInterval.Disjoint (support u) (support v)

attribute [instance] HPattern.cellFinite

namespace HPattern

variable {X : SeqSEqObject}

def cellCount (P : HPattern X) : Nat :=
  Fintype.card P.Cell

@[simp] theorem cellCount_nonneg (P : HPattern X) : 0 ≤ P.cellCount := by
  exact Nat.zero_le _

end HPattern

@[ext] structure HPatternHom {X : SeqSEqObject} (P Q : HPattern X) where
  onBoundary : Nat → Nat
  monotone_onBoundary : Monotone onBoundary
  boundary_le : ∀ i : Nat, i ≤ P.boundaryCount → onBoundary i ≤ Q.boundaryCount
  onCell : P.Cell → Q.Cell
  preserves_precedes : ∀ {u v : P.Cell}, P.precedes u v → Q.precedes (onCell u) (onCell v)
  preserves_label : ∀ u : P.Cell, Q.label (onCell u) = P.label u
  preserves_support : ∀ u : P.Cell,
    BoundaryInterval.Contains
      (Q.support (onCell u))
      { left := onBoundary (P.support u).left
        right := onBoundary (P.support u).right
        left_le_right := monotone_onBoundary (P.support u).left_le_right }
  preserves_residue : Q.residue = P.residue

namespace HPatternHom

variable {X : SeqSEqObject}

def id (P : HPattern X) : HPatternHom P P where
  onBoundary := _root_.id
  monotone_onBoundary := by
    intro a b hab
    exact hab
  boundary_le := by
    intro i hi
    exact hi
  onCell := _root_.id
  preserves_precedes := by
    intro u v huv
    exact huv
  preserves_label := by
    intro u
    rfl
  preserves_support := by
    intro u
    exact BoundaryInterval.contains_refl _
  preserves_residue := rfl

def comp {P Q R : HPattern X} (g : HPatternHom Q R) (f : HPatternHom P Q) : HPatternHom P R where
  onBoundary := g.onBoundary ∘ f.onBoundary
  monotone_onBoundary := by
    intro a b hab
    exact g.monotone_onBoundary (f.monotone_onBoundary hab)
  boundary_le := by
    intro i hi
    exact g.boundary_le (f.onBoundary i) (f.boundary_le i hi)
  onCell := g.onCell ∘ f.onCell
  preserves_precedes := by
    intro u v huv
    exact g.preserves_precedes (f.preserves_precedes huv)
  preserves_label := by
    intro u
    simp [Function.comp, g.preserves_label, f.preserves_label]
  preserves_support := by
    intro u
    rcases f.preserves_support u with ⟨hf_left, hf_right⟩
    rcases g.preserves_support (f.onCell u) with ⟨hg_left, hg_right⟩
    refine ⟨?_, ?_⟩
    · exact hg_left.trans (g.monotone_onBoundary hf_left)
    · exact (g.monotone_onBoundary hf_right).trans hg_right
  preserves_residue := by
    exact g.preserves_residue.trans f.preserves_residue

@[simp] theorem id_onCell {P : HPattern X} (u : P.Cell) : (id P).onCell u = u := rfl

@[simp] theorem comp_onCell {P Q R : HPattern X}
    (g : HPatternHom Q R) (f : HPatternHom P Q) (u : P.Cell) :
    (comp g f).onCell u = g.onCell (f.onCell u) := rfl

end HPatternHom

structure HPatternIsoData {X : SeqSEqObject} (P Q : HPattern X) where
  hom : HPatternHom P Q
  inv : HPatternHom Q P

namespace HPatternIsoData

variable {X : SeqSEqObject}

def refl (P : HPattern X) : HPatternIsoData P P where
  hom := HPatternHom.id P
  inv := HPatternHom.id P

def symm {P Q : HPattern X} (h : HPatternIsoData P Q) : HPatternIsoData Q P where
  hom := h.inv
  inv := h.hom

def trans {P Q R : HPattern X} (h₁ : HPatternIsoData P Q) (h₂ : HPatternIsoData Q R) :
    HPatternIsoData P R where
  hom := HPatternHom.comp h₂.hom h₁.hom
  inv := HPatternHom.comp h₁.inv h₂.inv

end HPatternIsoData

end PhysicsLean
