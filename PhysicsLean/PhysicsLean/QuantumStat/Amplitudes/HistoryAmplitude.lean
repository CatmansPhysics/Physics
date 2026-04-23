import Mathlib.Data.Complex.Basic
import PhysicsLean.ObserverDynamics.Causal.History

/-!
# History Amplitudes

Minimal complex amplitudes assigned to causal histories.
-/

universe u v

namespace PhysicsLean

structure HistoryAmplitude (α : Type u) (ℓ : Type v) where
  amplitude : CausalHistory α ℓ → Complex

namespace HistoryAmplitude

def weight {α : Type u} {ℓ : Type v} (A : HistoryAmplitude α ℓ)
    (history : CausalHistory α ℓ) : Real :=
  Complex.normSq (A.amplitude history)

end HistoryAmplitude

end PhysicsLean
