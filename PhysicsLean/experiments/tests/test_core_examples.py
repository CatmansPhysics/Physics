from __future__ import annotations

from fractions import Fraction

from physics_experiments.core.efu_examples import factor_signature
from physics_experiments.core.resolvent_toy import resolvent
from physics_experiments.core.rewrite_toy_model import (
    cancel_adjacent_sp_pairs,
    reduction_preserves_semantics,
    semantic_charge,
)


def test_rewrite_toy_model_normalizes_word() -> None:
    assert cancel_adjacent_sp_pairs("SSPP") == ""
    assert semantic_charge("SSPP") == 0
    assert reduction_preserves_semantics("SSPP")


def test_efu_signature_tracks_run_lengths() -> None:
    assert factor_signature("SSPPPS") == [("S", 2), ("P", 3), ("S", 1)]


def test_resolvent_2x2_example() -> None:
    kernel = (
        (Fraction(1, 4), Fraction(1, 8)),
        (Fraction(1, 8), Fraction(1, 5)),
    )
    result = resolvent(kernel)
    assert result[0][0] == Fraction(256, 187)
    assert result[0][1] == Fraction(40, 187)
    assert result[1][0] == Fraction(40, 187)
    assert result[1][1] == Fraction(240, 187)