import PhysicsLean.QuantumStat.Amplitudes.StateImage

/-!
# Measurement Records

Observer-level records extracted from state images.
-/

universe u

namespace PhysicsLean

structure MeasurementRecord (β : Type u) where
  observed : List β

namespace MeasurementRecord

def ofList {β : Type u} (observed : List β) : MeasurementRecord β :=
  ⟨observed⟩

end MeasurementRecord

end PhysicsLean
