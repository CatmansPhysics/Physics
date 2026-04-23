# H0 Cu/Cu(111) Anchor Library

## Scope

This document defines the initial physical anchor families used to calibrate the H0 Cu/Cu(111) threshold package.

## Positive anchors

| Anchor ID | Family | Expected signature |
| --- | --- | --- |
| ANC-P1 | Clean filled Cu(111) patch | q_lab clearly above threshold, v_lab near full window, d_lab low |
| ANC-P2 | Stable held Cu(111) patch | Same as ANC-P1 plus persistence through full hold |

## Negative anchors

| Anchor ID | Family | Expected signature |
| --- | --- | --- |
| ANC-N1 | Underfilled patch | v_lab below threshold while order remains possibly acceptable |
| ANC-N2 | Rough or island-rich patch | d_lab above threshold due to roughness or off-target spill |
| ANC-N3 | No-seed spontaneous growth control | uncontrolled nucleation or no admissible ordered target |
| ANC-N4 | Relaxed-control disordered patch | glass-like or polycrystalline capture |

## Borderline anchors

| Anchor ID | Family | Expected signature |
| --- | --- | --- |
| ANC-B1 | Nearly complete patch | v_lab near ambiguity band |
| ANC-B2 | Nearly ordered patch | q_lab near ambiguity band |
| ANC-B3 | Nearly acceptable defect state | d_lab near ambiguity band |

## Usage rule

The anchor library is not a substitute for run repetition. Its purpose is to prevent threshold drift and to stabilize the interpretation of q_lab, v_lab, and d_lab across successive recalibration passes.

## Release gate

The threshold package may be revised only when the anchor library is re-measured and the updated values are attached to the revision record.

Revision date: 2026-04-16.