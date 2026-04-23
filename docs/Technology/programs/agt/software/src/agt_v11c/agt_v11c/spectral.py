from __future__ import annotations

from dataclasses import dataclass
from functools import lru_cache
from typing import Callable

import numpy as np
from scipy.optimize import brentq

from .config import SectorParams, RunParams
from .kernels import kernel_plus_local, kernel_minus_local, kernel_zero, dominant_lambda


@dataclass
class LocalSpectralData:
    m_plus: np.ndarray
    m_minus: np.ndarray
    m_zero: np.ndarray
    Min_plus: np.ndarray
    Min_minus: np.ndarray
    Min_zero: np.ndarray
    Qg_plus: np.ndarray
    Qg_minus: np.ndarray
    Qg_zero: np.ndarray


def _kernel_fn(sector: str) -> Callable:
    if sector == "+":
        return kernel_plus_local
    if sector == "-":
        return kernel_minus_local
    if sector == "0":
        return kernel_zero
    raise ValueError(f"unknown sector {sector}")


class SpectralExtractor:
    def __init__(self, params: SectorParams, run: RunParams):
        self.params = params
        self.run = run

    @lru_cache(maxsize=None)
    def eta_onshell(self, sector: str, q: float, h_i: float, mu: float) -> float:
        q = float(q)
        h_i = float(h_i)
        fn = _kernel_fn(sector)

        def f(eta: float) -> float:
            if sector == "0":
                K = fn(eta, self.params)
            else:
                K = fn(q, eta, 1.0, h_i, mu, self.params)
            return dominant_lambda(K) - 1.0

        xs = np.linspace(self.run.eta_lo, self.run.eta_hi, 300)
        vals = np.array([f(x) for x in xs])
        for a, b, fa, fb in zip(xs[:-1], xs[1:], vals[:-1], vals[1:]):
            if np.isnan(fa) or np.isnan(fb):
                continue
            if fa == 0:
                return float(a)
            if fa * fb < 0:
                return float(brentq(f, a, b, maxiter=200))
        raise RuntimeError(f"No on-shell root for sector={sector}, q={q}, h={h_i}")

    def spectral_charge(self, sector: str, q: float, eta: float, h_i: float, mu: float) -> float:
        if sector == "0":
            return 0.0
        ds = self.run.ds
        fn = _kernel_fn(sector)
        Kp = fn(q, eta, 1.0 + ds, h_i, mu, self.params)
        Km = fn(q, eta, 1.0 - ds, h_i, mu, self.params)
        lp = dominant_lambda(Kp)
        lm = dominant_lambda(Km)
        return float((np.log(lp) - np.log(lm)) / (2.0 * ds))

    def local_branch(self, sector: str, h_i: float, mu: float) -> tuple[float, float, float]:
        qs = np.array(self.run.q_grid_small, dtype=float)
        Es = np.array([self.eta_onshell(sector, float(q), float(h_i), float(mu)) for q in qs])
        X = np.vstack([np.ones_like(qs), qs**2]).T
        coef, *_ = np.linalg.lstsq(X, Es, rcond=None)
        m = float(coef[0])
        A = float(coef[1])
        Min = 1.0 / (2.0 * abs(A)) if abs(A) > 1e-12 else np.inf
        eta0 = float(Es[0])
        Qg = self.spectral_charge(sector, 0.0, eta0, float(h_i), float(mu))
        return m, Min, Qg

    def extract_over_profile(self, h_profile: np.ndarray, mu: float) -> LocalSpectralData:
        N = len(h_profile)
        out = {k: np.zeros(N, dtype=float) for k in [
            'm_plus','m_minus','m_zero','Min_plus','Min_minus','Min_zero','Qg_plus','Qg_minus','Qg_zero']}
        cache: dict[tuple[str, int], tuple[float, float, float]] = {}
        for i, h_i in enumerate(h_profile):
            keyh = int(round(float(h_i) * 10_000))
            for sector, mp, Minp, Qgp in [
                ("+", 'm_plus', 'Min_plus', 'Qg_plus'),
                ("-", 'm_minus', 'Min_minus', 'Qg_minus'),
                ("0", 'm_zero', 'Min_zero', 'Qg_zero'),
            ]:
                key = (sector, keyh)
                if key not in cache:
                    cache[key] = self.local_branch(sector, float(h_i), float(mu))
                m, Min, Qg = cache[key]
                out[mp][i] = m
                out[Minp][i] = Min
                out[Qgp][i] = Qg
        return LocalSpectralData(**out)
