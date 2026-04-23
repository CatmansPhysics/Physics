# AGT Program

Canonical clean workspace for the antigravity technology program.

## Scope

- theory manuscript;
- computational manuscript;
- normalized software package;
- hardware-facing calibration and protocol notes;
- Lean formalization package in PhysicsLean.

## Legacy source roots

- `docs/Technology/Antigrav_v1.md`
- `docs/Technology/Antigrav_Dev_v1.md`
- `docs/Technology/AGT/`

## Canonical destinations inside this folder

- `theory/latex/`: AGT theory paper in strict scientific English.
- `computational/latex/`: AGT numerical paper with bridge to device protocols.
- `software/`: normalized source, tests, configs, reports, and release manifests.
- `hardware/`: drawings, calibration sheets, BOM, and protocol notes.
- `archive/`: references to frozen legacy packages that are not yet normalized.

## Current entrypoints

- theory manuscript: `theory/latex/agt_theory_main.tex`
- theory PDF: `theory/latex/agt_theory_main.pdf`
- computational manuscript: `computational/latex/agt_computational_main.tex`
- computational PDF: `computational/latex/agt_computational_main.pdf`
- laboratory companion: `hardware/latex/agt_laboratory_companion.tex`
- laboratory PDF: `hardware/latex/agt_laboratory_companion.pdf`

## Cross-layer reading order

1. Start from `theory/latex/agt_theory_main.tex` for the theorem and regime vocabulary.
2. Move to `computational/latex/agt_computational_main.tex` for the emulator and numerical bridge to bench observables.
3. Move to `hardware/latex/agt_laboratory_companion.tex` for the laboratory-facing protocol layer.

## Hardware release bundle

- campaign protocol: `hardware/protocols/agt_p3_campaign_protocol.md`
- run sheet: `hardware/protocols/agt_p3_run_sheet_template.md`
- baseline BOM: `hardware/bom/agt_p3_baseline_bom.md`
- calibration sheet: `hardware/calibration/agt_p3_calibration_sheet.md`
- anchor library: `hardware/calibration/agt_p3_anchor_library.md`
- geometry note: `hardware/drawings/agt_p3_strip_bubble_geometry_spec.md`

## Layer dependencies

The AGT program should be read and maintained in the order theory -> computational -> hardware. The hardware bundle is downstream of the theory and computational manuscripts and must not be treated as standalone theorem evidence.