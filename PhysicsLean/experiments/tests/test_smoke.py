from physics_experiments import project_name


def test_project_name() -> None:
    assert project_name() == "physicslean-experiments"