from physics_experiments.continuum.hydrodynamic_limit import coarse_flux, hydrodynamic_state
from physics_experiments.continuum.transport_toy import continuity_residual, diffuse_step
from physics_experiments.many_body.phase_toy_model import classify_phase
from physics_experiments.qft.pole_residue_demo import pole_count, residue_weight
from physics_experiments.qft.scattering_channels import channel_balance, scattering_amplitude


def test_transport_and_hydrodynamic_toys() -> None:
    assert continuity_residual(3.0, 1.5) == 1.5
    assert diffuse_step(1.0, 0.2, -0.5) == 0.9
    assert coarse_flux(2.0, 4.0) == 8.0
    assert hydrodynamic_state(2.0, 4.0, 1.0)["flux"] == 8.0


def test_qft_and_many_body_toys() -> None:
    assert pole_count([1.0, -1.0, 2.0]) == 3
    assert residue_weight([1.0, -1.0, 2.0]) == 4.0
    assert channel_balance(["a", "b"], ["c"]) == -1
    assert scattering_amplitude(-1, 0.5) == -0.5
    assert classify_phase(0.0, True) == "topological"