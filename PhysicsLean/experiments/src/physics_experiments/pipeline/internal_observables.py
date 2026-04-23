def extract_internal_observables(poles: dict[str, object]) -> dict[str, object]:
    return {"charges": [float(pole) for pole in poles["poles"]], "count": poles["count"]}