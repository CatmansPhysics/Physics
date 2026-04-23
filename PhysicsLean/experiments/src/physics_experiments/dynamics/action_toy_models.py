from __future__ import annotations

from physics_experiments.observer.causal_histories import RewriteEvent, sample_history


def event_cost(event: RewriteEvent) -> int:
    return event.target - event.source


def history_action(history: list[RewriteEvent] | None = None) -> int:
    history = history or sample_history()
    return sum(event_cost(event) for event in history)


def energy_momentum_shadow(history: list[RewriteEvent] | None = None) -> tuple[int, int]:
    history = history or sample_history()
    return history_action(history), len(history)