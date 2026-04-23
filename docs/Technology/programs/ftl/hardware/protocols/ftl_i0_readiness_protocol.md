# FTL I0 Readiness Protocol

## Scope

This protocol defines the first integrated soft-to-hard readiness record for the FTL hardware line. It consumes one validated soft export and one admissible hard initialization schedule and determines whether both can coexist in a single stable I0 record.

## Objective

- verify that a validated soft export remains readable through the declared handoff interval;
- choose a hard initialization window using only the frozen soft export fields;
- certify timing compatibility without claiming a completed mission architecture.

## Integrated baseline package

- one soft export record from the finite or hierarchical soft protocol;
- one hard initialization schedule from the carrier-cycle protocol;
- one frozen handoff interval and clock reference;
- one repetition package of three identical integrated trials.

## Frozen thresholds

- exported-record readability at handoff: r_export >= 0.90;
- timing-compatibility threshold: eta_time >= 0.85;
- hard-initialization admissibility threshold: all hard prerequisites remain satisfied at handoff;
- integrated drift bound: delta_i0 <= 0.08 across the repetition package.

## Canonical execution sequence

1. Freeze the soft export record and hard initialization rule before the first integrated trial.
2. Verify that the soft record remains readable at the handoff time.
3. Initialize the hard cycle using only the frozen export fields.
4. Record timing offsets, admissibility flags, and any loss of record integrity.
5. Repeat the same integrated condition three times before assigning the verdict.

## Verdict rules

- unreadable export: soft record fails before handoff;
- timing incompatibility: hard initialization window cannot be reached from the frozen export schedule;
- I0 readiness success: export readability, timing compatibility, and hard admissibility all pass across the repetition package.

## File crosswalk

- shared BOM: `hardware/bom/ftl_i0_baseline_bom.md`
- threshold package: `hardware/calibration/ftl_route_threshold_package.md`
- run-sheet template: `hardware/protocols/ftl_route_run_sheet_template.md`

## Non-claim boundary

This protocol certifies only I0-level readiness. It does not certify end-to-end mission closure or unrestricted soft-hard interoperability.

Revision date: 2026-04-16.