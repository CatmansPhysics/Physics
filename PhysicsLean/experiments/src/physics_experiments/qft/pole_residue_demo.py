def pole_count(poles: list[float]) -> int:
    return len(poles)


def residue_weight(poles: list[float]) -> float:
    return sum(abs(pole) for pole in poles)