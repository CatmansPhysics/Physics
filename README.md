# Physics

Structural-physical theory workspace: a book-length formal development from
symbolic structures to physics, chemistry, life, language, and the Standard
Model, together with three applied technology programs (AGT, FTL,
Materialization) and a Lean 4 formalization layer with Python experiments.

This repository contains:

- the main theoretical manuscript and supporting markdown drafts under
  [docs/](docs/);
- three technology programs (theory, computational, software, hardware) under
  [docs/Technology/programs/](docs/Technology/programs/);
- the Lean 4 formalization workspace [PhysicsLean/](PhysicsLean/);
- Python computational experiments under
  [PhysicsLean/experiments/](PhysicsLean/experiments/).

## Main physics theory

The canonical theory manuscript is built from LaTeX sources in
[docs/book/](docs/book/):

- Master document: [docs/book/main.tex](docs/book/main.tex)
- Compiled PDF: [docs/book/Physics_v1.pdf](docs/book/Physics_v1.pdf)
- Chapter sources: [docs/book/chapters/](docs/book/chapters/) (27 chapters,
  from symbolic structures and HPatterns through causal rewriting, geometric
  projection, quantum amplitudes, statistical mechanics, the Standard Model
  dictionary, and the main theorem with failure modes).
- Roadmap and remarks:
  [physics_theory_book_roadmap_v1.md](docs/book/physics_theory_book_roadmap_v1.md),
  [Remarks_v4.md](docs/book/Remarks_v4.md).

Auxiliary theory drafts and notes (Russian-language working material):

- [docs/Axioms_v1.md](docs/Axioms_v1.md) — axiomatic base.
- [docs/Fundamentals_v1.md](docs/Fundamentals_v1.md) — fundamentals.
- [docs/Chain_v1.md](docs/Chain_v1.md) — chain of derivations.
- [docs/SM_v1.md](docs/SM_v1.md),
  [docs/SM_Struct_v1.md](docs/SM_Struct_v1.md),
  [docs/SM_Theorems_v1.md](docs/SM_Theorems_v1.md) — Standard Model branch.
- [docs/Roadmap_v1.md](docs/Roadmap_v1.md) — project roadmap.

## Technology programs

Each program has four synchronized layers: theory manuscript, computational
manuscript, reproducible software package, and hardware / laboratory
protocols. Program overview:
[docs/Technology/README.md](docs/Technology/README.md).

### AGT — antigravity technology

Program hub: [docs/Technology/programs/agt/](docs/Technology/programs/agt/)
([README](docs/Technology/programs/agt/README.md))

- Theory:
  [agt_theory_main.tex](docs/Technology/programs/agt/theory/latex/agt_theory_main.tex)
  · [PDF](docs/Technology/programs/agt/theory/latex/agt_theory_main.pdf)
- Computational:
  [agt_computational_main.tex](docs/Technology/programs/agt/computational/latex/agt_computational_main.tex)
  · [PDF](docs/Technology/programs/agt/computational/latex/agt_computational_main.pdf)
- Laboratory companion:
  [agt_laboratory_companion.tex](docs/Technology/programs/agt/hardware/latex/agt_laboratory_companion.tex)
  · [PDF](docs/Technology/programs/agt/hardware/latex/agt_laboratory_companion.pdf)
- Lab protocols:
  [campaign protocol](docs/Technology/programs/agt/hardware/protocols/agt_p3_campaign_protocol.md),
  [run sheet](docs/Technology/programs/agt/hardware/protocols/agt_p3_run_sheet_template.md)
- Software package:
  [docs/Technology/programs/agt/software/](docs/Technology/programs/agt/software/)

### FTL — faster-than-light transport

Program hub: [docs/Technology/programs/ftl/](docs/Technology/programs/ftl/)
([README](docs/Technology/programs/ftl/README.md))

- Theory:
  [ftl_theory_main.tex](docs/Technology/programs/ftl/theory/latex/ftl_theory_main.tex)
  · [PDF](docs/Technology/programs/ftl/theory/latex/ftl_theory_main.pdf)
- Computational:
  [ftl_computational_main.tex](docs/Technology/programs/ftl/computational/latex/ftl_computational_main.tex)
  · [PDF](docs/Technology/programs/ftl/computational/latex/ftl_computational_main.pdf)
- Laboratory companion:
  [ftl_laboratory_companion.tex](docs/Technology/programs/ftl/hardware/latex/ftl_laboratory_companion.tex)
  · [PDF](docs/Technology/programs/ftl/hardware/latex/ftl_laboratory_companion.pdf)
- Lab protocols:
  [soft array](docs/Technology/programs/ftl/hardware/protocols/ftl_soft_array_protocol.md),
  [hard bench](docs/Technology/programs/ftl/hardware/protocols/ftl_hard_bench_protocol.md),
  [integrated readiness](docs/Technology/programs/ftl/hardware/protocols/ftl_i0_readiness_protocol.md),
  [run sheet](docs/Technology/programs/ftl/hardware/protocols/ftl_route_run_sheet_template.md)
