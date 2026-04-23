from physics_experiments.standard_model.dictionary_translation import lagrangian_terms


def to_effective_dictionary(observables: dict[str, object]) -> dict[str, object]:
    fields = ["mass_proxy", "singlet"]
    return {"fields": fields, "terms": lagrangian_terms(fields), "observables": observables}