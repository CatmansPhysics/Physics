def export_coverage(summary: dict[str, object]) -> str:
    lines = ["# Coverage Export", ""]
    for key, value in summary.items():
        lines.append(f"- {key}: {value}")
    return "\n".join(lines)