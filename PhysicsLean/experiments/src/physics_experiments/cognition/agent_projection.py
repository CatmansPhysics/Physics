def update_beliefs(beliefs: list[str], observation: str) -> list[str]:
    return [observation] + beliefs


def agent_focus(beliefs: list[str]) -> str | None:
    return beliefs[0] if beliefs else None