import PhysicsLean.StructuralCore.SEq.SymbolicStructure

/-!
# PhysicsLean Symbolic Morphisms

This file defines structure-preserving maps between symbolic structures. Such a
morphism transports carriers, semantics, and admissible endomorphisms in a way
compatible with the symbolic meaning of the objects.
-/

universe u v w z

namespace PhysicsLean

@[ext] structure SymbolicStructureHom (S T : SymbolicStructure) where
  toFun : S → T
  mapSemantics : S.Semantics → T.Semantics
  commutes : ∀ a : S, mapSemantics (S.semantics a) = T.semantics (toFun a)
  preserves_admissible : ∀ {f : S → S}, S.admissible f →
    ∃ g : T → T, T.admissible g ∧ ∀ a : S, toFun (f a) = g (toFun a)

namespace SymbolicStructureHom

instance {S T : SymbolicStructure} : CoeFun (SymbolicStructureHom S T) (fun _ => S → T) where
  coe f := f.toFun

@[simp] theorem commutes_apply {S T : SymbolicStructure} (f : SymbolicStructureHom S T) (a : S) :
    f.mapSemantics (S.semantics a) = T.semantics (f a) :=
  f.commutes a

def id (S : SymbolicStructure) : SymbolicStructureHom S S where
  toFun := _root_.id
  mapSemantics := _root_.id
  commutes := by
    intro a
    rfl
  preserves_admissible := by
    intro f hf
    exact ⟨f, hf, by intro a; rfl⟩

def comp {S T U : SymbolicStructure}
    (g : SymbolicStructureHom T U) (f : SymbolicStructureHom S T) : SymbolicStructureHom S U where
  toFun := g ∘ f
  mapSemantics := g.mapSemantics ∘ f.mapSemantics
  commutes := by
    intro a
    rw [Function.comp_apply, Function.comp_apply, f.commutes a, g.commutes (f a)]
  preserves_admissible := by
    intro h hf
    rcases f.preserves_admissible hf with ⟨hT, hhT, commT⟩
    rcases g.preserves_admissible hhT with ⟨hU, hhU, commU⟩
    refine ⟨hU, hhU, ?_⟩
    intro a
    calc
      g (f (h a)) = g (hT (f a)) := by rw [commT a]
      _ = hU (g (f a)) := commU (f a)

@[simp] theorem id_apply (S : SymbolicStructure) (a : S) : id S a = a := rfl

@[simp] theorem id_mapSemantics (S : SymbolicStructure) : (id S).mapSemantics = _root_.id := rfl

@[simp] theorem comp_apply {S T U : SymbolicStructure}
    (g : SymbolicStructureHom T U) (f : SymbolicStructureHom S T) (a : S) :
    comp g f a = g (f a) := rfl

@[simp] theorem comp_mapSemantics {S T U : SymbolicStructure}
    (g : SymbolicStructureHom T U) (f : SymbolicStructureHom S T) :
    (comp g f).mapSemantics = g.mapSemantics ∘ f.mapSemantics := rfl

theorem semantics_commute {S T : SymbolicStructure}
    (f : SymbolicStructureHom S T) (a : S) :
    f.mapSemantics (S.semantics a) = T.semantics (f a) :=
  f.commutes a

end SymbolicStructureHom

end PhysicsLean
