import PhysicsLean.Technology.FTL.MissionControl
import PhysicsLean.Technology.FTL.Source

namespace PhysicsLean

def branch_locked_binary_witness : Prop :=
  Exists fun profile : Technology.FTL.Source.SoftWitnessProfile =>
    Technology.FTL.Source.hasBinaryWitness profile

def soft_witness_repeatability : Prop :=
  Technology.FTL.Source.softNCycleStable Technology.FTL.Source.defaultSoftRepeatabilityData

def one_pole_hard_cycle_admissibility : Prop :=
  Technology.FTL.Source.defaultOnePoleTransportCandidate ∧
    Technology.FTL.Source.defaultIdentityPreservingCycle

def composite_hard_cycle_repeatability : Prop :=
  Technology.FTL.Source.hardNCycleStable Technology.FTL.Source.defaultHardRepeatabilityData

def integrated_soft_to_hard_mission_admissibility : Prop :=
  Technology.FTL.Source.engineeringBoundaryReached

def ftl_target_suite : Prop :=
  branch_locked_binary_witness ∧
    soft_witness_repeatability ∧
      one_pole_hard_cycle_admissibility ∧
        composite_hard_cycle_repeatability ∧ integrated_soft_to_hard_mission_admissibility

theorem ftl_target_suite_implies_branch_locked_binary_witness :
  ftl_target_suite -> branch_locked_binary_witness := by
  intro hSuite
  exact hSuite.left

theorem ftl_target_suite_implies_soft_witness_repeatability :
  ftl_target_suite -> soft_witness_repeatability := by
  intro hSuite
  exact hSuite.right.left

theorem ftl_target_suite_implies_one_pole_hard_cycle_admissibility :
  ftl_target_suite -> one_pole_hard_cycle_admissibility := by
  intro hSuite
  exact hSuite.right.right.left

theorem ftl_target_suite_implies_composite_hard_cycle_repeatability :
  ftl_target_suite -> composite_hard_cycle_repeatability := by
  intro hSuite
  exact hSuite.right.right.right.left

theorem ftl_target_suite_implies_integrated_soft_to_hard_mission_admissibility :
  ftl_target_suite -> integrated_soft_to_hard_mission_admissibility := by
  intro hSuite
  exact hSuite.right.right.right.right

end PhysicsLean
