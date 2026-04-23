import PhysicsLean.StructuralCore.Transfer.Moments
import PhysicsLean.StructuralCore.EFU.Basic
import PhysicsLean.StructuralCore.Models.ZSym.Object

/-!
# Transfer Spectral Control

This file packages the notion that singular assembly words are controlled by a
chosen transfer-moment structure. It is the first point where the symbolic
transfer package starts to look like a spectral obstruction machine.
-/

namespace PhysicsLean

structure TransferSpectralControlData (X : SeqSEqObject) (E : HPatternExtractor X) (ι : Type _)
    [AddMonoid ι] where
  moments : TransferMomentData X E ι
  singular : AssemblyWord E → Prop
  spectrallyControlled : AssemblyWord E → Prop
  control : ∀ word : AssemblyWord E, singular word → spectrallyControlled word

theorem spectral_control_of_singularities {X : SeqSEqObject} {E : HPatternExtractor X}
    {ι : Type _} [AddMonoid ι] (data : TransferSpectralControlData X E ι)
    (word : AssemblyWord E) (hsingular : data.singular word) :
    data.spectrallyControlled word :=
  data.control word hsingular

def IsTwoCoreEFUSector (E : HPatternExtractor zsym_object) (sector : AssemblyWord E) : Prop :=
  ∃ u v : zsym_object.Word,
    EFUObject E u ∧ EFUObject E v ∧
      sector = [mkHPatternQuotient E u, mkHPatternQuotient E v]

structure GoldbachSectorData where
  extractor : HPatternExtractor zsym_object
  sector : AssemblyWord extractor
  witness : IsTwoCoreEFUSector extractor sector

theorem goldbach_sector_is_two_core_efu_sector (data : GoldbachSectorData) :
    IsTwoCoreEFUSector data.extractor data.sector :=
  data.witness

theorem Goldbach_sector_is_two_core_EFU_sector (data : GoldbachSectorData) :
    IsTwoCoreEFUSector data.extractor data.sector :=
  goldbach_sector_is_two_core_efu_sector data

end PhysicsLean
