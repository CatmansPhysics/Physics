from __future__ import annotations

from pathlib import Path
import json

from agt_v11c.experiments import run_all


def main():
    here = Path(__file__).resolve().parents[1]
    out = here / 'results'
    summary = run_all(out)
    print(json.dumps(summary, indent=2))


if __name__ == '__main__':
    main()
