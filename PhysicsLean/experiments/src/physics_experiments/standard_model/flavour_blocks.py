def mixing_strength(matrix: list[list[float]]) -> float:
    return sum(abs(value) for row in matrix for value in row)