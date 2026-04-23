from __future__ import annotations

import sys
from pathlib import Path

import pytest


ROOT = Path(__file__).resolve().parents[1] / "src" / "agt_v11c"
sys.path.insert(0, str(ROOT))


def test_agt_v11c_run_all_smoke(tmp_path: Path) -> None:
    pytest.importorskip("numpy")
    pytest.importorskip("pandas")
    pytest.importorskip("matplotlib")
    pytest.importorskip("scipy")

    from agt_v11c.experiments import run_all

    summary = run_all(tmp_path)

    assert "strip" in summary
    assert "bubble" in summary
    assert (tmp_path / "results" / "SUMMARY.md").exists()
    assert (tmp_path / "results" / "summary.json").exists()