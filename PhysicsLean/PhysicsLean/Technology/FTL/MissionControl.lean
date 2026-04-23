import PhysicsLean.Technology.FTL.HardCarrier
import PhysicsLean.Technology.FTL.SoftLink

namespace PhysicsLean

universe u v

structure MissionReadinessPredicate (sigma : Type u) where
  ready : sigma -> Prop

namespace MissionReadinessPredicate

def Mem {sigma : Type u} (predicate : MissionReadinessPredicate sigma) (state : sigma) : Prop :=
  predicate.ready state

theorem mem_iff {sigma : Type u} (predicate : MissionReadinessPredicate sigma) (state : sigma) :
    predicate.Mem state <-> predicate.ready state := by
  rfl

end MissionReadinessPredicate

structure SoftHardIntegrationRecord (sigma : Type u) (alpha : Type v) where
  readiness : MissionReadinessPredicate sigma
  softSector : SoftLinkSector alpha
  hardCycle : CompositeCarrierCycle alpha

namespace SoftHardIntegrationRecord

def isReady {sigma : Type u} {alpha : Type v}
    (record : SoftHardIntegrationRecord sigma alpha) (state : sigma) : Prop :=
  record.readiness.ready state

def softActive {sigma : Type u} {alpha : Type v}
    (record : SoftHardIntegrationRecord sigma alpha) (state : alpha) : Prop :=
  record.softSector.active state

def hardStageCount {sigma : Type u} {alpha : Type v}
    (record : SoftHardIntegrationRecord sigma alpha) : Nat :=
  record.hardCycle.stages.length

theorem isReady_iff {sigma : Type u} {alpha : Type v}
    (record : SoftHardIntegrationRecord sigma alpha) (state : sigma) :
    record.isReady state <-> record.readiness.ready state := by
  rfl

theorem softActive_iff {sigma : Type u} {alpha : Type v}
    (record : SoftHardIntegrationRecord sigma alpha) (state : alpha) :
    record.softActive state <-> record.softSector.active state := by
  rfl

theorem hardStageCount_eq_length {sigma : Type u} {alpha : Type v}
    (record : SoftHardIntegrationRecord sigma alpha) :
    record.hardStageCount = record.hardCycle.stages.length := by
  rfl

end SoftHardIntegrationRecord

def MissionAdmissible {sigma : Type u} {alpha : Type v}
    (record : SoftHardIntegrationRecord sigma alpha) : Prop :=
  Exists fun state : sigma => record.readiness.ready state

theorem missionAdmissible_iff {sigma : Type u} {alpha : Type v}
    (record : SoftHardIntegrationRecord sigma alpha) :
    MissionAdmissible record <-> Exists fun state : sigma => record.readiness.ready state := by
  rfl

theorem missionAdmissible_of_ready {sigma : Type u} {alpha : Type v}
    (record : SoftHardIntegrationRecord sigma alpha)
    (state : sigma)
    (hReady : record.readiness.ready state) :
    MissionAdmissible record := by
  exact Exists.intro state hReady

theorem missionAdmissible_of_isReady {sigma : Type u} {alpha : Type v}
    (record : SoftHardIntegrationRecord sigma alpha)
    (state : sigma)
    (hReady : record.isReady state) :
    MissionAdmissible record := by
  exact missionAdmissible_of_ready record state hReady

theorem exists_ready_of_missionAdmissible {sigma : Type u} {alpha : Type v}
    (record : SoftHardIntegrationRecord sigma alpha)
    (hAdmissible : MissionAdmissible record) :
    Exists fun state : sigma => record.isReady state := by
  rcases hAdmissible with ⟨state, hReady⟩
  exact Exists.intro state hReady

structure MissionExecutionWitness (sigma : Type u) (alpha : Type v) where
  record : SoftHardIntegrationRecord sigma alpha
  observerState : sigma
  ready : record.isReady observerState

theorem MissionExecutionWitness.admissible {sigma : Type u} {alpha : Type v}
    (witness : MissionExecutionWitness sigma alpha) :
    MissionAdmissible witness.record := by
  exact missionAdmissible_of_isReady witness.record witness.observerState witness.ready

theorem MissionExecutionWitness.stageCount_eq_length {sigma : Type u} {alpha : Type v}
    (witness : MissionExecutionWitness sigma alpha) :
    witness.record.hardStageCount = witness.record.hardCycle.stages.length := by
  exact SoftHardIntegrationRecord.hardStageCount_eq_length witness.record

structure IntegratedMissionWitness (sigma : Type u) (alpha : Type v) where
  mission : MissionExecutionWitness sigma alpha
  soft : BranchLockedWitness alpha
  softAligned : mission.record.softSector = soft.sector

theorem IntegratedMissionWitness.localControl {sigma : Type u} {alpha : Type v}
    (witness : IntegratedMissionWitness sigma alpha)
    {sectorState : alpha}
    (hActive : witness.mission.record.softSector.active sectorState) :
    witness.soft.branch sectorState /\
      MissionAdmissible witness.mission.record := by
  refine And.intro ?_ ?_
  rw [witness.softAligned] at hActive
  exact witness.soft.apply hActive
  exact witness.mission.admissible

end PhysicsLean
