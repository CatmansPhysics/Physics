# FTL Route Threshold Package

## Scope

This file freezes the first-release thresholds, ambiguity bands, and repetition rules for the FTL soft, hard, and integrated I0 hardware line.

## Soft-route thresholds

| Quantity | Symbol | Frozen value | Meaning |
| --- | --- | --- | --- |
| Pairwise contrast threshold | C_bc* | 0.30 | Minimum readable label separation |
| Classicalization error bound | epsilon_cl* | 0.10 | Maximum admissible classicalization error |
| Memory persistence threshold | m_pers* | 0.85 | Minimum persistence score over the hold window |
| Readback success threshold | r_read* | 0.90 | Minimum successful readback fraction |
| Hierarchy consistency threshold | kappa_hier* | 0.80 | Minimum coarse-to-fine consistency |

## Hard-route thresholds

| Quantity | Symbol | Frozen value | Meaning |
| --- | --- | --- | --- |
| Carrier-gap threshold | Delta_gap* | 0.20 | Minimum carrier-window separation |
| Carrier-margin threshold | M_car* | 0.15 | Minimum positive carrier margin |
| Hold threshold | t_hold* | 20 s | Minimum admitted baseline hold interval |
| Pole-survival threshold | P_pole* | 0.90 | Minimum pole or resonance survival |
| Identity-fidelity threshold | F_id* | 0.95 | Minimum return identity fidelity |
| Binding threshold | B_T* | 0.10 | Minimum positive binding margin for the composite bench |
| Cycle-drift bound | delta_cyc* | 0.08 | Maximum admissible hard-route drift |

## Integrated thresholds

| Quantity | Symbol | Frozen value | Meaning |
| --- | --- | --- | --- |
| Export readability threshold | r_export* | 0.90 | Minimum soft-record readability at handoff |
| Timing-compatibility threshold | eta_time* | 0.85 | Minimum admissible soft-hard timing compatibility |
| Integrated drift bound | delta_i0* | 0.08 | Maximum admissible integrated drift |

## Ambiguity bands

| Quantity family | Ambiguity band |
| --- | --- |
| Soft observables | +/- 0.05 around threshold |
| Hard observables | +/- 0.04 around threshold |
| Integrated observables | +/- 0.05 around threshold |

Any quantity inside an ambiguity band blocks release-grade interpretation until the condition is repeated after recalibration.

## Repetition rule

- repetitions per condition: 3
- no loss of readable labels across soft repetitions
- no loss of admissible carrier window across hard repetitions
- no loss of handoff readability across integrated repetitions

If any consistency rule fails, the condition is downgraded to unresolved and returned to recalibration.

## Dependency note

This threshold package is the hardware counterpart of the frozen computational closeouts. It must not be reinterpreted as theorem evidence for the soft or hard route theorems.

Revision date: 2026-04-16.