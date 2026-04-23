import PhysicsLean.QuantumStat.Amplitudes.HistoryAmplitude

/-!
# State Images

Minimal state-image interface induced by history amplitudes.
-/

universe u v

namespace PhysicsLean

structure QuantumStateImage (α : Type u) where
  support : List α

namespace QuantumStateImage

def ofHistoryStates {α : Type u} {ℓ : Type v}
    (history : CausalHistory α ℓ) : QuantumStateImage α where
  support := history.states

end QuantumStateImage

end PhysicsLean
