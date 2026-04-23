from physics_experiments.standard_model.anomaly_checks import anomaly_compatible
from physics_experiments.standard_model.color_singlets import is_singlet
from physics_experiments.standard_model.dictionary_translation import lagrangian_terms
from physics_experiments.standard_model.flavour_blocks import mixing_strength
from physics_experiments.standard_model.residue_branch_scan import branch_candidates


def test_standard_model_toys() -> None:
    assert anomaly_compatible([1.0, -1.0])
    assert is_singlet([1, -1, 0])
    assert lagrangian_terms(["psi", "A"]) == ["L[psi]", "L[A]"]
    assert mixing_strength([[1.0, 0.5], [0.5, 1.0]]) == 3.0
    assert branch_candidates([1.0, -1.0])[0]["charge_sum"] == 0.0