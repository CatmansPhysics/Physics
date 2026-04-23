from __future__ import annotations


def history_amplitude(history: list[int]) -> complex:
    return complex(sum(history), len(history))


def weight(history: list[int]) -> float:
    amplitude = history_amplitude(history)
    return amplitude.real**2 + amplitude.imag**2