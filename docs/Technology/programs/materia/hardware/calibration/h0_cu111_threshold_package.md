# H0 Cu/Cu(111) Threshold Package

## Scope

This file freezes the order, completion, defect, ambiguity, and repetition rules for the H0 Cu/Cu(111) laboratory line.

## Frozen thresholds

| Quantity | Symbol | Frozen value | Meaning |
| --- | --- | --- | --- |
| Order threshold | q_lab* | 0.65 | Minimum acceptable normalized Cu(111) diffraction order score |
| Completion threshold | v_lab* | 0.95 | Minimum acceptable fill fraction of the 4 mm x 4 mm target window |
| Defect threshold | epsilon_lab | 0.10 | Maximum acceptable weighted defect proxy |
| Hold interval | tau_hold* | 30 min | Required neutral-hold duration for hard success |

## Observable definitions

- q_lab = (I_spec - I_bg) / (I_ref - I_bg)
- v_lab = A_filled / A_target
- d_lab = phi_void + 2 phi_rough + 3 phi_off + 4 phi_cont

## Ambiguity bands

| Quantity | Ambiguity band |
| --- | --- |
| q_lab | +/- 0.03 around q_lab* |
| v_lab | +/- 0.02 around v_lab* |
| d_lab | +/- 0.02 around epsilon_lab |

Any run whose measured value falls inside an ambiguity band is not eligible for release-grade verdict assignment until repeated calibration resolves the boundary.

## Repetition rule

- repetitions per condition: 3
- maximum allowed between-run spread in q_lab: 0.05
- maximum allowed between-run spread in v_lab: 0.03
- maximum allowed between-run spread in d_lab: 0.03

If any spread exceeds its bound, the condition is downgraded to unresolved and must return to recalibration.

## Hold-stage rule

Hard success requires all three runs of the condition to satisfy the thresholds at shutter closure, 10 min, 20 min, and 30 min into the neutral hold, with no post-growth microscopy evidence of threshold-breaking off-target spill or contamination.

## Control anchors

| Condition | Dose ratio | Growth band | Hold band |
| --- | --- | --- | --- |
| Baseline | 1.1 | 300 +/- 20 C | 200 +/- 20 C |
| Low reservoir | 0.9 | 300 +/- 20 C | 200 +/- 20 C |
| High reservoir | 1.5 | 300 +/- 20 C | 200 +/- 20 C |
| Strict control | 1.1 | 300 +/- 10 C | 200 +/- 20 C |
| Relaxed control | 1.1 | 300 +/- 30 C | 200 +/- 20 C |

## Verdict mapping

- fail before growth: no admissible seed-supported front or precursor sufficiency before ordered growth
- growth fail: thresholds never jointly satisfied under active control
- glass capture: disordered or polycrystalline trapped state distinct from target single-domain patch
- soft success: thresholds pass during active control but fail during hold
- hard success: thresholds pass during active control and through the full hold

## Dependency note

This threshold package is the laboratory counterpart of the P0 computational release package and must not be reinterpreted as theorem evidence for the core manuscript.

Revision date: 2026-04-16.