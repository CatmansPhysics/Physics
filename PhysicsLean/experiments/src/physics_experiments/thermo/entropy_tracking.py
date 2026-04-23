from __future__ import annotations


def entropy_term(probability: float) -> float:
    return probability * (1.0 - probability)


def entropy_shadow(probabilities: list[float]) -> float:
    return sum(entropy_term(probability) for probability in probabilities)