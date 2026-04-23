def lagrangian_terms(fields: list[str]) -> list[str]:
    return [f"L[{field}]" for field in fields]