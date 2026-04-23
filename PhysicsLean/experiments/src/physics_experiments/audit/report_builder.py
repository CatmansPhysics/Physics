from physics_experiments.audit.checkpoint_runner import run_checkpoints


def build_report() -> dict[str, object]:
    results = run_checkpoints()
    return {"status": "ok" if all(results.values()) else "failed", "checkpoints": results}