from physics_experiments.audit.checkpoint_runner import run_checkpoints
from physics_experiments.audit.report_builder import build_report


def test_audit_checkpoints_and_report() -> None:
    checkpoints = run_checkpoints()
    assert checkpoints == {"anomaly": True, "singlet": True}
    report = build_report()
    assert report["status"] == "ok"