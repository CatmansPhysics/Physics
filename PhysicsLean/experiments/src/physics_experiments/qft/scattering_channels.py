def channel_balance(incoming: list[str], outgoing: list[str]) -> int:
    return len(outgoing) - len(incoming)


def scattering_amplitude(balance: int, coupling: float) -> float:
    return balance * coupling