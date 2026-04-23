from physics_experiments.biology.self_replication_toy import adaptation_score, stable_replication
from physics_experiments.chemistry.reaction_graphs import bond_count, reaction_count
from physics_experiments.cognition.agent_projection import agent_focus, update_beliefs
from physics_experiments.language.symbolic_coordination import coordination_score, vocabulary_size


def test_chemistry_biology_toys() -> None:
    assert reaction_count([(["A"], ["B"]), (["B"], ["C"])]) == 2
    assert bond_count([("A", "B"), ("B", "C")]) == 2
    assert stable_replication(2, 0.9)
    assert adaptation_score(1.5, 0.5) == 2.0


def test_cognition_language_toys() -> None:
    beliefs = update_beliefs(["old"], "new")
    assert agent_focus(beliefs) == "new"
    assert vocabulary_size(["a", "b", "a"]) == 2
    assert coordination_score(["a", "b", "a"]) == 5