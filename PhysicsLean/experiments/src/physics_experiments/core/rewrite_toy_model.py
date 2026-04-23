from __future__ import annotations


def cancel_adjacent_sp_pairs(word: str) -> str:
    """Cancel adjacent `SP` or `PS` pairs until a normal form is reached."""
    changed = True
    current = word
    while changed:
        next_word = current.replace("SP", "").replace("PS", "")
        changed = next_word != current
        current = next_word
    return current


def semantic_charge(word: str) -> int:
    return word.count("S") - word.count("P")


def reduction_preserves_semantics(word: str) -> bool:
    return semantic_charge(word) == semantic_charge(cancel_adjacent_sp_pairs(word))