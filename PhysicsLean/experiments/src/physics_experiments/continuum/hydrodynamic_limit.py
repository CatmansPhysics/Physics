def coarse_flux(mass_density: float, velocity: float) -> float:
    return mass_density * velocity


def hydrodynamic_state(mass_density: float, velocity: float, pressure: float) -> dict[str, float]:
    return {"mass_density": mass_density, "velocity": velocity, "pressure": pressure, "flux": coarse_flux(mass_density, velocity)}