from physics_experiments.standard_model.anomaly_checks import anomaly_compatible


def filter_branch(observables: dict[str, object]) -> dict[str, object]:
    charges = observables["charges"]
    return {"charges": charges, "admissible": anomaly_compatible(charges)}