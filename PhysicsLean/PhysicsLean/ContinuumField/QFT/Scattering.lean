import PhysicsLean.ContinuumField.QFT.PoleResidue

namespace PhysicsLean

structure ScatteringSector (σ : Type _) where
  incoming : List σ
  outgoing : List σ
  amplitude : Rat

def channelBalance {σ : Type _} (sector : ScatteringSector σ) : Int :=
  Int.ofNat sector.outgoing.length - Int.ofNat sector.incoming.length

end PhysicsLean
