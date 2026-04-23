import PhysicsLean.StructuralCore.SEq.Morphism

/-!
# PhysicsLean Symbolic Category

This file turns symbolic structures and symbolic morphisms into a category. It
is the categorical envelope of the `SEq` layer.
-/

universe u v

namespace PhysicsLean

open CategoryTheory

abbrev SEqCat := SymbolicStructure

instance seq_category : CategoryTheory.Category SEqCat where
  Hom S T := SymbolicStructureHom S T
  id := SymbolicStructureHom.id
  comp f g := SymbolicStructureHom.comp g f
  id_comp := by
    intro S T f
    cases f
    rfl
  comp_id := by
    intro S T f
    cases f
    rfl
  assoc := by
    intro R S T U f g h
    cases f
    cases g
    cases h
    rfl

@[simp] theorem seq_id_apply (S : SEqCat) (a : S) :
    SymbolicStructureHom.id S a = a := rfl

@[simp] theorem seq_comp_apply {S T U : SEqCat}
    (f : SymbolicStructureHom S T) (g : SymbolicStructureHom T U) (a : S) :
    SymbolicStructureHom.comp g f a = g (f a) := rfl

@[simp] theorem seq_id_semantics (S : SEqCat) (a : S) :
    (SymbolicStructureHom.id S).mapSemantics (S.semantics a) = S.semantics a := by
  rfl

theorem seq_comp_semantics {S T U : SEqCat}
    (f : SymbolicStructureHom S T) (g : SymbolicStructureHom T U) (a : S) :
    (SymbolicStructureHom.comp g f).mapSemantics (S.semantics a) =
      U.semantics (SymbolicStructureHom.comp g f a) := by
  exact (SymbolicStructureHom.comp g f).commutes a

end PhysicsLean
