import PhysicsLean.Foundations.Prelude

namespace PhysicsLean
namespace Technology.AGT.Source

universe u

inductive SignedResidue
  | minus
  | zero
  | plus
  deriving DecidableEq, Repr

namespace SignedResidue

def toInt : SignedResidue -> Int
  | minus => -1
  | zero => 0
  | plus => 1

def ofIntSign (value : Int) : SignedResidue :=
  if value < 0 then minus else if value = 0 then zero else plus

def flip : SignedResidue -> SignedResidue
  | minus => plus
  | zero => zero
  | plus => minus

theorem toInt_ne_zero_iff {residue : SignedResidue} : residue.toInt != 0 <-> residue != zero := by
  cases residue <;> simp [toInt]

theorem ofIntSign_toInt (residue : SignedResidue) : ofIntSign residue.toInt = residue := by
  cases residue <;> simp [ofIntSign, toInt]

theorem flip_flip (residue : SignedResidue) : residue.flip.flip = residue := by
  cases residue <;> rfl

def sameSign (left right : SignedResidue) : Prop :=
  left = right ∧ left != zero

def oppositeSign (left right : SignedResidue) : Prop :=
  left = right.flip ∧ left != zero

theorem oppositeSign_comm {left right : SignedResidue} :
    oppositeSign left right -> oppositeSign right left := by
  intro hOpposite
  rcases hOpposite with ⟨hFlip, hNonzero⟩
  cases left <;> cases right <;> simp [oppositeSign, flip] at hFlip hNonzero ⊢

def minimalComposite (left right : SignedResidue) : SignedResidue :=
  ofIntSign (left.toInt + right.toInt)

theorem minimalComposite_plus_minus : minimalComposite plus minus = zero := by
  simp [minimalComposite, ofIntSign, toInt]

theorem minimalComposite_minus_plus : minimalComposite minus plus = zero := by
  simp [minimalComposite, ofIntSign, toInt]

theorem minimalComposite_plus_plus : minimalComposite plus plus = plus := by
  simp [minimalComposite, ofIntSign, toInt]

theorem minimalComposite_minus_minus : minimalComposite minus minus = minus := by
  simp [minimalComposite, ofIntSign, toInt]

end SignedResidue

inductive PairRegime
  | attractive
  | repulsive
  | screened
  deriving DecidableEq, Repr

def pairRegime (source probe : SignedResidue) : PairRegime :=
  match source, probe with
  | SignedResidue.zero, _ => PairRegime.screened
  | _, SignedResidue.zero => PairRegime.screened
  | SignedResidue.plus, SignedResidue.plus => PairRegime.attractive
  | SignedResidue.minus, SignedResidue.minus => PairRegime.attractive
  | _, _ => PairRegime.repulsive

theorem pairRegime_comm (source probe : SignedResidue) :
    pairRegime source probe = pairRegime probe source := by
  cases source <;> cases probe <;> rfl

theorem pairRegime_eq_attractive_iff {source probe : SignedResidue} :
    pairRegime source probe = PairRegime.attractive <-> SignedResidue.sameSign source probe := by
  cases source <;> cases probe <;> simp [pairRegime, SignedResidue.sameSign]

theorem pairRegime_eq_repulsive_iff {source probe : SignedResidue} :
    pairRegime source probe = PairRegime.repulsive <-> SignedResidue.oppositeSign source probe := by
  cases source <;> cases probe <;> simp [pairRegime, SignedResidue.oppositeSign, SignedResidue.flip]

theorem pairRegime_eq_screened_iff {source probe : SignedResidue} :
    pairRegime source probe = PairRegime.screened <-> source = SignedResidue.zero ∨ probe = SignedResidue.zero := by
  cases source <;> cases probe <;> simp [pairRegime]

structure ProjectScope (W : Type u) where
  gravResidue : W -> SignedResidue

namespace ProjectScope

def gravResidueClass {W : Type u} (scope : ProjectScope W) (residue : SignedResidue) : Set W :=
  fun state => scope.gravResidue state = residue

def rewriteInvariant {W : Type u} (scope : ProjectScope W) (rewriteRel : W -> W -> Prop) : Prop :=
  forall ⦃source target : W⦄, rewriteRel source target -> scope.gravResidue source = scope.gravResidue target

def transferStable {W : Type u} (scope : ProjectScope W) (transferRel : W -> W -> Prop) : Prop :=
  forall ⦃source target : W⦄, transferRel source target -> scope.gravResidue source = scope.gravResidue target

theorem rewriteInvariant_of_eq {W : Type u} (scope : ProjectScope W) :
    scope.rewriteInvariant (fun source target => source = target) := by
  intro source target hEq
  simp [hEq]

theorem transferStable_of_eq {W : Type u} (scope : ProjectScope W) :
    scope.transferStable (fun source target => source = target) := by
  intro source target hEq
  simp [hEq]

theorem mem_gravResidueClass_iff {W : Type u} (scope : ProjectScope W)
    (residue : SignedResidue) (state : W) :
    scope.gravResidueClass residue state <-> scope.gravResidue state = residue := by
  rfl

end ProjectScope

end Technology.AGT.Source
end PhysicsLean
