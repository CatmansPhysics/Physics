from __future__ import annotations

import numpy as np
from .config import GraphConfig


def build_open_chain_adjacency(cfg: GraphConfig) -> np.ndarray:
    N = cfg.N
    A = np.zeros((N, N), dtype=float)
    for i in range(N - 1):
        A[i, i + 1] = 1.0
        A[i + 1, i] = 1.0
    for i, j in cfg.long_edges:
        if 0 <= i < N and 0 <= j < N and i != j:
            A[i, j] = 1.0
            A[j, i] = 1.0
    return A


def laplacian_from_adjacency(A: np.ndarray) -> np.ndarray:
    D = np.diag(A.sum(axis=1))
    return D - A


def ring_distance(i: int, j: int, N: int) -> int:
    d = abs(i - j)
    return min(d, N - d)
