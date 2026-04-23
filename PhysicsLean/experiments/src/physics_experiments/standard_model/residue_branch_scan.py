def branch_candidates(charges: list[float]) -> list[dict[str, float]]:
    return [{"charge_sum": sum(charges), "count": len(charges)}]