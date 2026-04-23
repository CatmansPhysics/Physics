from __future__ import annotations

import sys
from pathlib import Path

import pytest


ROOT = Path(__file__).resolve().parents[1] / "src" / "p0_prototype"
sys.path.insert(0, str(ROOT))


def test_p0_execute_run_smoke() -> None:
    pytest.importorskip("pandas")
    pytest.importorskip("matplotlib")

    from p0.calibration import calibrate_q_star
    from p0.calibration_states import manual_states
    from p0.config import Config
    from p0.protocol import execute_run
    from p0.state import State

    cfg = Config()
    good, bad = manual_states(cfg)
    q_star = calibrate_q_star(
        cfg,
        good,
        bad,
        order_negative_labels=[
            "DenseAmorphous",
            "OffLatticeDense",
            "MixedCrystalStrained",
            "UnderfilledIdeal",
            "GlassLikeNoisy",
            "FragmentedIslands",
        ],
    ).q_star

    seed = State(
        frozenset({(6, 6), (6, 8), (8, 6), (8, 8)}),
        frozenset(),
        frozenset(),
        label="test_seed",
    )
    result = execute_run(cfg, seed, reservoir_units=80, q_star=q_star)

    assert result.verdict in {
        "FAIL_RESERVOIR",
        "FAIL_GROWTH",
        "GLASS_CAPTURE",
        "SOFT_SUCCESS",
        "HARD_SUCCESS",
    }
    assert "Q" in result.metrics
    assert "d" in result.metrics