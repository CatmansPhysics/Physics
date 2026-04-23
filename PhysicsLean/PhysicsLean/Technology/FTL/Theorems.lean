import PhysicsLean.Technology.FTL.Axioms
import PhysicsLean.Technology.FTL.Targets

namespace PhysicsLean

universe u v

theorem branchLocked_apply_theorem {alpha : Type u}
    {sector : SoftLinkSector alpha}
    {branch : alpha -> Prop}
    (hLocked : BranchLockedSoftSector sector branch)
    {state : alpha} (hActive : sector.active state) : branch state := by
  exact branchLocked_apply hLocked hActive

theorem onePoleAdmissibleSingleton {alpha : Type u} (carrier : alpha) (hCloses : Prop) :
    HardTransportAdmissible (HardCarrierCycle.singleton carrier hCloses) <-> hCloses := by
  simp [HardTransportAdmissible, HardCarrierCycle.closes_singleton]

theorem localControlWitness {sigma : Type u} {alpha : Type v}
    (record : SoftHardIntegrationRecord sigma alpha)
    (observerState : sigma)
    (sectorState : alpha)
    {branch : alpha -> Prop}
    (hLocked : BranchLockedSoftSector record.softSector branch)
    (hActive : record.softSector.active sectorState)
    (hReady : record.isReady observerState) :
    branch sectorState /\ MissionAdmissible record := by
  refine And.intro ?_ ?_
  exact branchLocked_apply hLocked hActive
  exact missionAdmissible_of_isReady record observerState hReady

theorem branch_locked_binary_witness_of_background
    (hBackground : soft_witness_background) :
    branch_locked_binary_witness := by
  exact soft_witness_background_implies_branch_locked_binary_witness hBackground

theorem soft_witness_repeatability_of_background
    (hBackground : soft_witness_background) :
    soft_witness_repeatability := by
  exact soft_witness_background_implies_soft_witness_repeatability hBackground

theorem one_pole_hard_cycle_admissibility_of_background
    (hBackground : hard_cycle_background) :
    one_pole_hard_cycle_admissibility := by
  exact hard_cycle_background_implies_one_pole_hard_cycle_admissibility hBackground

theorem composite_hard_cycle_repeatability_of_background
    (hBackground : hard_cycle_background) :
    composite_hard_cycle_repeatability := by
  exact hard_cycle_background_implies_composite_hard_cycle_repeatability hBackground

theorem integrated_soft_to_hard_mission_admissibility_of_background
    (hBackground : mission_stack_background) :
    integrated_soft_to_hard_mission_admissibility := by
  exact mission_stack_background_implies_integrated_soft_to_hard_mission_admissibility hBackground

theorem ftl_target_suite_of_background
    (hSoft : soft_witness_background)
    (hHard : hard_cycle_background)
    (hMission : mission_stack_background) :
    branch_locked_binary_witness /\
      soft_witness_repeatability /\
      one_pole_hard_cycle_admissibility /\
      composite_hard_cycle_repeatability /\
      integrated_soft_to_hard_mission_admissibility := by
  refine And.intro (branch_locked_binary_witness_of_background hSoft) ?_
  refine And.intro (soft_witness_repeatability_of_background hSoft) ?_
  refine And.intro (one_pole_hard_cycle_admissibility_of_background hHard) ?_
  refine And.intro (composite_hard_cycle_repeatability_of_background hHard) ?_
  exact integrated_soft_to_hard_mission_admissibility_of_background hMission

theorem ftl_target_suite_of_full_background
    (hBackground : full_ftl_background) :
    ftl_target_suite := by
  exact full_ftl_background_implies_ftl_target_suite hBackground

theorem mission_admissible_with_ftl_target_suite
    {sigma : Type u} {alpha : Type v}
    (record : SoftHardIntegrationRecord sigma alpha)
    (observerState : sigma)
    (hReady : record.isReady observerState)
    (hBackground : full_ftl_background) :
    MissionAdmissible record /\
      ftl_target_suite := by
  refine And.intro ?_ ?_
  exact missionAdmissible_of_isReady record observerState hReady
  exact ftl_target_suite_of_full_background hBackground

theorem integrated_mission_witness_with_ftl_target_suite
    {sigma : Type u} {alpha : Type v}
    (witness : IntegratedMissionWitness sigma alpha)
    (hBackground : full_ftl_background) :
    MissionAdmissible witness.mission.record /\
      ftl_target_suite := by
  refine And.intro ?_ ?_
  exact witness.mission.admissible
  exact ftl_target_suite_of_full_background hBackground

theorem integrated_mission_local_control_and_target_suite
    {sigma : Type u} {alpha : Type v}
    (witness : IntegratedMissionWitness sigma alpha)
    {sectorState : alpha}
    (hActive : witness.mission.record.softSector.active sectorState)
    (hBackground : full_ftl_background) :
    witness.soft.branch sectorState /\
      MissionAdmissible witness.mission.record /\
      ftl_target_suite := by
  refine And.intro ?_ ?_
  exact (witness.localControl hActive).left
  refine And.intro ?_ ?_
  exact (witness.localControl hActive).right
  exact ftl_target_suite_of_full_background hBackground

end PhysicsLean
