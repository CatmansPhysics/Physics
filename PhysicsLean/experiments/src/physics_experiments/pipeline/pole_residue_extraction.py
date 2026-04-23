def extract_poles(kernel: list[float]) -> dict[str, object]:
    return {"poles": kernel, "count": len(kernel)}