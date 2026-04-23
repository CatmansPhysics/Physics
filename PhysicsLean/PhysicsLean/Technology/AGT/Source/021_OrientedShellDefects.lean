import PhysicsLean.Technology.AGT.Source.«020_MicroscopicGravCharge»

namespace PhysicsLean
namespace Technology.AGT.Source

universe u v

def hInvariantCharge {W : Type u} (repr : CanonicalRepresentative W) (hEq : W -> W -> Prop) : Prop :=
  forall ⦃left right : W⦄, hEq left right -> microscopicGravCharge repr left = microscopicGravCharge repr right

def rewritePreservingCharge {W : Type u} (repr : CanonicalRepresentative W) (rewriteRel : W -> W -> Prop) : Prop :=
  forall ⦃left right : W⦄, rewriteRel left right -> microscopicGravCharge repr left = microscopicGravCharge repr right

def transferStableCharge {W : Type u} (repr : CanonicalRepresentative W) (transferRel : W -> W -> Prop) : Prop :=
  forall ⦃left right : W⦄, transferRel left right -> microscopicGravCharge repr left = microscopicGravCharge repr right

structure ChargeComposition (W : Type u) where
  interactionCorrection : W -> W -> Int

def minimalChargeComposition {W : Type u} : ChargeComposition W :=
  { interactionCorrection := fun _ _ => 0 }

def compositeCharge {W : Type u} (repr : CanonicalRepresentative W)
    (composition : ChargeComposition W) (left right : W) : Int :=
  microscopicGravCharge repr left + microscopicGravCharge repr right +
    composition.interactionCorrection left right

@[simp] theorem compositeCharge_minimal {W : Type u} (repr : CanonicalRepresentative W)
    (left right : W) :
    compositeCharge repr minimalChargeComposition left right =
      microscopicGravCharge repr left + microscopicGravCharge repr right := by
  simp [compositeCharge, minimalChargeComposition]

theorem exact_neutral_composite_of_canceling_charge {W : Type u} (repr : CanonicalRepresentative W)
    {left right : W} {n : Int}
    (hLeft : microscopicGravCharge repr left = n)
    (hRight : microscopicGravCharge repr right = -n) :
    compositeCharge repr minimalChargeComposition left right = 0 := by
  simp [compositeCharge_minimal, hLeft, hRight]

theorem partial_compensation_composite {W : Type u} (repr : CanonicalRepresentative W)
    {left right : W} {n m : Int}
    (hLeft : microscopicGravCharge repr left = n)
    (hRight : microscopicGravCharge repr right = -m) :
    compositeCharge repr minimalChargeComposition left right = n - m := by
  simp [compositeCharge_minimal, hLeft, hRight, sub_eq_add_neg]

structure PositionedCharge (β : Type v) where
  charge : Int
  position : β

def chargedDipoleMoment {β : Type v} [AddCommMonoid β] [SMul Int β]
    (charges : List (PositionedCharge β)) : β :=
  (charges.map fun point => point.charge • point.position).sum

@[simp] theorem chargedDipoleMoment_nil {β : Type v} [AddCommMonoid β] [SMul Int β] :
    chargedDipoleMoment ([] : List (PositionedCharge β)) = 0 := by
  simp [chargedDipoleMoment]

end Technology.AGT.Source
end PhysicsLean
