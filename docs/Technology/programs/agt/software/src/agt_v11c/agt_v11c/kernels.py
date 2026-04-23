from __future__ import annotations

import numpy as np
from .config import SectorParams


def kernel_plus_local(q: float, eta: float, s: float, h_i: float, mu: float, p: SectorParams) -> np.ndarray:
    u = np.exp(-eta * p.a_hop)
    b = np.exp(-eta * p.a_bind)
    c = np.exp(-eta * p.a_unbind)
    d = np.exp(-eta * p.a0)
    a = 2.0 * u * np.cos(q) * s * np.exp(mu * h_i)
    return np.array([[a, b / s], [c * s, d]], dtype=float)


def kernel_minus_local(q: float, eta: float, s: float, h_i: float, mu: float, p: SectorParams) -> np.ndarray:
    u = np.exp(-eta * p.a_hop)
    b = np.exp(-eta * p.a_bind)
    c = np.exp(-eta * p.a_unbind)
    d = np.exp(-eta * p.a0)
    a = 2.0 * u * np.cos(q) * (1.0 / s) * np.exp(-mu * h_i)
    return np.array([[a, b * s], [c / s, d]], dtype=float)


def kernel_zero(eta: float, p: SectorParams) -> np.ndarray:
    d0 = np.exp(-eta * p.a_n)
    dt = np.exp(-eta * p.a_n_tilde)
    return np.array([[d0, p.beta0], [p.gamma0, dt]], dtype=float)


def dominant_lambda(K: np.ndarray) -> float:
    vals = np.linalg.eigvals(K)
    return float(np.max(np.real(vals)))
