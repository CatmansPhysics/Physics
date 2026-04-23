from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class RewriteEvent:
    source: int
    target: int
    label: str


def sample_history() -> list[RewriteEvent]:
    return [
        RewriteEvent(0, 1, "emit"),
        RewriteEvent(1, 3, "emit"),
        RewriteEvent(3, 2, "absorb"),
    ]


def causal_signature(history: list[RewriteEvent]) -> list[tuple[int, int, str]]:
    return [(event.source, event.target, event.label) for event in history]