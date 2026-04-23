import PhysicsLean.Technology.AGT.CompositeSectors
import PhysicsLean.Technology.AGT.SignedSource
import PhysicsLean.Technology.AGT.Targets
import PhysicsLean.Technology.AGT.Source

namespace PhysicsLean

def residue_rewrite_preserves_sign_background : Prop :=
  grav_residue_rewrite_invariance

def observer_force_link_background : Prop :=
  repulsive_scaling_window ∧ spectral_observer_compatibility

def spectral_mass_separation_background : Prop :=
  grav_residue_distinct_from_mass_like_spectral_data

def neutral_composite_closure_background : Prop :=
  neutral_composite_closure

def full_agt_background : Prop :=
  residue_rewrite_preserves_sign_background ∧
    observer_force_link_background ∧
      spectral_mass_separation_background ∧ neutral_composite_closure_background

theorem residue_rewrite_background_implies_target :
  residue_rewrite_preserves_sign_background -> grav_residue_rewrite_invariance := by
  intro hBackground
  exact hBackground

theorem spectral_mass_separation_background_implies_target :
  spectral_mass_separation_background -> grav_residue_distinct_from_mass_like_spectral_data := by
  intro hBackground
  exact hBackground

theorem neutral_composite_closure_background_implies_target :
  neutral_composite_closure_background -> neutral_composite_closure := by
  intro hBackground
  exact hBackground

theorem observer_force_link_background_implies_repulsive_scaling_window :
  observer_force_link_background -> repulsive_scaling_window := by
  intro hBackground
  exact hBackground.left

theorem observer_force_link_background_implies_spectral_observer_compatibility :
  observer_force_link_background -> spectral_observer_compatibility := by
  intro hBackground
  exact hBackground.right

theorem full_agt_background_implies_residue_rewrite_background :
  full_agt_background -> residue_rewrite_preserves_sign_background := by
  intro hBackground
  exact hBackground.left

theorem full_agt_background_implies_observer_force_link_background :
  full_agt_background -> observer_force_link_background := by
  intro hBackground
  exact hBackground.right.left

theorem full_agt_background_implies_spectral_mass_separation_background :
  full_agt_background -> spectral_mass_separation_background := by
  intro hBackground
  exact hBackground.right.right.left

theorem full_agt_background_implies_neutral_composite_closure_background :
  full_agt_background -> neutral_composite_closure_background := by
  intro hBackground
  exact hBackground.right.right.right

theorem full_agt_background_implies_agt_target_suite :
  full_agt_background -> agt_target_suite := by
  intro hBackground
  refine And.intro
    (residue_rewrite_background_implies_target
      (full_agt_background_implies_residue_rewrite_background hBackground)) ?_
  refine And.intro
    (spectral_mass_separation_background_implies_target
      (full_agt_background_implies_spectral_mass_separation_background hBackground)) ?_
  refine And.intro
    (neutral_composite_closure_background_implies_target
      (full_agt_background_implies_neutral_composite_closure_background hBackground)) ?_
  refine And.intro
    (observer_force_link_background_implies_repulsive_scaling_window
      (full_agt_background_implies_observer_force_link_background hBackground)) ?_
  exact observer_force_link_background_implies_spectral_observer_compatibility
    (full_agt_background_implies_observer_force_link_background hBackground)

end PhysicsLean
