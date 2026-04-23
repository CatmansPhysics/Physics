# Technology Document Backlogs

This directory contains the writing backlogs for the canonical applied-technology document set.

Each technology has two separate backlogs:

- one theory-writing backlog;
- one implementation-writing backlog.

The split is intentional.

- Theory documents must reconstruct the theory exactly from the source manuscripts and the current Lean formalization.
- Implementation documents must describe only the realized implementation surface that is already covered by normalized software assets, computational experiment registries, report contracts, and protocol preparation for later physical experiments.

## Canonical backlog set

### AGT

- Theory: `agt_theory_writing_backlog.md`
- Implementation: `agt_implementation_writing_backlog.md`

### FTL

- Theory: `ftl_theory_writing_backlog.md`
- Implementation: `ftl_implementation_writing_backlog.md`

### Materialization

- Theory: `materialization_theory_writing_backlog.md`
- Implementation: `materialization_implementation_writing_backlog.md`

## Shared writing constraints

Every backlog in this directory assumes the following.

1. The final prose must stay source-faithful to the original technology manuscripts in `docs/Technology/`.
2. The final theorem statements must stay aligned with the current source-backed Lean layer in `PhysicsLean/PhysicsLean/Technology/`.
3. Every theorem written into a document must include a standard formula-text proof in ordinary mathematical prose, not only a Lean reference.
4. Every implementation document must include:
   - implementation approach and architecture;
   - computational experiments already covered by the canonical software and report layer;
   - a results section tied to actual normalized experiment/report artifacts;
   - forward physical-experiment protocols only at the level already prepared in `hardware/` and `computational/protocols/`.
5. No backlog item may silently extend beyond the current evidence base.
6. No manuscript may remain monolithic: each canonical LaTeX document must be assembled from logically separate chapter files under its local `latex/chapters/` directory.

## Canonical inputs

- Source inventory: `docs/Technology/registry/source_inventory.md`
- Program backlog: `docs/Technology/registry/technology_program_backlog.md`
- Lean source backlogs: `docs/Technology/registry/lean_source_backlogs/`
- Lean packages: `PhysicsLean/PhysicsLean/Technology/AGT/`, `FTL/`, `Materialization/`
- Experiment registries: `PhysicsLean/experiments/src/physics_experiments/technology/`

## Completion rule

A document-writing backlog is complete only when:

1. the section map matches the source corpus;
2. theorem provenance is mapped source -> Lean -> manuscript;
3. quantitative or experimental claims are backed by canonical software/report artifacts;
4. future physical experiments are described as protocols and preparation routes, not as already completed evidence;
5. the target manuscript compiles cleanly in its canonical LaTeX location.
6. the main manuscript file remains only an entrypoint that assembles separate chapter files.
