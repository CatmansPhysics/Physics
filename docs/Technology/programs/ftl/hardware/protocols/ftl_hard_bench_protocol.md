# FTL Hard Carrier Bench Protocol

## Scope

This protocol defines the first physical hard-bench campaign downstream of the H1-M2 numerical closeout. It freezes the one-pole and bound-sector carrier-cycle families used to certify carrier-window stability, pole survival, identity fidelity, and bounded cycle drift.

## Objective

- validate one-pole and then composite carrier-cycle readiness on a carrier-active medium;
- measure carrier margin, hold interval, return fidelity, binding margin, and cycle repeatability;
- map hard-route numerical closeout thresholds into physical go/no-go checks.

## Fixed baseline package

- route family: one-pole carrier cycle with optional bound-sector extension;
- control phases: entry, hold, exit, and verification frozen before the run;
- carrier medium: one declared medium state per condition;
- verification policy: one predeclared identity and return check package;
- repetition rule: three identical runs per condition before release-grade interpretation.

## Frozen thresholds

- carrier-gap threshold: Delta_gap >= 0.20;
- carrier-margin threshold: M_car >= 0.15;
- hold threshold: t_hold >= 20 s for the declared baseline cycle;
- pole-survival threshold: P_pole >= 0.90;
- identity-fidelity threshold: F_id >= 0.95;
- composite binding threshold: B_T >= 0.10 when the bound-sector bench is active;
- cycle-drift bound: delta_cyc <= 0.08 across the repetition package.

## Canonical protocol sections

1. Carrier-medium preparation and disorder baseline.
2. Entry and exit interface setup.
3. One-pole verification cycle.
4. Composite hold and refresh cycle when the bound-sector bench is active.
5. Disorder or topology stress campaign after baseline success.
6. Return-to-baseline and incident handling rules.

## Minimum data products

- per-cycle carrier-window record;
- pole-survival and identity-fidelity log;
- binding-margin summary when applicable;
- cycle-drift ledger;
- pass/fail matrix across disorder settings.

## Verdict rules

### Carrier-window failure

Recorded when Delta_gap or M_car fails before a validated hold interval is achieved.

### Unstable hard cycle

Recorded when the carrier window exists but pole survival, identity fidelity, or cycle drift fails across repetitions.

### One-pole success

Recorded when Delta_gap, M_car, t_hold, P_pole, F_id, and delta_cyc all pass across the repetition package.

### Bound-sector success

Recorded only when the one-pole package passes and B_T remains positive and stable across the composite repetition package.

## File crosswalk

- shared BOM: `hardware/bom/ftl_i0_baseline_bom.md`
- threshold package: `hardware/calibration/ftl_route_threshold_package.md`
- anchor library: `hardware/calibration/ftl_route_anchor_library.md`
- geometry note: `hardware/drawings/ftl_soft_hard_geometry_spec.md`
- run-sheet template: `hardware/protocols/ftl_route_run_sheet_template.md`

## Numerical anchor

- canonical source subtree: `docs/Technology/programs/ftl/software/src/ftl_live/hard_h1_m2_bench_closeout/`

## Non-claim boundary

This protocol does not certify unrestricted faster-than-light transport, completed material embedding, or mission-ready hardware.

Revision date: 2026-04-16.