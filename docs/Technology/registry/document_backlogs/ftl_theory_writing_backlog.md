# FTL Theory Writing Backlog

## Purpose

Write the canonical FTL theory document in strict scientific English so that it faithfully reconstructs the source theory while staying aligned with the current source-backed Lean package.

Primary source anchors:

- `docs/Technology/FTL_v1.md`
- `docs/Technology/FTL_Dev_v1.md`
- `docs/Technology/FTL_Dev_Roadmap_v1.md`
- `docs/Technology/FTL/`
- `PhysicsLean/PhysicsLean/Technology/FTL/`

Target output:

- `docs/Technology/programs/ftl/theory/latex/ftl_theory_main.tex`

## Writing rules

1. The theory document must preserve the soft-route / hard-route split from the source materials.
2. The document must explicitly separate proved structural statements from engineering boundary statements.
3. Every theorem written into the manuscript must be paired with a standard formula-text proof in ordinary mathematical prose.
4. The text must stay synchronized with the current FTL Lean layer, especially for target suites, background bundles, mission admissibility, and engineering-boundary statements.
5. Any unresolved engineering reachability claim must remain marked as a boundary or roadmap item.

## Canonical anchors

- Source inventory: `docs/Technology/registry/source_inventory.md`
- Lean source backlog: `docs/Technology/registry/lean_source_backlogs/ftl_lean_source_backlog.md`
- Lean public package: `PhysicsLean/PhysicsLean/Technology/FTL/`
- Canonical theory manuscript root: `docs/Technology/programs/ftl/theory/`

## Chapter map

The canonical manuscript must be assembled from separate files under `docs/Technology/programs/ftl/theory/latex/chapters/`.

- `00_protocol_and_vocabulary.tex`
- `01_imported_foundations.tex`
- `02_soft_route.tex`
- `03_hard_route.tex`
- `04_integrated_architecture.tex`
- `05_material_assumptions_and_constraints.tex`
- `06_failure_modes_and_nonclaims.tex`
- `07_forward_dependencies.tex`
- `08_proofs.tex`

## Backlog

| ID | Status | Task | Output path |
| --- | --- | --- | --- |
| FTL-THEORY-01 | `done` | Build a source-to-manuscript section ledger for observer-relative luminal framework, branch-locked soft sectors, hard carrier cycles, mission integration, audit closure, and engineering boundary. | `docs/Technology/programs/ftl/theory/tables/ftl_section_ledger.tex` |
| FTL-THEORY-02 | `done` | Build a theorem provenance table mapping manuscript theorems to the exact FTL source files and current Lean declarations. | `docs/Technology/programs/ftl/theory/tables/ftl_theorem_provenance_table.tex` |
| FTL-THEORY-03 | `done` | Write the notation and status section fixing the vocabulary for soft links, hard carriers, mission admissibility, repeatability, calibration, and engineering closure. | `docs/Technology/programs/ftl/theory/latex/chapters/` |
| FTL-THEORY-04 | `done` | Write the soft-route theory section for observer-relative FTL, branch locking, witness families, repeatability, and scanner-style operational structure. | `docs/Technology/programs/ftl/theory/latex/chapters/` |
| FTL-THEORY-05 | `done` | Write the hard-route theory section for carrier cycles, projected poles, identity preservation, composite binding, and admissibility classes. | `docs/Technology/programs/ftl/theory/latex/chapters/` |
| FTL-THEORY-06 | `done` | Write the mission-stack section covering readiness predicates, soft-hard integration, mission admissibility, and the scope of integrated soft-to-hard targets. | `docs/Technology/programs/ftl/theory/latex/chapters/` |
| FTL-THEORY-07 | `done` | Write formula-text proofs for the theorem set chosen from the soft-route, hard-route, and mission-stack layers, mirroring the Lean proof content without reducing the document to code commentary. Use a separate proof chapter with explicit theorem links from the main text. | `docs/Technology/programs/ftl/theory/latex/chapters/08_proofs.tex` |
| FTL-THEORY-08 | `done` | Write the audit and engineering-boundary section distinguishing formal closure, calibration closure, material embedding, and non-claims. | `docs/Technology/programs/ftl/theory/latex/chapters/` |
| FTL-THEORY-09 | `done` | Integrate the theory sections and provenance tables into `ftl_theory_main.tex` and compile cleanly. | `docs/Technology/programs/ftl/theory/latex/ftl_theory_main.tex` |

## Current expansion state

- The soft-route, hard-route, integrated architecture, material constraints, failure/non-claim, forward-dependency, and proof-companion chapters have now been rewritten in direct source order from `FTL_v1.md` and `FTL_Dev_v1.md` rather than by compressed reconstruction.
- The proof-companion chapter has been realigned to the rewritten theorem flow while preserving the theorem and proposition labels used by the route and integration chapters.
- Latest validated build state: `ftl_theory_main.pdf` compiles successfully at 67 pages with only residual box and bookmark warnings and no fatal LaTeX errors.

## Acceptance criteria

1. The final theory manuscript preserves the source soft/hard split and the current Lean bundle structure.
2. Every theorem included in the text has a prose proof.
3. Engineering boundary claims are not presented as already physically realized transport results.
4. The manuscript compiles cleanly and is traceable source -> Lean -> prose.
