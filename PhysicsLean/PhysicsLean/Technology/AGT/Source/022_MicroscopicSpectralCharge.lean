import PhysicsLean.Technology.AGT.Source.«021_OrientedShellDefects»

namespace PhysicsLean
namespace Technology.AGT.Source

structure GravIncrement where
  deltaCharge : Int
  deriving Repr

def markedChargeFlow (increments : List GravIncrement) : Int :=
  (increments.map GravIncrement.deltaCharge).sum

structure SpectralBranch where
  gravSlope : Int
  deriving Repr

def spectralChargeSign (branch : SpectralBranch) : SignedResidue :=
  SignedResidue.ofIntSign branch.gravSlope

structure Chapter2Target where
  code : String
  statement : String
  deriving Repr

def chapter2Targets : List Chapter2Target :=
  [ { code := "AG-T3"
      statement := "A choice of orientation sign and shell load yields a transfer-stable microscopic grav-charge." }
  , { code := "AG-T4"
      statement := "The sign of the spectral grav observable matches the sign of the microscopic grav-charge." }
  , { code := "AG-T5"
      statement := "A nonempty class of exact grav-neutral composites exists with vanishing monopole charge and allowed dipole sectors." } ]

inductive ToyAtom
  | gPlus (load : Nat)
  | gMinus (load : Nat)
  | neutral (load : Nat)
  deriving DecidableEq, Repr

namespace ToyAtom

def gravCharge : ToyAtom -> Int
  | gPlus load => Int.ofNat load
  | gMinus load => -Int.ofNat load
  | neutral _ => 0

end ToyAtom

def toyWordCharge (word : List ToyAtom) : Int :=
  (word.map ToyAtom.gravCharge).sum

theorem toyWordCharge_cancel (load : Nat) :
    toyWordCharge [ToyAtom.gPlus load, ToyAtom.gMinus load] = 0 := by
  simp [toyWordCharge, ToyAtom.gravCharge]

theorem toyWordCharge_partial (positiveLoad negativeLoad : Nat) :
    toyWordCharge [ToyAtom.gPlus positiveLoad, ToyAtom.gMinus negativeLoad] =
      Int.ofNat positiveLoad - Int.ofNat negativeLoad := by
  simp [toyWordCharge, ToyAtom.gravCharge, sub_eq_add_neg]

theorem toyWordCharge_example_one :
    toyWordCharge [ToyAtom.gPlus 2, ToyAtom.gMinus 1] = 1 := by
  norm_num [toyWordCharge, ToyAtom.gravCharge]

theorem toyWordCharge_example_two :
    toyWordCharge [ToyAtom.gMinus 3, ToyAtom.gPlus 1, ToyAtom.gPlus 1] = -1 := by
  norm_num [toyWordCharge, ToyAtom.gravCharge]

end Technology.AGT.Source
end PhysicsLean
