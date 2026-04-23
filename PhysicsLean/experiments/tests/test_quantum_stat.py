from __future__ import annotations

import pytest

from physics_experiments.quantum.decoherence_records import record_is_decoherent, stable_records
from physics_experiments.quantum.history_amplitudes import history_amplitude, weight
from physics_experiments.thermo.entropy_tracking import entropy_shadow
from physics_experiments.thermo.partition_resolvent_demo import normalized_weights, partition_value


def test_history_amplitude_weight() -> None:
    amplitude = history_amplitude([1, 3, 2])
    assert amplitude == complex(6, 3)
    assert weight([1, 3, 2]) == 45.0


def test_decoherence_filter() -> None:
    assert record_is_decoherent(["a", "b", "c"])
    assert not record_is_decoherent(["a", "b", "a"])
    assert stable_records([["a", "b"], ["x", "x"]]) == [["a", "b"]]


def test_partition_and_entropy_shadow() -> None:
    weights = normalized_weights([0.2, 0.4, 0.6], beta=0.5)
    assert partition_value([0.2, 0.4, 0.6], beta=0.5) == 2.4
    assert weights == pytest.approx([0.375, 0.3333333333333333, 0.2916666666666667])
    assert entropy_shadow(weights) > 0.0