- Software package:
  [docs/Technology/programs/ftl/software/](docs/Technology/programs/ftl/software/)

### Materia — materialization

Program hub: [docs/Technology/programs/materia/](docs/Technology/programs/materia/)
([README](docs/Technology/programs/materia/README.md))

- Theory:
  [materialization_theory_main.tex](docs/Technology/programs/materia/theory/latex/materialization_theory_main.tex)
  · [PDF](docs/Technology/programs/materia/theory/latex/materialization_theory_main.pdf)
- Computational:
  [materialization_computational_main.tex](docs/Technology/programs/materia/computational/latex/materialization_computational_main.tex)
  · companion
  [materialization_computational_companion.tex](docs/Technology/programs/materia/computational/latex/materialization_computational_companion.tex)
  · [companion PDF](docs/Technology/programs/materia/computational/latex/materialization_computational_companion.pdf)
- Laboratory companion:
  [materialization_laboratory_companion.tex](docs/Technology/programs/materia/hardware/latex/materialization_laboratory_companion.tex)
  · [PDF](docs/Technology/programs/materia/hardware/latex/materialization_laboratory_companion.pdf)
- Lab protocols:
  [growth & validation](docs/Technology/programs/materia/hardware/protocols/materialization_post_p0_growth_validation_protocol.md),
  [run sheet](docs/Technology/programs/materia/hardware/protocols/h0_cu111_run_sheet_template.md)
- Software package:
  [docs/Technology/programs/materia/software/](docs/Technology/programs/materia/software/)

### Technology registry

- Program backlog:
  [technology_program_backlog.md](docs/Technology/registry/technology_program_backlog.md)
- Source inventory:
  [source_inventory.md](docs/Technology/registry/source_inventory.md)
- Legacy source archives live next to each program under `archive/` and under
  the top-level `docs/Technology/{AGT,FTL,Materia}/` folders; they are
  excluded from git (see [.gitignore](.gitignore)).

## Lean formalization

The Lean 4 workspace lives under [PhysicsLean/](PhysicsLean/)
([README](PhysicsLean/README.md)).

Key entry points:

- Root module: [PhysicsLean.lean](PhysicsLean/PhysicsLean.lean)
- Package config: [lakefile.lean](PhysicsLean/lakefile.lean)
- Toolchain pin: [lean-toolchain](PhysicsLean/lean-toolchain)
  (currently `leanprover/lean4:v4.29.0-rc8`, Mathlib `v4.29.0-rc8`).
- Formalization documentation:
  [module inventory](PhysicsLean/docs/module_inventory.md),
  [chapter-to-module map](PhysicsLean/docs/chapter_to_module_map.md),
  [chapter coverage report](PhysicsLean/docs/chapter_coverage_report.md),
  [audit coverage matrix](PhysicsLean/docs/audit_coverage_matrix.md),
  [experiment registry](PhysicsLean/docs/experiment_registry.md),
  [open targets](PhysicsLean/docs/open_targets.md).

## Installation and build

### Prerequisites

- Lean 4 via [`elan`](https://github.com/leanprover/elan). The toolchain is
  pinned in [PhysicsLean/lean-toolchain](PhysicsLean/lean-toolchain) and
  will be fetched automatically by `elan` on first use.
- Python 3.11 or newer (the experiment package's `pyproject.toml` declares
  `requires-python = ">=3.11"`).
- A TeX Live distribution with `latexmk` if you want to rebuild the PDFs.

Install `elan` (one-time, Linux/macOS):

```sh
curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh
```

### Build the Lean library

```sh
cd PhysicsLean
lake update   # fetch mathlib at the pinned revision (first build only)
lake build    # compile the PhysicsLean library
```

The first build downloads Mathlib and compiles a large dependency graph;
artifacts land in `PhysicsLean/.lake/` and are excluded from git.

### Run the Python experiments

From the repository root:

```sh
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
pip install -e PhysicsLean/experiments
pytest PhysicsLean/experiments
```

The experiment package itself is stdlib-only; `pytest` is the only
third-party dependency (pinned in [requirements.txt](requirements.txt)).

### Rebuild the book PDF

```sh
cd docs/book
latexmk -pdf main.tex
```

The resulting `main.pdf` / `Physics_v1.pdf` is committed as the reference
PDF; LaTeX intermediate artifacts are ignored by git.

## Repository layout

```
docs/
  book/                     LaTeX master, chapters, compiled PDF
  Technology/
    programs/{agt,ftl,materia}/
      theory/               theory manuscript (LaTeX)
      computational/        computational manuscript (LaTeX)
      software/             normalized source / tests / configs / reports
      hardware/             protocols, calibration, BOM, drawings
      archive/              references to legacy packages
    registry/               source inventory and backlog
PhysicsLean/
  PhysicsLean/              Lean modules (foundations -> technology)
  experiments/              Python experiments (stdlib + pytest)
  docs/                     coverage, status, and port manifests
  lakefile.lean             package config (Mathlib-based)
SymSeq/                     external source repository (symlink, excluded)
```
