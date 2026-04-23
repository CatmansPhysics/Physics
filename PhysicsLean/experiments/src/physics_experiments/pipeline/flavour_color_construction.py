from physics_experiments.standard_model.color_singlets import is_singlet


def build_flavour_color(branch: dict[str, object]) -> dict[str, object]:
    charges = [int(round(charge)) for charge in branch["charges"]]
    return {"flavour_classes": len(charges), "singlet": is_singlet(charges)}