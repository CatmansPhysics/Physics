# FTL Soft Array Protocol

## Scope

This protocol defines the first physical soft-array campaign downstream of the soft S1-M1 numerical closeout. It freezes the finite-array and hierarchical-array readout families used to certify prototype-level readable labels, memory persistence, and coarse-to-fine consistency.

## Objective

- validate a binary or small-alphabet persistent witness array on a memory-first medium;
- measure pairwise contrast, classicalization error, failed-cell fraction, and record persistence under one frozen schedule;
- generate the export package later consumed by the I0 readiness protocol.

## Fixed baseline package

- array family: finite detector-memory array with one frozen alphabet size per condition;
- coupling window: predeclared detector-medium coupling interval;
- classicalization window: fixed post-coupling interval before readback;
- memory policy: explicit write, hold, and selective readback schedule;
- repetition rule: three identical runs per condition before release-grade interpretation.

## Frozen thresholds

- pairwise contrast threshold: C_bc >= 0.30 for every intended readable label pair;
- classicalization error threshold: epsilon_cl <= 0.10;
- memory persistence threshold: m_pers >= 0.85 over the declared hold window;
- readback success threshold: r_read >= 0.90;
- hierarchy consistency threshold: kappa_hier >= 0.80 when hierarchical mode is active.

## Canonical protocol sections

1. Medium preparation and reset baseline.
2. Array initialization and addressing map freeze.
3. Coupling, classicalization, write, hold, and readback schedule.
4. Finite-array repetition package.
5. Hierarchical export package when multiscale mode is active.
6. Export record for later hard-route initialization.

## Minimum data products

- cycle log;
- pairwise contrast table;
- classicalization and persistence summary;
- failed-cell registry;
- hierarchy consistency sheet when applicable;
- export record for the I0 readiness layer.

## Verdict rules

### Soft contrast failure

Recorded when one or more intended readable label pairs violate the frozen contrast threshold.

### Readable but unstable record

Recorded when contrast passes but memory persistence, readback success, or reset stability fails.

### Finite-array success

Recorded when C_bc, epsilon_cl, m_pers, and r_read all pass across the repetition package.

### Hierarchical success

Recorded only when the finite-array package passes and kappa_hier also passes across the frozen scale ladder.

## File crosswalk

- shared BOM: `hardware/bom/ftl_i0_baseline_bom.md`
- threshold package: `hardware/calibration/ftl_route_threshold_package.md`
- anchor library: `hardware/calibration/ftl_route_anchor_library.md`
- geometry note: `hardware/drawings/ftl_soft_hard_geometry_spec.md`
- run-sheet template: `hardware/protocols/ftl_route_run_sheet_template.md`

## Numerical anchor

- canonical source subtree: `docs/Technology/programs/ftl/software/src/ftl_live/soft_s1_m1_array_closeout/`

## Non-claim boundary

This protocol does not certify unrestricted remote imaging, arbitrary-resolution scanning, or a completed soft-hard mission stack.

Revision date: 2026-04-16.