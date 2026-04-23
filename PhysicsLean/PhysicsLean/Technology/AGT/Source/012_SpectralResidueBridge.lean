import PhysicsLean.Technology.AGT.Source.«011_NeutralCompositeSectors»

namespace PhysicsLean
namespace Technology.AGT.Source

structure GravMarkedEdge where
  weight : Rat
  transportOrder : Int
  observerShift : Int
  actionWeight : Rat
  residueShift : Int

def markedResidueFlow (edges : List GravMarkedEdge) : Int :=
  (edges.map GravMarkedEdge.residueShift).sum

structure DominantBranch where
  gravLogSlope : Int
  deriving Repr

def spectralGravObservable (branch : DominantBranch) : SignedResidue :=
  SignedResidue.ofIntSign branch.gravLogSlope

@[simp] theorem spectralGravObservable_zero :
    spectralGravObservable { gravLogSlope := 0 } = SignedResidue.zero := by
  simp [spectralGravObservable, SignedResidue.ofIntSign]

structure TargetTheoremWrapper where
  code : String
  assumptions : List String
  conclusion : String
  deriving Repr

def chapter1TargetTheorems : List TargetTheoremWrapper :=
  [ { code := "AG-T1"
      assumptions :=
        ["grav-residue is transfer-stable",
          "geometric channel exists on a power-law graph projection",
          "a scaling window exists for the Green operator",
          "minimal composite closure or a refinement is available"]
      conclusion :=
        "like-sign attraction, opposite-sign repulsion, and neutral-composite screening coexist in one observer-level regime" }
  , { code := "AG-T2"
      assumptions :=
        ["a grav-marked kernel exists",
          "a dominant branch exists",
          "the logarithmic branch derivative at s=1 is defined"]
      conclusion :=
        "the sign of the spectral grav observable matches the grav-residue observable" } ]

structure FailureMode where
  code : String
  description : String
  deriving Repr

def chapter1FailureModes : List FailureMode :=
  [ { code := "AG-F1"
      description := "grav-residue cannot be realized as a transfer-stable observable" }
  , { code := "AG-F2"
      description := "minimal composite closure is unstable and no grav-neutral sector forms" }
  , { code := "AG-F3"
      description := "neutral composites always retain a large dipole tail" }
  , { code := "AG-F4"
      description := "spectral realization does not agree with the observer-level grav sign" } ]

theorem chapter1FailureModes_length : chapter1FailureModes.length = 4 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
