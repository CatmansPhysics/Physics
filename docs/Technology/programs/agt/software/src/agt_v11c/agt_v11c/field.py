from __future__ import annotations

import numpy as np


def build_rho(n_plus: np.ndarray, n_minus: np.ndarray) -> np.ndarray:
    return np.asarray(n_plus, dtype=float) - np.asarray(n_minus, dtype=float)


def solve_phi(L: np.ndarray, epsilon: float, rho: np.ndarray) -> np.ndarray:
    N = L.shape[0]
    M = L + epsilon * np.eye(N)
    return np.linalg.solve(M, rho)
