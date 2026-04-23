def extract_observables(data: dict[str, object]) -> dict[str, object]:
    return {"mass_proxy": data["flavour_classes"], "singlet": data["singlet"]}