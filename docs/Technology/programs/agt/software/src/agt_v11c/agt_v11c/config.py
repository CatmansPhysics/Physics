from __future__ import annotations

from dataclasses import dataclass
import numpy as np


@dataclass(frozen=True)
class GraphConfig:
    N: int = 96
    epsilon: float = 0.02
    long_edges: tuple[tuple[int, int], ...] = ()


@dataclass(frozen=True)
class SectorParams:
    a_hop: float = 1.0
    a_bind: float = 1.35
    a_unbind: float = 0.85
    a0: float = 0.90
    a_n: float = 0.80
    a_n_tilde: float = 1.10
    beta0: float = 0.08
    gamma0: float = 0.08


@dataclass(frozen=True)
class InterfaceParams:
    kind: str
    h0: float = 1.0
    mu: float = 1.2
    ell_h: float = 2.0
    i0: int = 48
    left: int = 28
    right: int = 68
    ic: int = 48
    R: int = 10
    V_scale: float = 12.0


@dataclass(frozen=True)
class RunParams:
    dt: float = 0.02
    T: float = 400.0
    gamma_int: float = 0.0
    ds: float = 1e-4
    eta_lo: float = 1e-3
    eta_hi: float = 5.0
    q_grid_small: tuple[float, ...] = (0.0, 0.02, 0.04, 0.06, 0.08)


@dataclass(frozen=True)
class ProbeConfig:
    sector: str
    x0: float
    q0: float


def default_q_scan(center: float, width: float, n: int = 81) -> np.ndarray:
    lo = max(0.02, center - width)
    hi = center + width
    return np.linspace(lo, hi, n)
