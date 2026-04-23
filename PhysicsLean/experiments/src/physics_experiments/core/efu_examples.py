from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class EFUFactor:
    symbol: str
    multiplicity: int


def run_length_efu(word: str) -> list[EFUFactor]:
    if not word:
        return []
    factors: list[EFUFactor] = []
    current = word[0]
    count = 1
    for symbol in word[1:]:
        if symbol == current:
            count += 1
        else:
            factors.append(EFUFactor(symbol=current, multiplicity=count))
            current = symbol
            count = 1
    factors.append(EFUFactor(symbol=current, multiplicity=count))
    return factors


def factor_signature(word: str) -> list[tuple[str, int]]:
    return [(factor.symbol, factor.multiplicity) for factor in run_length_efu(word)]