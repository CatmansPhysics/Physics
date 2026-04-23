import PhysicsLean.Technology.AGT.GravResidue

namespace PhysicsLean

universe u

structure CompositeGravResidue (alpha : Type u) where
  components : List alpha
  residue : GravSign

namespace CompositeGravResidue

def neutral {alpha : Type u} (components : List alpha) : CompositeGravResidue alpha :=
  { components := components, residue := GravSign.neutral }

def singleton {alpha : Type u} (component : alpha) (residue : GravSign) : CompositeGravResidue alpha :=
  { components := [component], residue := residue }

theorem residue_neutral {alpha : Type u} (components : List alpha) :
    (neutral components).residue = GravSign.neutral := by
  rfl

theorem components_neutral {alpha : Type u} (components : List alpha) :
    (neutral components).components = components := by
  rfl

theorem residue_singleton {alpha : Type u} (component : alpha) (residue : GravSign) :
    (singleton component residue).residue = residue := by
  rfl

theorem components_singleton {alpha : Type u} (component : alpha) (residue : GravSign) :
    (singleton component residue).components = [component] := by
  rfl

end CompositeGravResidue

def IsNeutralComposite {alpha : Type u} (composite : CompositeGravResidue alpha) : Prop :=
  composite.residue = GravSign.neutral

theorem isNeutralComposite_iff_residue_eq_neutral {alpha : Type u}
    (composite : CompositeGravResidue alpha) :
    IsNeutralComposite composite <-> composite.residue = GravSign.neutral := by
  rfl

theorem isNeutralComposite_of_residue_eq {alpha : Type u}
    (composite : CompositeGravResidue alpha)
    (hNeutral : composite.residue = GravSign.neutral) :
    IsNeutralComposite composite := by
  simpa [IsNeutralComposite] using hNeutral

theorem residue_eq_neutral_of_isNeutralComposite {alpha : Type u}
    (composite : CompositeGravResidue alpha)
    (hNeutral : IsNeutralComposite composite) :
    composite.residue = GravSign.neutral := by
  exact hNeutral

theorem neutralComposite_isNeutral {alpha : Type u} (components : List alpha) :
    IsNeutralComposite (CompositeGravResidue.neutral components) := by
  exact isNeutralComposite_of_residue_eq _ (CompositeGravResidue.residue_neutral components)

theorem singleton_isNeutral_iff {alpha : Type u} (component : alpha) (residue : GravSign) :
    IsNeutralComposite (CompositeGravResidue.singleton component residue) <-> residue = GravSign.neutral := by
  constructor
  · intro hNeutral
    simpa [CompositeGravResidue.residue_singleton] using
      (residue_eq_neutral_of_isNeutralComposite _ hNeutral)
  · intro hNeutral
    exact isNeutralComposite_of_residue_eq _ (by simpa [CompositeGravResidue.residue_singleton] using hNeutral)

structure NeutralCompositeWitness (alpha : Type u) where
  composite : CompositeGravResidue alpha
  neutral : IsNeutralComposite composite

theorem NeutralCompositeWitness.residue_eq_neutral {alpha : Type u}
    (witness : NeutralCompositeWitness alpha) :
    witness.composite.residue = GravSign.neutral := by
  exact residue_eq_neutral_of_isNeutralComposite _ witness.neutral

def canonicalNeutralCompositeWitness {alpha : Type u}
    (components : List alpha) : NeutralCompositeWitness alpha :=
  { composite := CompositeGravResidue.neutral components
    neutral := neutralComposite_isNeutral components }

theorem canonicalNeutralCompositeWitness_components {alpha : Type u}
    (components : List alpha) :
    (canonicalNeutralCompositeWitness components).composite.components = components := by
  rfl

end PhysicsLean
