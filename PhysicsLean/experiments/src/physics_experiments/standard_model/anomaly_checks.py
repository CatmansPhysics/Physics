def anomaly_compatible(charges: list[float]) -> bool:
    return abs(sum(charges)) < 1e-12