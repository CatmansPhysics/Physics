# AGT P3 Anchor Library

## Scope

This document defines the initial anchor families used to stabilize AGT P3 verdict interpretation across strip, bubble, and mixed-medium runs.

## Positive anchors

| Anchor ID | Family | Expected signature |
| --- | --- | --- |
| AGT-ANC-P1 | Clean strip witness | W_sgn above threshold with stable branch sign |
| AGT-ANC-P2 | Stable branch-compatible run | W_sgn and Delta_branch above threshold across all repetitions |
| AGT-ANC-P3 | Mixed-medium distinction run | Delta_med clearly above threshold under blinded comparison |

## Negative anchors

| Anchor ID | Family | Expected signature |
| --- | --- | --- |
| AGT-ANC-N1 | Null-medium run | Detector response consistent with background |
| AGT-ANC-N2 | Mis-tuned strip run | Non-null trace without stable branch assignment |
| AGT-ANC-N3 | Washed-out bubble run | C_cap and tau_trap both below admissible region |
| AGT-ANC-N4 | Control-indistinguishable run | Candidate and control remain operationally indistinguishable |

## Borderline anchors

| Anchor ID | Family | Expected signature |
| --- | --- | --- |
| AGT-ANC-B1 | Near-threshold signed response | W_sgn inside the ambiguity band |
| AGT-ANC-B2 | Near-threshold branch separation | Delta_branch inside the ambiguity band |
| AGT-ANC-B3 | Near-threshold mixed-medium distinction | Delta_med inside the ambiguity band |

## Usage rule

The anchor library does not replace run repetition. Its role is to prevent drift in detector normalization and verdict interpretation between successive recalibration passes.

## Release gate

The calibration sheet may be revised only when the anchor library is re-measured and attached to the revision record.

Revision date: 2026-04-16.