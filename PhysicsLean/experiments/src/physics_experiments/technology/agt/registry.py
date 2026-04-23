from __future__ import annotations

from pathlib import Path


WORKSPACE_ROOT = Path(__file__).resolve().parents[6]
PROGRAM_ROOT = WORKSPACE_ROOT / "docs" / "Technology" / "programs" / "agt"
SOFTWARE_ROOT = PROGRAM_ROOT / "software" / "src" / "agt_v11c"
THEORY_MANUSCRIPT = PROGRAM_ROOT / "theory" / "latex" / "agt_theory_main.tex"
COMPUTATIONAL_MANUSCRIPT = PROGRAM_ROOT / "computational" / "latex" / "agt_computational_main.tex"
REPORT_CONTRACT = PROGRAM_ROOT / "software" / "reports" / "agt_v11c_report_contract.md"


def canonical_paths() -> dict[str, Path]:
    return {
        "program_root": PROGRAM_ROOT,
        "software_root": SOFTWARE_ROOT,
        "theory_manuscript": THEORY_MANUSCRIPT,
        "computational_manuscript": COMPUTATIONAL_MANUSCRIPT,
        "report_contract": REPORT_CONTRACT,
    }