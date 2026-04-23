def continuity_residual(density: float, current: float) -> float:
    return density - current


def diffuse_step(value: float, diffusivity: float, laplace: float) -> float:
    return value + diffusivity * laplace