from __future__ import annotations

from physics_experiments.dynamics.action_toy_models import energy_momentum_shadow, history_action
from physics_experiments.observer.causal_histories import causal_signature, sample_history
from physics_experiments.observer.projection_compare import (
    clock_trace,
    coarse_observer,
    fine_observer,
    projection_trace,
)


def test_causal_history_signature_is_stable() -> None:
    assert causal_signature(sample_history()) == [
        (0, 1, "emit"),
        (1, 3, "emit"),
        (3, 2, "absorb"),
    ]


def test_observer_projections_differ() -> None:
    assert projection_trace(fine_observer()) == [1, 3, 2]
    assert projection_trace(coarse_observer()) == [1, 1, 0]
    assert clock_trace(coarse_observer()) == [0, 1, 1]


def test_action_shadow_matches_toy_history() -> None:
    assert history_action() == 2
    assert energy_momentum_shadow() == (2, 3)