from __future__ import annotations

import numpy as np
from scipy.signal import find_peaks


def negf_scattering(U_arr: np.ndarray, k: float, t: float = 1.0, gamma_arr: np.ndarray | None = None):
    U = np.asarray(U_arr, dtype=complex)
    if gamma_arr is not None:
        U = U - 1j * np.asarray(gamma_arr, dtype=float)
    N = len(U)
    E = -2.0 * t * np.cos(k)

    H = np.diag(U)
    off = -t * np.ones(N - 1, dtype=complex)
    H += np.diag(off, 1) + np.diag(off, -1)

    Sigma = -t * np.exp(1j * k)
    M = E * np.eye(N, dtype=complex) - H
    M[0, 0] -= Sigma
    M[-1, -1] -= Sigma
    G = np.linalg.inv(M)

    Gamma = max(2.0 * t * np.sin(k), 1e-12)
    Tprob = float((Gamma * Gamma) * abs(G[0, -1]) ** 2)
    psi = G[:, 0] * np.sqrt(Gamma)
    dwell = float(np.sum(np.abs(psi) ** 2))
    Aprob = 0.0
    if gamma_arr is not None:
        Aprob = float(2.0 * np.sum(np.asarray(gamma_arr) * np.abs(psi) ** 2))
    Rprob = float(max(0.0, 1.0 - Tprob - Aprob))
    return Tprob, Rprob, Aprob, dwell, psi


def dwell_time_from_scattering(psi_sites: np.ndarray, region_mask: np.ndarray) -> float:
    return float(np.sum(np.abs(psi_sites[region_mask]) ** 2))


def detect_resonance_peaks(q_vals: np.ndarray, dwell_vals: np.ndarray, prominence: float, distance: int = 3):
    peaks, props = find_peaks(dwell_vals, prominence=prominence, distance=distance)
    return peaks, props
