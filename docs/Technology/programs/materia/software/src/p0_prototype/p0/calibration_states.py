from .config import Config
from .state import State


def manual_states(cfg: Config):
    L = set(cfg.ideal_sites)
    good = {}
    bad = {}
    good["IdealFull"] = State(frozenset(L), frozenset(), frozenset(), "IdealFull")
    good["BoundaryVacancy"] = State(frozenset(L - {(4, 6)}), frozenset(), frozenset(), "BoundaryVacancy")
    good["CornerVacancy"] = State(frozenset(L - {(4, 4)}), frozenset(), frozenset(), "CornerVacancy")
    good["InteriorHole"] = State(frozenset(L - {(6, 6)}), frozenset(), frozenset(), "InteriorHole")
    good["TwoBoundaryDefects"] = State(frozenset(L - {(4, 10), (10, 4)}), frozenset(), frozenset(), "TwoBoundaryDefects")
    good["SlightlyIncompleteButOrdered"] = State(frozenset(L - {(4, 8), (8, 10)}), frozenset(), frozenset(), "SlightlyIncompleteButOrdered")

    bad["DenseAmorphous"] = State(
        frozenset(),
        frozenset({(4,4),(4,7),(5,5),(5,8),(6,6),(6,10),(7,4),(7,9),(8,5),(8,11),(9,7),(9,10),(10,4),(10,8),(11,6),(11,11)}),
        frozenset(),
        "DenseAmorphous",
    )
    bad["OffLatticeDense"] = State(
        frozenset(),
        frozenset({(5,5),(5,7),(5,9),(5,11),(7,5),(7,7),(7,9),(7,11),(9,5),(9,7),(9,9),(9,11),(11,5),(11,7),(11,9),(11,11)}),
        frozenset(),
        "OffLatticeDense",
    )
    bad["MixedCrystalStrained"] = State(
        frozenset({(4,4),(4,8),(6,6),(6,10),(8,4),(8,8),(10,6),(10,10)}),
        frozenset({(5,4),(5,8),(7,6),(7,10),(9,4),(9,8),(11,6),(11,10)}),
        frozenset(),
        "MixedCrystalStrained",
    )
    bad["UnderfilledIdeal"] = State(
        frozenset({(4,8),(4,10),(6,8),(6,10),(8,8),(8,10),(10,8),(10,10)}),
        frozenset(),
        frozenset(),
        "UnderfilledIdeal",
    )
    bad["SpillOutside"] = State(frozenset(L), frozenset(), frozenset({(3,8),(8,3),(12,8),(8,12)}), "SpillOutside")
    bad["GlassLikeNoisy"] = State(
        frozenset({(4,4),(4,8),(6,6),(8,4),(8,8),(10,10)}),
        frozenset({(5,5),(5,7),(6,9),(7,5),(7,9),(7,11),(9,5),(9,7),(10,9),(11,7)}),
        frozenset(),
        "GlassLikeNoisy",
    )
    bad["FragmentedIslands"] = State(
        frozenset({(4,4),(4,6),(6,4),(6,6),(8,8),(8,10),(10,8),(10,10)}),
        frozenset(),
        frozenset(),
        "FragmentedIslands",
    )
    bad["BorderlineBad"] = State(
        frozenset({(4,4),(4,6),(4,8),(4,10),(6,4),(6,8),(6,10),(8,4),(8,6),(8,10),(10,4),(10,6),(10,8),(10,10)}),
        frozenset({(7,6),(7,8),(9,8)}),
        frozenset(),
        "BorderlineBad",
    )
    return good, bad
