def vocabulary_size(tokens: list[str]) -> int:
    return len(set(tokens))


def coordination_score(tokens: list[str]) -> int:
    return len(tokens) + vocabulary_size(tokens)