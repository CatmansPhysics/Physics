# FTL Program

Canonical clean workspace for the faster-than-light transport technology program.

## Scope

- theory manuscript for soft and hard FTL routes;
- computational manuscript for the staged numerical campaign;
- normalized simulator and mission-stack source tree;
- hardware-facing protocol notes for soft arrays and hard benches;
- Lean formalization package in PhysicsLean.

## Legacy source roots

- `docs/Technology/FTL_v1.md`
- `docs/Technology/FTL_Dev_v1.md`
- `docs/Technology/FTL_Dev_Roadmap_v1.md`
- `docs/Technology/FTL/`

## Canonical destinations inside this folder

- `theory/latex/`: FTL theory paper in strict scientific English.
- `computational/latex/`: FTL numerical and protocol paper.
- `software/`: normalized source, configs, tests, reports, and release manifests.
- `hardware/`: drawings, protocols, calibration sheets, and BOM.
- `archive/`: references to frozen legacy packages that are not yet normalized.

## Current entrypoints

- theory manuscript: `theory/latex/ftl_theory_main.tex`
- theory PDF: `theory/latex/ftl_theory_main.pdf`
- computational manuscript: `computational/latex/ftl_computational_main.tex`
- computational PDF: `computational/latex/ftl_computational_main.pdf`
- laboratory companion: `hardware/latex/ftl_laboratory_companion.tex`
- laboratory PDF: `hardware/latex/ftl_laboratory_companion.pdf`

## Cross-layer reading order

1. Start from `theory/latex/ftl_theory_main.tex` for the soft-route, hard-route, and integrated route vocabulary.
2. Move to `computational/latex/ftl_computational_main.tex` for the staged numerical closeouts and prototype bridge.
3. Move to `hardware/latex/ftl_laboratory_companion.tex` for the prototype-facing soft, hard, and I0 laboratory layer.

## Hardware release bundle

- soft protocol: `hardware/protocols/ftl_soft_array_protocol.md`
- hard protocol: `hardware/protocols/ftl_hard_bench_protocol.md`
- integrated readiness protocol: `hardware/protocols/ftl_i0_readiness_protocol.md`
- run sheet: `hardware/protocols/ftl_route_run_sheet_template.md`
- baseline BOM: `hardware/bom/ftl_i0_baseline_bom.md`
- threshold package: `hardware/calibration/ftl_route_threshold_package.md`
- anchor library: `hardware/calibration/ftl_route_anchor_library.md`
- geometry note: `hardware/drawings/ftl_soft_hard_geometry_spec.md`

## Layer dependencies

The FTL program should be read and maintained in the order theory -> computational -> hardware. The hardware bundle is downstream of the theory and computational manuscripts and must not be treated as standalone evidence for unrestricted transport claims.