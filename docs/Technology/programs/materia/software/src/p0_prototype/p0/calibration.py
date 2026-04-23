from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, Iterable, List, Tuple

import pandas as pd

from .config import Config
from .observables import q_lambda, summarize_state
from .state import State


@dataclass
class CalibrationResult:
    q_star: float
    order_gap: float
    scores: pd.DataFrame


def calibrate_q_star(cfg: Config, good: Dict[str, State], bad: Dict[str, State], order_negative_labels: Iterable[str] | None = None) -> CalibrationResult:
    rows = []
    for family, data in [("good", good), ("bad", bad)]:
        for label, st in data.items():
            row = summarize_state(cfg, st, q_star=0.0)
            row["family"] = family
            rows.append(row)
    df = pd.DataFrame(rows)

    if order_negative_labels is None:
        order_negative_df = df[df["family"] == "bad"]
    else:
        order_negative_df = df[df["label"].isin(list(order_negative_labels))]

    q_good_min = df[df["family"] == "good"]["Q"].min()
    q_bad_max = order_negative_df["Q"].max()
    gap = float(q_good_min - q_bad_max)
    q_star = float((q_good_min + q_bad_max) / 2.0)

    df["q_star"] = q_star
    return CalibrationResult(q_star=q_star, order_gap=gap, scores=df)
