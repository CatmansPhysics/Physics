import PhysicsLean.Technology.FTL.MissionControl
import PhysicsLean.Technology.FTL.Targets
import PhysicsLean.Technology.FTL.Source

namespace PhysicsLean

def soft_witness_background : Prop :=
  branch_locked_binary_witness ∧ soft_witness_repeatability

def hard_cycle_background : Prop :=
  one_pole_hard_cycle_admissibility ∧ composite_hard_cycle_repeatability

def mission_stack_background : Prop :=
  integrated_soft_to_hard_mission_admissibility

def medium_relative_calibration_background : Prop :=
  Technology.FTL.Source.theoremClosureReached

def full_ftl_background : Prop :=
  soft_witness_background ∧
    hard_cycle_background ∧ mission_stack_background ∧ medium_relative_calibration_background

theorem soft_witness_background_implies_branch_locked_binary_witness :
  soft_witness_background -> branch_locked_binary_witness := by
  intro hBackground
  exact hBackground.left

theorem soft_witness_background_implies_soft_witness_repeatability :
  soft_witness_background -> soft_witness_repeatability := by
  intro hBackground
  exact hBackground.right

theorem hard_cycle_background_implies_one_pole_hard_cycle_admissibility :
  hard_cycle_background -> one_pole_hard_cycle_admissibility := by
  intro hBackground
  exact hBackground.left

theorem hard_cycle_background_implies_composite_hard_cycle_repeatability :
  hard_cycle_background -> composite_hard_cycle_repeatability := by
  intro hBackground
  exact hBackground.right

theorem mission_stack_background_implies_integrated_soft_to_hard_mission_admissibility :
  mission_stack_background -> integrated_soft_to_hard_mission_admissibility := by
  intro hBackground
  exact hBackground

theorem full_ftl_background_implies_soft_witness_background :
  full_ftl_background -> soft_witness_background := by
  intro hBackground
  exact hBackground.left

theorem full_ftl_background_implies_hard_cycle_background :
  full_ftl_background -> hard_cycle_background := by
  intro hBackground
  exact hBackground.right.left

theorem full_ftl_background_implies_mission_stack_background :
  full_ftl_background -> mission_stack_background := by
  intro hBackground
  exact hBackground.right.right.left

theorem full_ftl_background_implies_medium_relative_calibration_background :
  full_ftl_background -> medium_relative_calibration_background := by
  intro hBackground
  exact hBackground.right.right.right

theorem full_ftl_background_implies_ftl_target_suite :
  full_ftl_background -> ftl_target_suite := by
  intro hBackground
  refine And.intro
    (soft_witness_background_implies_branch_locked_binary_witness
      (full_ftl_background_implies_soft_witness_background hBackground)) ?_
  refine And.intro
    (soft_witness_background_implies_soft_witness_repeatability
      (full_ftl_background_implies_soft_witness_background hBackground)) ?_
  refine And.intro
    (hard_cycle_background_implies_one_pole_hard_cycle_admissibility
      (full_ftl_background_implies_hard_cycle_background hBackground)) ?_
  refine And.intro
    (hard_cycle_background_implies_composite_hard_cycle_repeatability
      (full_ftl_background_implies_hard_cycle_background hBackground)) ?_
  exact mission_stack_background_implies_integrated_soft_to_hard_mission_admissibility
    (full_ftl_background_implies_mission_stack_background hBackground)

end PhysicsLean
