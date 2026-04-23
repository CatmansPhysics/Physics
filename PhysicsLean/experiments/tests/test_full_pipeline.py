from physics_experiments.pipeline.run_full_pipeline import run_pipeline
from physics_experiments.reporting.coverage_export import export_coverage


def test_full_pipeline() -> None:
    result = run_pipeline()
    assert result["branch"]["admissible"] is True
    assert result["dictionary"]["terms"] == ["L[mass_proxy]", "L[singlet]"]
    exported = export_coverage({"pipeline": "ok", "steps": 7})
    assert "pipeline: ok" in exported