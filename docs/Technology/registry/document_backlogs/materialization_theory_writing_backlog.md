# Materialization Theory Writing Backlog

## Purpose

Write the canonical materialization theory document in strict scientific English so that it reconstructs the theory exactly within the scope already represented by the source manuscripts and current Lean formalization.

Primary source anchors:

- `docs/Technology/Matria_v1.md`
- `docs/Technology/Matria_Dev_v1.md`
- `docs/Technology/Materia/`
- `PhysicsLean/PhysicsLean/Technology/Materialization/`

Target output:

- `docs/Technology/programs/materia/theory/latex/materialization_theory_main.tex`

## Writing rules

1. The document must track the source hierarchy from specification and precursor structure through assembly, success, hierarchy, and final audit boundary.
2. The text must stay aligned with the current source-backed Materialization Lean package, including the strengthened lower-chain and audit closure layers.
3. Every theorem in the manuscript must include a standard formula-text proof in ordinary mathematical prose.
4. Claims about later levels of materialization must remain bounded by the current claims-boundary and audit artifacts.
5. The document must distinguish internal formal structure from physical ambition and from explicit non-claims.

## Canonical anchors

- Source inventory: `docs/Technology/registry/source_inventory.md`
- Lean source backlog: `docs/Technology/registry/lean_source_backlogs/materialization_lean_source_backlog.md`
- Lean public package: `PhysicsLean/PhysicsLean/Technology/Materialization/`
- Canonical theory manuscript root: `docs/Technology/programs/materia/theory/`

## Chapter map

The canonical manuscript must be assembled from separate files under `docs/Technology/programs/materia/theory/latex/chapters/`.

- `00_protocol_boundary_and_status.tex`
- `01_imported_foundations_and_boundary.tex`
- `02_specification_theory.tex`
- `03_precursor_and_resource_theory.tex`
- `04_assembly_histories_and_channels.tex`
- `05_success_criteria.tex`
- `06_hierarchy_of_realized_objects.tex`
- `07_derived_propositions_and_targets.tex`
- `08_audit_provenance_and_open_content.tex`
- `09_engineering_transition_and_dependencies.tex`

## Backlog

| ID | Status | Task | Output path |
| --- | --- | --- | --- |
| MAT-THEORY-01 | `next` | Build a source-to-manuscript section ledger covering specification, precursor reservoirs, assembly history, soft/hard success, hierarchy levels, lower-chain closure, audit statuses, claims boundary, and final concise theory. | `docs/Technology/programs/materia/theory/tables/materialization_section_ledger.tex` |
| MAT-THEORY-02 | `planned` | Build a theorem provenance table mapping manuscript theorems to exact source material and current Lean declarations across the main and source-backed Materialization layers. | `docs/Technology/programs/materia/theory/tables/materialization_theorem_provenance_table.tex` |
| MAT-THEORY-03 | `planned` | Write the notation and status section fixing the hierarchy vocabulary, precursor/resource language, success predicates, calibration witnesses, audit statuses, and claims-boundary labels. | `docs/Technology/programs/materia/theory/latex/chapters/` |
| MAT-THEORY-04 | `planned` | Write the core theory section for specification, observer equivalence, precursor reservoirs, no-ex-nihilo constraints, assembly channels, and success predicates. | `docs/Technology/programs/materia/theory/latex/chapters/` |
| MAT-THEORY-05 | `planned` | Write the hierarchy and lower-chain section for H0 admissibility, lower-chain witnesses, persistence criteria, crystalline order, reservoir sufficiency, compatibility, and effective functional closure. | `docs/Technology/programs/materia/theory/latex/chapters/` |
| MAT-THEORY-06 | `planned` | Write the audit section for closure ladder, audited statement, claims boundary, final concise theory, and explicit non-claims. | `docs/Technology/programs/materia/theory/latex/chapters/` |
| MAT-THEORY-07 | `planned` | Write formula-text proofs for the theorem set selected across the core, hierarchy, lower-chain, and audit sections so that every stated theorem has a prose proof. | `docs/Technology/programs/materia/theory/latex/chapters/` |
| MAT-THEORY-08 | `planned` | Integrate the section files and provenance tables into `materialization_theory_main.tex` and compile cleanly. | `docs/Technology/programs/materia/theory/latex/materialization_theory_main.tex` |

## Acceptance criteria

1. The theory manuscript is source-faithful and Lean-aligned.
2. Every theorem in the manuscript has a prose proof.
3. Later-level materialization claims remain bounded by the current audit and claims-boundary layer.
4. The document clearly separates formalized structure, engineering aspiration, and non-claims.
