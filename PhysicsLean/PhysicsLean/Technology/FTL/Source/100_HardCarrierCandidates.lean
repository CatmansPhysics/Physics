import PhysicsLean.Technology.FTL.Source.«098_SoftRobustness»

namespace PhysicsLean
namespace Technology.FTL.Source

inductive HardCarrierCandidateClass
  | desynchronizedTransport
  | branchTransferCarrier
  | pairedManyBodyCarrier
  | projectionShortcutPseudoCarrier
  deriving DecidableEq, Repr

structure HardCarrierDesignCriteria where
  transportSector : Prop
  superluminalWindow : Prop
  objectCarrying : Prop
  branchAccessible : Prop
  bindingCompatible : Prop

def validHardCarrierDesign (criteria : HardCarrierDesignCriteria) : Prop :=
  criteria.transportSector ∧ criteria.superluminalWindow ∧ criteria.objectCarrying ∧
    criteria.branchAccessible ∧ criteria.bindingCompatible

structure HardCandidateEntry where
  candidate : HardCarrierCandidateClass
  code : String
  description : String
  mainLinePriority : Nat
  role : String
  deriving Repr

def hardCarrierCandidates : List HardCandidateEntry :=
  [ { candidate := HardCarrierCandidateClass.desynchronizedTransport
      code := "I"
      description := "A desynchronized transport sector whose effective cone speed exceeds the reference luminal sector."
      mainLinePriority := 2
      role := "background existence candidate" }
  , { candidate := HardCarrierCandidateClass.branchTransferCarrier
      code := "II"
      description := "A branch-transfer carrier realized through an avoided-crossing family with controlled switching."
      mainLinePriority := 1
      role := "preferred one-pole hard candidate" }
  , { candidate := HardCarrierCandidateClass.pairedManyBodyCarrier
      code := "III"
      description := "A paired or many-body carrier regime for later composite transport."
      mainLinePriority := 3
      role := "later composite candidate" }
  , { candidate := HardCarrierCandidateClass.projectionShortcutPseudoCarrier
      code := "IV"
      description := "A projection-shortcut pseudo-carrier used as a negative control against false hard transport."
      mainLinePriority := 4
      role := "control class" } ]

def preferredHardCarrierCandidate : HardCarrierCandidateClass :=
  HardCarrierCandidateClass.branchTransferCarrier

theorem hardCarrierCandidates_length : hardCarrierCandidates.length = 4 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
