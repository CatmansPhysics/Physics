from dataclasses import dataclass, field
from math import pi
from typing import Dict, List, Set, Tuple

Coord = Tuple[int, int]


@dataclass
class Config:
    nx: int = 16
    ny: int = 16
    tx0: int = 4
    tx1: int = 11
    ty0: int = 4
    ty1: int = 11
    tau_o: float = 10.0
    delta_rel: float = 1e-2
    mu_star: float = 2.5
    delta_star: float = 0.08
    eps_o: float = 0.12
    eps_seed: float = 0.2
    beta: float = 2.0
    A_esc: float = 1.0
    l_res: float = 3.0
    # defect weights
    w_coord: float = 1.0
    w_hole: float = 2.0
    w_off: float = 3.0
    w_out: float = 4.0
    # functional weights
    alpha_v: float = 2.0
    alpha_q: float = 10.0
    alpha_d: float = 5.0
    alpha_boundary: float = 1.0
    alpha_contam: float = 3.0
    # local mismatch weights
    c_iso: float = 2.0
    c_coord: float = 1.0
    c_hole: float = 2.0
    c_reg: float = 3.0
    c_near: float = 1.0
    c_spill: float = 10.0
    # growth policy weights
    lambda_mu: float = 3.0
    lambda_d: float = 2.0
    lambda_v: float = 1.0
    lambda_h: float = 1.0
    max_steps: int = 256
    k_lambda: List[Tuple[float, float]] = field(default_factory=lambda: [(pi, 0.0), (0.0, pi), (pi, pi)])

    def __post_init__(self):
        self.target_sites: Set[Coord] = {
            (i, j)
            for i in range(self.tx0, self.tx1 + 1)
            for j in range(self.ty0, self.ty1 + 1)
        }
        self.ideal_sites: Set[Coord] = {
            (i, j)
            for (i, j) in self.target_sites
            if i % 2 == 0 and j % 2 == 0
        }
        self.strained_sites: Set[Coord] = self.target_sites - self.ideal_sites
        self.v_star: int = len(self.ideal_sites)
        self.boundary_sites: Set[Coord] = set()
        self.neighbors: Dict[Coord, List[Coord]] = {}
        for s in self.ideal_sites:
            x, y = s
            nbrs = [(x + 2, y), (x - 2, y), (x, y + 2), (x, y - 2)]
            nbrs = [u for u in nbrs if u in self.ideal_sites]
            self.neighbors[s] = nbrs
            if len(nbrs) < 4:
                self.boundary_sites.add(s)
        self.external_sites: Set[Coord] = {
            (i, j)
            for i in range(self.nx)
            for j in range(self.ny)
            if (i, j) not in self.target_sites
        }
