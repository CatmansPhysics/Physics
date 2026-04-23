import PhysicsLean.QuantumStat.Measurement.Records

/-!
# Decoherence

Minimal predicate asserting stable classical records.
-/

universe u

namespace PhysicsLean

def Decoherent {β : Type u} (record : MeasurementRecord β) : Prop :=
  record.observed.Nodup

theorem decoherent_tail {β : Type u} {head : β} {tail : List β}
    (h : Decoherent (MeasurementRecord.ofList (head :: tail))) :
    Decoherent (MeasurementRecord.ofList tail) := by
  exact (List.nodup_cons.mp h).2

end PhysicsLean
