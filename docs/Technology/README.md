# Technology Programs

This directory now has two layers:

- Legacy source material remains in the existing top-level draft files and archive folders.
- Canonical clean outputs live under `programs/` and are the only targets for new polished documents and normalized software assets.

## Canonical layout

- `registry/`: source inventory, program registry, and execution backlog.
- `programs/<program>/theory/`: clean LaTeX theory manuscript, figures, and tables.
- `programs/<program>/computational/`: clean LaTeX computational manuscript, numerical figures/tables, and experimental protocols.
- `programs/<program>/software/`: normalized source code, tests, configs, reports, and frozen releases.
- `programs/<program>/hardware/`: drawings, calibration sheets, bill of materials, and physical test protocols.
- `programs/<program>/archive/`: references to legacy documents and frozen package drops that are not yet normalized.

## Program set covered now

- `agt`: antigravity technology program.
- `ftl`: faster-than-light transport technology program.
- `materia`: materialization technology program.

## Canonical package expected for each program

Each technology program is expected to converge to one package with four synchronized deliverables:

1. A strict scientific English theory manuscript in LaTeX.
2. A strict scientific English computational manuscript in LaTeX, including the bridge to physical-device protocols.
3. A reproducible computational package with source, tests, configs, and frozen reports.
4. A Lean formalization package under `PhysicsLean/PhysicsLean/Technology/` plus linked Python experiments under `PhysicsLean/experiments/src/physics_experiments/technology/`.

## Migration rule

No legacy file is moved automatically by this reorganization step. Legacy material remains the source corpus; clean outputs are written only into the canonical program folders.