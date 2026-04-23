from __future__ import annotations

import numpy as np
from .config import InterfaceParams


def build_single_wall(N: int, p: InterfaceParams) -> np.ndarray:
    i = np.arange(N, dtype=float)
    return p.h0 * np.tanh((i - p.i0) / p.ell_h)


def build_strip(N: int, p: InterfaceParams) -> np.ndarray:
    i = np.arange(N, dtype=float)
    return 0.5 * p.h0 * (np.tanh((i - p.left) / p.ell_h) - np.tanh((i - p.right) / p.ell_h))


def build_bubble_open(N: int, p: InterfaceParams) -> np.ndarray:
    i = np.arange(N, dtype=float)
    d = np.abs(i - p.ic)
    return 0.5 * p.h0 * (np.tanh((p.R - d) / p.ell_h) + 1.0)


def interface_mask_wall(N: int, p: InterfaceParams) -> np.ndarray:
    i = np.arange(N)
    return np.abs(i - p.i0) <= int(2 * p.ell_h + 2)


def interface_mask_strip(N: int, p: InterfaceParams) -> np.ndarray:
    i = np.arange(N)
    left_mask = np.abs(i - p.left) <= int(2 * p.ell_h + 2)
    right_mask = np.abs(i - p.right) <= int(2 * p.ell_h + 2)
    return left_mask | right_mask


def bubble_mask(N: int, p: InterfaceParams) -> np.ndarray:
    i = np.arange(N)
    return np.abs(i - p.ic) <= p.R
