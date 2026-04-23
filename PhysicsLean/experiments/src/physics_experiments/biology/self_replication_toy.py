def stable_replication(template_copies: int, fidelity: float) -> bool:
    return template_copies > 0 and fidelity >= 0.0


def adaptation_score(fitness: float, memory: float) -> float:
    return fitness + memory