import PhysicsLean.Technology.Materialization.Assembly
import PhysicsLean.Technology.Materialization.Specification

namespace PhysicsLean

universe u

def SoftMaterialization {alpha : Type u}
    (specification : ObserverSpecification alpha)
    (realized : alpha -> Prop) : Prop :=
  forall {state : alpha}, realized state -> specification.admits state

theorem softMaterialization_apply {alpha : Type u}
    {specification : ObserverSpecification alpha}
    {realized : alpha -> Prop}
    (hSoft : SoftMaterialization specification realized)
    {state : alpha} (hRealized : realized state) :
    specification.admits state := by
  exact hSoft hRealized

def HardMaterialization {alpha : Type u}
    (specification : ObserverSpecification alpha)
    (realized : alpha -> Prop) : Prop :=
  (forall state : alpha, specification.admits state -> realized state) /\
    SoftMaterialization specification realized

theorem hardMaterialization_iff {alpha : Type u}
    (specification : ObserverSpecification alpha)
    (realized : alpha -> Prop) :
    HardMaterialization specification realized <->
      (forall state : alpha, specification.admits state -> realized state) /\
        SoftMaterialization specification realized := by
  rfl

theorem hardMaterialization_forward {alpha : Type u}
    {specification : ObserverSpecification alpha}
    {realized : alpha -> Prop}
    (hHard : HardMaterialization specification realized)
    (state : alpha)
    (hAdmits : specification.admits state) :
    realized state := by
  exact hHard.1 state hAdmits

theorem hardMaterialization_implies_soft {alpha : Type u}
    {specification : ObserverSpecification alpha}
    {realized : alpha -> Prop}
    (hHard : HardMaterialization specification realized) :
    SoftMaterialization specification realized := by
  exact hHard.2

def SuccessfulMaterialization {alpha : Type u}
    (specification : ObserverSpecification alpha)
    (realized : alpha -> Prop) : Prop :=
  SoftMaterialization specification realized \/ HardMaterialization specification realized

theorem successfulMaterialization_iff {alpha : Type u}
    (specification : ObserverSpecification alpha)
    (realized : alpha -> Prop) :
    SuccessfulMaterialization specification realized <->
      SoftMaterialization specification realized \/ HardMaterialization specification realized := by
  rfl

theorem successfulMaterialization_of_soft {alpha : Type u}
    {specification : ObserverSpecification alpha}
    {realized : alpha -> Prop}
    (hSoft : SoftMaterialization specification realized) :
    SuccessfulMaterialization specification realized := by
  exact Or.inl hSoft

theorem successfulMaterialization_of_hard {alpha : Type u}
    {specification : ObserverSpecification alpha}
    {realized : alpha -> Prop}
    (hHard : HardMaterialization specification realized) :
    SuccessfulMaterialization specification realized := by
  exact Or.inr hHard

end PhysicsLean
