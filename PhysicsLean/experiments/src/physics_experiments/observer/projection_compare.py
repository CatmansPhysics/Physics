from __future__ import annotations

from dataclasses import dataclass

from physics_experiments.observer.causal_histories import RewriteEvent, sample_history


@dataclass(frozen=True)
class Observer:
    name: str
    projector: callable
    clock: callable


def fine_observer() -> Observer:
    return Observer("fine", projector=lambda event: event.target, clock=lambda event: event.target)


def coarse_observer() -> Observer:
    return Observer("coarse", projector=lambda event: event.target % 2, clock=lambda event: event.target // 2)


def projection_trace(observer: Observer, history: list[RewriteEvent] | None = None) -> list[int]:
    history = history or sample_history()
    return [observer.projector(event) for event in history]


def clock_trace(observer: Observer, history: list[RewriteEvent] | None = None) -> list[int]:
    history = history or sample_history()
    return [observer.clock(event) for event in history]