from physics_experiments.standard_model.anomaly_checks import anomaly_compatible
from physics_experiments.standard_model.color_singlets import is_singlet


def run_checkpoints() -> dict[str, bool]:
    return {
        "anomaly": anomaly_compatible([1.0, -1.0]),
        "singlet": is_singlet([1, -1, 0]),
    }