import PhysicsLean.Foundations.Prelude

/-!
# PhysicsLean Symbolic Structures

This file defines the basic symbolic object used by the `SEq` layer: a carrier,
its semantic interpretation, and a class of admissible endomorphisms preserving
that interpretation.

## Main constructions

- `SymbolicStructure`: the core symbolic object.
- `SymbolicStructure.admissibleEndomorphism`: bundled admissible self-maps.

## Role in the project

Later files add morphisms and category structure on top of this foundation.
-/

universe u v

namespace PhysicsLean

structure SymbolicStructure where
  Carrier : Type u
  Semantics : Type v
  semantics : Carrier → Semantics
  admissible : (Carrier → Carrier) → Prop
  admissible_id : admissible id
  admissible_comp : ∀ {f g : Carrier → Carrier}, admissible f → admissible g → admissible (g ∘ f)
  semantics_invariant : ∀ {f : Carrier → Carrier}, admissible f → ∀ a, semantics (f a) = semantics a

namespace SymbolicStructure

instance : CoeSort SymbolicStructure (Type u) where
  coe S := S.Carrier

def admissibleEndomorphism (S : SymbolicStructure) :=
  { f : S → S // S.admissible f }

@[simp] theorem semantics_id (S : SymbolicStructure) (a : S) :
    S.semantics (id a) = S.semantics a := by
  simp

theorem semantics_comp_of_admissible (S : SymbolicStructure)
    {f g : S → S} (hf : S.admissible f) (hg : S.admissible g) (a : S) :
    S.semantics ((g ∘ f) a) = S.semantics a := by
  exact S.semantics_invariant (S.admissible_comp hf hg) a

@[simp] theorem semantics_of_admissible (S : SymbolicStructure)
    {f : S → S} (hf : S.admissible f) (a : S) :
    S.semantics (f a) = S.semantics a :=
  S.semantics_invariant hf a

end SymbolicStructure

end PhysicsLean
