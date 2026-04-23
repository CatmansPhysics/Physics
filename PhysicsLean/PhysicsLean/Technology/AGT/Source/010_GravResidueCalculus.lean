import PhysicsLean.Technology.AGT.Source.«001_ProjectKernel»
import PhysicsLean.Technology.AGT.Source.«002_Protocol»

namespace PhysicsLean
namespace Technology.AGT.Source

universe u v w y z

def gravResidueSet : List SignedResidue := [SignedResidue.minus, SignedResidue.zero, SignedResidue.plus]

theorem mem_gravResidueSet (residue : SignedResidue) : residue ∈ gravResidueSet := by
  cases residue <;> simp [gravResidueSet]

def gravResidueObservable {W : Type u} (scope : ProjectScope W) : W -> SignedResidue :=
  scope.gravResidue

def gravResidueClass {W : Type u} (scope : ProjectScope W) : SignedResidue -> Set W :=
  scope.gravResidueClass

def signedSourceLaw {W : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    {ι : Type y} {κ : Type z} (kernel : ProjectKernel W ℓ β τ ι κ)
    (support : List (LocalizedSector W β)) : β -> Int :=
  fun site => kernel.signedSourceDensity support site

theorem signedSourceLaw_nil {W : Type u} {ℓ : Type v} {β : Type w} {τ : Type w}
    {ι : Type y} {κ : Type z} (kernel : ProjectKernel W ℓ β τ ι κ) :
    signedSourceLaw kernel [] = fun _ => 0 := by
  funext site
  simp [signedSourceLaw]

def pairPotentialRegime (sourceResidue probeResidue : SignedResidue) : PairRegime :=
  pairRegime sourceResidue probeResidue

theorem like_sign_attractive {sourceResidue probeResidue : SignedResidue}
    (hLike : SignedResidue.sameSign sourceResidue probeResidue) :
    pairPotentialRegime sourceResidue probeResidue = PairRegime.attractive := by
  exact (pairRegime_eq_attractive_iff).2 hLike

theorem opposite_sign_repulsive {sourceResidue probeResidue : SignedResidue}
    (hOpposite : SignedResidue.oppositeSign sourceResidue probeResidue) :
    pairPotentialRegime sourceResidue probeResidue = PairRegime.repulsive := by
  exact (pairRegime_eq_repulsive_iff).2 hOpposite

theorem neutral_sector_screened_left (probeResidue : SignedResidue) :
    pairPotentialRegime SignedResidue.zero probeResidue = PairRegime.screened := by
  simp [pairPotentialRegime, pairRegime]

theorem neutral_sector_screened_right (sourceResidue : SignedResidue) :
    pairPotentialRegime sourceResidue SignedResidue.zero = PairRegime.screened := by
  cases sourceResidue <;> simp [pairPotentialRegime, pairRegime]

end Technology.AGT.Source
end PhysicsLean
