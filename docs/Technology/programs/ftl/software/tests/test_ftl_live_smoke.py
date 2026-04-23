from __future__ import annotations

import sys
from pathlib import Path

import pytest


BASE = Path(__file__).resolve().parents[1] / "src" / "ftl_live"


def test_soft_array_closeout_smoke() -> None:
    pytest.importorskip("numpy")
    pytest.importorskip("pandas")

    root = BASE / "soft_s1_m1_array_closeout"
    sys.path.insert(0, str(root))
    try:
        from src.soft_s1_m1_array_closeout import ArrayCloseoutConfig, SoftS1M1ArrayCloseoutSimulator

        cfg = ArrayCloseoutConfig(rows=2, cols=2, read_samples=8)
        simulator = SoftS1M1ArrayCloseoutSimulator(cfg)
        df = simulator.run_cycles(1)
        assert len(df) == 1
        assert "array_accuracy" in df.columns
    finally:
        sys.path.pop(0)


def test_hard_bench_closeout_smoke() -> None:
    pytest.importorskip("pandas")

    root = BASE / "hard_h1_m2_bench_closeout"
    sys.path.insert(0, str(root))
    try:
        from src.hard_h1_m2_bench_closeout import BenchCloseoutConfig, run_campaign

        cfg = BenchCloseoutConfig(
            disorder_levels=(0.04,),
            top_gap_values=(1.05,),
            tau_values=(7.6,),
        )
        df = run_campaign(cfg)
        assert len(df) == 1
        assert "fidelity" in df.columns
    finally:
        sys.path.pop(0)


def test_mission_stack_smoke() -> None:
    pytest.importorskip("numpy")
    pytest.importorskip("pandas")
    pytest.importorskip("matplotlib")

    root = BASE / "mission_stack"
    sys.path.insert(0, str(root))
    try:
        from src.mission_scenario import MissionConfig, run_mission

        out = run_mission(MissionConfig(n_cycles=1))
        assert "summary" in out
        assert not out["summary"].empty
    finally:
        sys.path.pop(0)