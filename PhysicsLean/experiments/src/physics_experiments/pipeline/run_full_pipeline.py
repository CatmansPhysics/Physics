from physics_experiments.pipeline.structural_initialization import initialize_structure
from physics_experiments.pipeline.pole_residue_extraction import extract_poles
from physics_experiments.pipeline.internal_observables import extract_internal_observables
from physics_experiments.pipeline.electroweak_anomaly_filter import filter_branch
from physics_experiments.pipeline.flavour_color_construction import build_flavour_color
from physics_experiments.pipeline.observable_extraction import extract_observables
from physics_experiments.pipeline.observer_dictionary import to_effective_dictionary


def run_pipeline() -> dict[str, object]:
    structure = initialize_structure(["S", "P"])
    poles = extract_poles([1.0, -1.0])
    observables = extract_internal_observables(poles)
    branch = filter_branch(observables)
    flavour_color = build_flavour_color(branch)
    extracted = extract_observables(flavour_color)
    dictionary = to_effective_dictionary(extracted)
    return {
        "structure": structure,
        "poles": poles,
        "branch": branch,
        "flavour_color": flavour_color,
        "dictionary": dictionary,
    }


if __name__ == "__main__":
    print(run_pipeline())