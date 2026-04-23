import PhysicsLean.Technology.AGT.Source.«012_SpectralResidueBridge»

namespace PhysicsLean
namespace Technology.AGT.Source

universe u

inductive OrientationSign
  | negative
  | positive
  deriving DecidableEq, Repr

namespace OrientationSign

def toInt : OrientationSign -> Int
  | negative => -1
  | positive => 1

end OrientationSign

structure MicroBlock where
  orientation : OrientationSign
  shellLoad : Nat
  deriving Repr

def orientedContribution (block : MicroBlock) : Int :=
  block.orientation.toInt * Int.ofNat block.shellLoad

def orientedShellDefect (blocks : List MicroBlock) : Int :=
  (blocks.map orientedContribution).sum

@[simp] theorem orientedShellDefect_nil : orientedShellDefect [] = 0 := by
  simp [orientedShellDefect]

@[simp] theorem orientedShellDefect_cons (head : MicroBlock) (tail : List MicroBlock) :
    orientedShellDefect (head :: tail) = orientedContribution head + orientedShellDefect tail := by
  simp [orientedShellDefect, orientedContribution]

structure CanonicalRepresentative (W : Type u) where
  cellsOf : W -> List MicroBlock

def microscopicGravCharge {W : Type u} (repr : CanonicalRepresentative W) (state : W) : Int :=
  orientedShellDefect (repr.cellsOf state)

def microscopicGravSign {W : Type u} (repr : CanonicalRepresentative W) (state : W) : SignedResidue :=
  SignedResidue.ofIntSign (microscopicGravCharge repr state)

theorem microscopicGravSign_zero_of_charge_zero {W : Type u}
    (repr : CanonicalRepresentative W) {state : W}
    (hCharge : microscopicGravCharge repr state = 0) :
    microscopicGravSign repr state = SignedResidue.zero := by
  simp [microscopicGravSign, hCharge, SignedResidue.ofIntSign]

theorem microscopicGravSign_eq_sign {W : Type u}
    (repr : CanonicalRepresentative W) (state : W) :
    microscopicGravSign repr state = SignedResidue.ofIntSign (microscopicGravCharge repr state) := by
  rfl

end Technology.AGT.Source
end PhysicsLean
