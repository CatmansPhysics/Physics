import PhysicsLean.Technology.AGT.CompositeSectors
import PhysicsLean.Technology.AGT.SignedSource
import PhysicsLean.Technology.AGT.Source

namespace PhysicsLean

def grav_residue_rewrite_invariance : Prop :=
  forall {sourceResidue probeResidue : Technology.AGT.Source.SignedResidue},
    Technology.AGT.Source.SignedResidue.oppositeSign sourceResidue probeResidue ->
      Technology.AGT.Source.pairPotentialRegime sourceResidue probeResidue =
        Technology.AGT.Source.PairRegime.repulsive

def grav_residue_distinct_from_mass_like_spectral_data : Prop :=
  Exists fun entry : Technology.AGT.Source.ClosureLedgerEntry =>
    entry.topic = "Spectral sign bridge"

def neutral_composite_closure : Prop :=
  Exists fun criteria : Technology.AGT.Source.ClosureCriteria =>
    Technology.AGT.Source.MinimalClosure criteria

def repulsive_scaling_window : Prop :=
  Exists fun void : Technology.AGT.Source.RepulsiveVoid =>
    Technology.AGT.Source.IsRepulsiveVoid void

def spectral_observer_compatibility : Prop :=
  Exists fun gate : Technology.AGT.Source.PrototypeGate =>
    gate.code = "G2"

def agt_target_suite : Prop :=
  grav_residue_rewrite_invariance ∧
    grav_residue_distinct_from_mass_like_spectral_data ∧
      neutral_composite_closure ∧
        repulsive_scaling_window ∧ spectral_observer_compatibility

theorem agt_target_suite_implies_grav_residue_rewrite_invariance :
  agt_target_suite -> grav_residue_rewrite_invariance := by
  intro hSuite
  exact hSuite.left

theorem agt_target_suite_implies_grav_residue_distinct_from_mass_like_spectral_data :
  agt_target_suite -> grav_residue_distinct_from_mass_like_spectral_data := by
  intro hSuite
  exact hSuite.right.left

theorem agt_target_suite_implies_neutral_composite_closure :
  agt_target_suite -> neutral_composite_closure := by
  intro hSuite
  exact hSuite.right.right.left

theorem agt_target_suite_implies_repulsive_scaling_window :
  agt_target_suite -> repulsive_scaling_window := by
  intro hSuite
  exact hSuite.right.right.right.left

theorem agt_target_suite_implies_spectral_observer_compatibility :
  agt_target_suite -> spectral_observer_compatibility := by
  intro hSuite
  exact hSuite.right.right.right.right

end PhysicsLean
