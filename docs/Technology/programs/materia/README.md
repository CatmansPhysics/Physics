# Materialization Program

Canonical clean workspace for the materialization technology program.

## Scope

- theory manuscript for the standalone materialization program;
- computational manuscript centered on the P0 prototype line;
- normalized software package;
- hardware-facing growth and validation protocols;
- Lean formalization package in PhysicsLean.

## Legacy source roots

- `docs/Technology/Matria_v1.md`
- `docs/Technology/Matria_Dev_v1.md`
- `docs/Technology/Materia/`

## Canonical destinations inside this folder

- `theory/latex/`: materialization theory paper in strict scientific English.
- `computational/latex/`: materialization computational paper and protocol bridge.
- `software/`: normalized source, tests, configs, reports, and release manifests.
- `hardware/`: drawings, protocols, calibration sheets, and BOM.
- `archive/`: references to frozen legacy packages that are not yet normalized.

## Current entrypoints

- theory manuscript: `theory/latex/materialization_theory_main.tex`
- theory PDF: `theory/latex/materialization_theory_main.pdf`
- computational manuscript: `computational/latex/materialization_computational_main.tex`
- computational companion: `computational/latex/materialization_computational_companion.tex`
- computational companion PDF: `computational/latex/materialization_computational_companion.pdf`
- laboratory companion: `hardware/latex/materialization_laboratory_companion.tex`
- laboratory PDF: `hardware/latex/materialization_laboratory_companion.pdf`

## Cross-layer reading order

1. Start from `theory/latex/materialization_theory_main.tex` for the core materialization regime and theorem vocabulary.
2. Move to `computational/latex/materialization_computational_companion.tex` for the P0 computational bridge and release-style prototype logic.
3. Move to `hardware/latex/materialization_laboratory_companion.tex` for the first physical Cu/Cu(111) laboratory line.

## Hardware release bundle

- growth and validation protocol: `hardware/protocols/materialization_post_p0_growth_validation_protocol.md`
- run sheet: `hardware/protocols/h0_cu111_run_sheet_template.md`
- baseline BOM: `hardware/bom/h0_cu111_baseline_bom.md`
- threshold package: `hardware/calibration/h0_cu111_threshold_package.md`
- anchor library: `hardware/calibration/h0_cu111_anchor_library.md`
- geometry note: `hardware/drawings/h0_cu111_geometry_spec.md`

## Layer dependencies

The materialization program should be read and maintained in the order theory -> computational -> hardware. The hardware bundle is downstream of the theory and computational manuscripts and is restricted to the frozen Cu/Cu(111) baseline package rather than arbitrary fabrication claims.