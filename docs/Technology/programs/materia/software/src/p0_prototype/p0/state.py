from dataclasses import dataclass, field
from typing import FrozenSet, Iterable, Optional, Set, Tuple

Coord = Tuple[int, int]


@dataclass(frozen=True)
class State:
    ideal: FrozenSet[Coord] = field(default_factory=frozenset)
    strained: FrozenSet[Coord] = field(default_factory=frozenset)
    external: FrozenSet[Coord] = field(default_factory=frozenset)
    label: str = ""

    def copy_with(self, ideal=None, strained=None, external=None, label: Optional[str] = None) -> "State":
        return State(
            ideal=frozenset(self.ideal if ideal is None else ideal),
            strained=frozenset(self.strained if strained is None else strained),
            external=frozenset(self.external if external is None else external),
            label=self.label if label is None else label,
        )


@dataclass
class Reservoir:
    total_units: int
    label: str = ""

    @property
    def capacity(self) -> int:
        return self.total_units
