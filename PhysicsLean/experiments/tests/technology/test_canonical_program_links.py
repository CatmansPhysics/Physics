from __future__ import annotations

from physics_experiments.technology.agt import canonical_paths as agt_paths
from physics_experiments.technology.ftl import canonical_paths as ftl_paths
from physics_experiments.technology.materialization import canonical_paths as materialization_paths


def test_agt_canonical_paths_exist() -> None:
    for path in agt_paths().values():
        assert path.exists()


def test_ftl_canonical_paths_exist() -> None:
    for path in ftl_paths().values():
        assert path.exists()


def test_materialization_canonical_paths_exist() -> None:
    for path in materialization_paths().values():
        assert path.exists()