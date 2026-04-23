import PhysicsLean.Technology.AGT.Source.«010_GravResidueCalculus»

namespace PhysicsLean
namespace Technology.AGT.Source

universe u

structure GravComposite (W : Type u) where
  left : W
  right : W

namespace GravComposite

def effectiveResidue {W : Type u} (scope : ProjectScope W) (composite : GravComposite W) : SignedResidue :=
  SignedResidue.minimalComposite (scope.gravResidue composite.left) (scope.gravResidue composite.right)

def IsNeutral {W : Type u} (scope : ProjectScope W) (composite : GravComposite W) : Prop :=
  composite.effectiveResidue scope = SignedResidue.zero

theorem effectiveResidue_mk {W : Type u} (scope : ProjectScope W) (left right : W) :
    (GravComposite.mk left right).effectiveResidue scope =
      SignedResidue.minimalComposite (scope.gravResidue left) (scope.gravResidue right) := by
  rfl

end GravComposite

theorem opposite_pair_is_neutral {W : Type u} (scope : ProjectScope W)
    {left right : W}
    (hLeft : scope.gravResidue left = SignedResidue.plus)
    (hRight : scope.gravResidue right = SignedResidue.minus) :
    (GravComposite.mk left right).IsNeutral scope := by
  simp [GravComposite.IsNeutral, GravComposite.effectiveResidue, hLeft, hRight,
    SignedResidue.minimalComposite_plus_minus]

theorem opposite_pair_is_neutral_symm {W : Type u} (scope : ProjectScope W)
    {left right : W}
    (hLeft : scope.gravResidue left = SignedResidue.minus)
    (hRight : scope.gravResidue right = SignedResidue.plus) :
    (GravComposite.mk left right).IsNeutral scope := by
  simp [GravComposite.IsNeutral, GravComposite.effectiveResidue, hLeft, hRight,
    SignedResidue.minimalComposite_minus_plus]

theorem like_sign_plus_stays_plus {W : Type u} (scope : ProjectScope W)
    {left right : W}
    (hLeft : scope.gravResidue left = SignedResidue.plus)
    (hRight : scope.gravResidue right = SignedResidue.plus) :
    (GravComposite.mk left right).effectiveResidue scope = SignedResidue.plus := by
  simp [GravComposite.effectiveResidue, hLeft, hRight,
    SignedResidue.minimalComposite_plus_plus]

theorem like_sign_minus_stays_minus {W : Type u} (scope : ProjectScope W)
    {left right : W}
    (hLeft : scope.gravResidue left = SignedResidue.minus)
    (hRight : scope.gravResidue right = SignedResidue.minus) :
    (GravComposite.mk left right).effectiveResidue scope = SignedResidue.minus := by
  simp [GravComposite.effectiveResidue, hLeft, hRight,
    SignedResidue.minimalComposite_minus_minus]

structure PositionedResidue where
  residue : SignedResidue
  position : Int

def gravDipoleMoment (parts : List PositionedResidue) : Int :=
  (parts.map fun part => part.residue.toInt * part.position).sum

@[simp] theorem gravDipoleMoment_nil : gravDipoleMoment [] = 0 := by
  simp [gravDipoleMoment]

@[simp] theorem gravDipoleMoment_cons (head : PositionedResidue) (tail : List PositionedResidue) :
    gravDipoleMoment (head :: tail) = head.residue.toInt * head.position + gravDipoleMoment tail := by
  simp [gravDipoleMoment]

end Technology.AGT.Source
end PhysicsLean
