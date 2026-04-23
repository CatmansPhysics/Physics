# FTL Route Anchor Library

## Scope

This document defines the initial anchor families used to stabilize FTL soft, hard, and integrated verdict interpretation across recalibration passes.

## Positive anchors

| Anchor ID | Family | Expected signature |
| --- | --- | --- |
| FTL-ANC-P1 | Stable finite-array run | C_bc, epsilon_cl, m_pers, and r_read all pass |
| FTL-ANC-P2 | Stable hard one-pole cycle | Delta_gap, M_car, P_pole, and F_id all pass |
| FTL-ANC-P3 | Stable I0 handoff | export readability and timing compatibility both pass |

## Negative anchors

| Anchor ID | Family | Expected signature |
| --- | --- | --- |
| FTL-ANC-N1 | Soft contrast collapse | one or more intended label pairs become unreadable |
| FTL-ANC-N2 | Memory-loss run | persistence collapses before the hold window ends |
| FTL-ANC-N3 | Carrier-window collapse | hard route loses the positive carrier window |
| FTL-ANC-N4 | Identity-loss run | hard return fails identity verification |
| FTL-ANC-N5 | I0 timing failure | integrated handoff misses the admissible hard window |

## Borderline anchors

| Anchor ID | Family | Expected signature |
| --- | --- | --- |
| FTL-ANC-B1 | Near-threshold soft record | one or more soft observables inside ambiguity band |
| FTL-ANC-B2 | Near-threshold hard cycle | one or more hard observables inside ambiguity band |
| FTL-ANC-B3 | Near-threshold integrated handoff | integrated observables inside ambiguity band |

## Usage rule

The anchor library does not replace run repetition. Its purpose is to prevent threshold drift and keep route-level verdict interpretation stable across recalibration passes.

## Release gate

The threshold package may be revised only when the anchor library is re-measured and attached to the revision record.

Revision date: 2026-04-16.