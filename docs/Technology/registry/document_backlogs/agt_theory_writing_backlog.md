# AGT Theory Writing Backlog

## Purpose

Write the canonical AGT theory document in strict scientific English so that it is simultaneously faithful to:

- `docs/Technology/Antigrav_v1.md`
- `docs/Technology/Antigrav_Dev_v1.md`
- `docs/Technology/AGT/`
- `PhysicsLean/PhysicsLean/Technology/AGT/`

Target output:

- `docs/Technology/programs/agt/theory/latex/agt_theory_main.tex`

## Status legend

- `done`: finished and reflected in the manuscript.
- `next`: highest-priority executable writing task.
- `planned`: defined but not yet executed.
- `blocked`: waiting on a source-normalization or manuscript dependency.

## Writing rules

1. The document must reconstruct the AGT theory from the original sources, not invent a cleaner but different theory.
2. Every formal theorem included in the manuscript must be matched against the current AGT Lean layer.
3. Every theorem in the manuscript must carry a standard formula-text proof in ordinary mathematical prose.
4. Any claim that is only an engineering target, boundary statement, or open operational objective must be labeled as such.
5. The document must separate proved internal structural claims from engineering interpretation and from physical non-claims.

## Canonical source anchors

- Source inventory: `docs/Technology/registry/source_inventory.md`
- Lean source backlog: `docs/Technology/registry/lean_source_backlogs/agt_lean_source_backlog.md`
- Lean public package: `PhysicsLean/PhysicsLean/Technology/AGT/`
- Canonical theory manuscript root: `docs/Technology/programs/agt/theory/`

## Chapter map

The canonical manuscript must be assembled from separate files under `docs/Technology/programs/agt/theory/latex/chapters/`.

- `00_protocol_and_status.tex`
- `01_imported_foundations_and_boundary.tex`
- `02_grav_residue_calculus.tex`
- `03_signed_channel_and_effective_force.tex`
- `04_spectral_compatibility_targets.tex`
- `05_toy_model_and_scaling_targets.tex`
- `06_composite_screening_and_failure_modes.tex`
- `07_prototype_bridge_and_dependencies.tex`

## Backlog

| ID | Status | Task | Output path |
| --- | --- | --- | --- |
| AGT-THEORY-01 | `next` | Build a source-to-manuscript section ledger covering residue calculus, signed source law, observer-force bridge, repulsive void regime, neutral composite closure, audit boundaries, and non-claims. | `docs/Technology/programs/agt/theory/tables/agt_section_ledger.tex` |
| AGT-THEORY-02 | `planned` | Build a theorem provenance table mapping each manuscript theorem to the exact source location and the corresponding Lean declaration or declaration family. | `docs/Technology/programs/agt/theory/tables/agt_theorem_provenance_table.tex` |
| AGT-THEORY-03 | `planned` | Write the notation and status block so that residue sign, spectral bridge, composite neutrality, observer compatibility, and engineering-boundary labels are fixed before theorem exposition. | `docs/Technology/programs/agt/theory/latex/chapters/` |
| AGT-THEORY-04 | `planned` | Write the structural core section for signed residue observables, residue classes, transfer-stability, and signed source densities in source-faithful order. | `docs/Technology/programs/agt/theory/latex/chapters/` |
| AGT-THEORY-05 | `planned` | Write the interaction section explaining pair-potential regimes, opposite-sign repulsion, observer-level force interpretation, and the exact scope of the AGT force analogy. | `docs/Technology/programs/agt/theory/latex/chapters/` |
| AGT-THEORY-06 | `planned` | Write the composite-sector section for neutral composites, closure criteria, and large-scale repulsive structures, keeping internal results separate from device interpretation. | `docs/Technology/programs/agt/theory/latex/chapters/` |
| AGT-THEORY-07 | `planned` | For every theorem selected into chapters 02-06, write a formula-text proof that mirrors the Lean proof content at the level of ordinary mathematics exposition. | `docs/Technology/programs/agt/theory/latex/chapters/` |
| AGT-THEORY-08 | `planned` | Write the audit boundary section covering what is formalized, what is only source-asserted, what is only engineering-motivated, and what remains a non-claim. | `docs/Technology/programs/agt/theory/latex/chapters/` |
| AGT-THEORY-09 | `planned` | Integrate the section files into `agt_theory_main.tex`, normalize theorem labels and cross-references, and compile the manuscript cleanly. | `docs/Technology/programs/agt/theory/latex/agt_theory_main.tex` |

## Acceptance criteria

1. Every theorem stated in the theory manuscript has a prose proof.
2. Every theorem stated in the manuscript is traceable to AGT source text and the current Lean layer.
3. The manuscript makes the AGT claims boundary explicit instead of burying it in narrative.
4. The resulting document stays within the audited AGT scope already represented in `PhysicsLean/PhysicsLean/Technology/AGT/`.
