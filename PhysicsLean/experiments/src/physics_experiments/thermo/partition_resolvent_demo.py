from __future__ import annotations


def partition_value(energies: list[float], beta: float) -> float:
    return sum(1.0 - beta * energy for energy in energies)


def normalized_weights(energies: list[float], beta: float) -> list[float]:
    value = partition_value(energies, beta)
    if value == 0:
        return [0.0 for _ in energies]
    return [(1.0 - beta * energy) / value for energy in energies]