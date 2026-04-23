import PhysicsLean.StandardModel.Residue.Sector

namespace PhysicsLean

structure ElectroweakCharges where
  t3 : Rat
  hypercharge : Rat
  charge : Rat

def canonicalCharge (q : ElectroweakCharges) : Rat :=
  q.t3 + q.hypercharge

theorem charge_matches_sum (q : ElectroweakCharges)
    (hq : q.charge = canonicalCharge q) : q.charge = q.t3 + q.hypercharge := by
  simpa [canonicalCharge] using hq

end PhysicsLean
