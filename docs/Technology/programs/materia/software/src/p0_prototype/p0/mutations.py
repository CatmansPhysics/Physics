from __future__ import annotations

from typing import Iterable, List, Tuple

from .config import Config
from .state import State

Coord = Tuple[int, int]


def delete_ideal(state: State, site: Coord, label: str) -> State:
    ideal = set(state.ideal)
    ideal.discard(site)
    return state.copy_with(ideal=ideal, label=label)


def insert_strained(state: State, site: Coord, label: str) -> State:
    strained = set(state.strained)
    strained.add(site)
    return state.copy_with(strained=strained, label=label)


def insert_external(state: State, site: Coord, label: str) -> State:
    external = set(state.external)
    external.add(site)
    return state.copy_with(external=external, label=label)


def swap_ideal_to_strained(state: State, ideal_site: Coord, strained_site: Coord, label: str) -> State:
    ideal = set(state.ideal)
    strained = set(state.strained)
    ideal.discard(ideal_site)
    strained.add(strained_site)
    return state.copy_with(ideal=ideal, strained=strained, label=label)


def fragment_cluster(state: State, removed_sites: Iterable[Coord], label: str) -> State:
    ideal = set(state.ideal)
    for s in removed_sites:
        ideal.discard(s)
    return state.copy_with(ideal=ideal, label=label)
