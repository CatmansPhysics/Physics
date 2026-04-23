# H0 Cu/Cu(111) Baseline BOM

## Scope

This bill of materials defines the minimum hardware package required for the H0 Cu/Cu(111) seeded-growth validation line.

## Material and consumable items

| Item ID | Item | Minimum specification | Role |
| --- | --- | --- | --- |
| BOM-01 | Cu(111) witness coupon | 8 mm x 8 mm coupon, single-crystal Cu(111), polish suitable for diffraction and microscopy | Baseline substrate and target window carrier |
| BOM-02 | Copper source charge | 99.999% Cu shot or pellets | Active deposited species |
| BOM-03 | Seed mask | Central 1 mm x 1 mm aperture mask compatible with Cu(111) coupon geometry | Defines admissible seed patch |
| BOM-04 | Coupon holder | Thermally stable holder with reproducible alignment marks | Fixes geometry and alignment |
| BOM-05 | Cleaning solvents and wipes | UHV-compatible cleaning consumables | Pre-run surface preparation |
| BOM-06 | Storage capsule | Clean sealed storage for prepared witness coupons | Prevents contamination between preparation and run |

## Instrumentation items

| Item ID | Instrument | Minimum specification | Role |
| --- | --- | --- | --- |
| BOM-07 | UHV chamber | Base pressure <= 1e-8 mbar | Environmental isolation |
| BOM-08 | Thermal evaporator | Stable copper deposition capability | Precursor delivery |
| BOM-09 | QCM module | Continuous dose logging with archived time series | Reservoir trace |
| BOM-10 | RHEED channel | In situ order readout during growth and hold | Primary q_lab channel |
| BOM-11 | LEED or equivalent confirmatory diffraction | Optional but recommended | Order confirmation after growth |
| BOM-12 | AFM or SEM | Full-window post-growth mosaic capability | Defect and completion audit |
| BOM-13 | Temperature controller | Growth band 300 +/- 10 C to 300 +/- 30 C and hold band 200 +/- 20 C | Control schedule execution |
| BOM-14 | Shutter controller | Timestamped open/close control | Separates active growth and hold intervals |

## Software and record items

| Item ID | Record or software item | Minimum specification | Role |
| --- | --- | --- | --- |
| BOM-15 | Run sheet template | Versioned markdown or tabular record | Freezes condition and outcome |
| BOM-16 | Threshold package | Frozen threshold and ambiguity rules | Verdict assignment |
| BOM-17 | Trace archive path | Stable storage for diffraction, QCM, and microscopy outputs | Provenance |

## Acceptance gate

The BOM is release-ready only when all mandatory items BOM-01 through BOM-17 are present or explicitly replaced by an approved equivalent with the same operational role.

## Out of scope

This BOM excludes higher-layer fabrication tooling, multi-species sources, reactive gas lines, lithographic patterning hardware, and device-integration tooling.

Revision date: 2026-04-16.

*** Add File: /home/catman/CatmansCode/Physics/docs/Technology/programs/materia/hardware/calibration/h0_cu111_threshold_package.md
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

*** Add File: /home/catman/CatmansCode/Physics/docs/Technology/programs/materia/hardware/calibration/h0_cu111_anchor_library.md
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

*** Add File: /home/catman/CatmansCode/Physics/docs/Technology/programs/materia/hardware/drawings/h0_cu111_geometry_spec.md
# H0 Cu/Cu(111) Geometry Specification

## Scope

This note records the frozen geometry assumptions for the first Cu/Cu(111) hardware line.

## Coupon geometry

- witness coupon size: 8 mm x 8 mm
- substrate class: Cu(111)
- target window: central 4 mm x 4 mm square
- admissible seed patch: central 1 mm x 1 mm square

## Coordinate convention

- origin: center of the witness coupon
- x-axis: one coupon edge direction
- y-axis: orthogonal coupon edge direction
- target window: x in [-2 mm, 2 mm], y in [-2 mm, 2 mm]
- seed patch: x in [-0.5 mm, 0.5 mm], y in [-0.5 mm, 0.5 mm]

## Measurement regions

- target fill denominator uses only the central 4 mm x 4 mm window
- off-target spill counts any occupied area outside the target window but on the witness coupon
- contamination audit counts parasitic islands both inside and outside the target window when they are not compatible with the intended single-domain Cu(111) patch

## Operator note

This file is a geometry freeze, not a CAD drawing. If a true drawing package is later produced, it must preserve these denominators unless the laboratory companion and threshold package are revised in the same release.

Revision date: 2026-04-16.

*** Add File: /home/catman/CatmansCode/Physics/docs/Technology/programs/materia/hardware/protocols/h0_cu111_run_sheet_template.md
# H0 Cu/Cu(111) Run Sheet Template

## Header

- run id:
- date:
- operator:
- chamber id:
- coupon id:
- seed preparation id:
- threshold package revision:

## Run class

- baseline / no-seed / low-reservoir / high-reservoir / strict-control / relaxed-control

## Frozen condition block

- base pressure:
- source purity record:
- growth temperature band:
- hold temperature band:
- nominal copper flux:
- integrated dose ratio:
- shutter open timestamp:
- shutter close timestamp:

## Seed and reservoir admissibility

- seed patch present:
- seed alignment pass/fail:
- pre-run diffraction pass/fail:
- parasitic island pre-check pass/fail:
- reservoir sufficiency pass/fail:

## In situ growth trace

| Time | QCM dose trace | q_lab estimate | v_lab estimate | Event flags |
| --- | --- | --- | --- | --- |
| t0 |  |  |  |  |
| t+30 s |  |  |  |  |
| t+60 s |  |  |  |  |
| ... |  |  |  |  |

## Hold trace

| Hold time | q_lab | v_lab | d_lab partial note | Pass/fail |
| --- | --- | --- | --- | --- |
| 0 min |  |  |  |  |
| 10 min |  |  |  |  |
| 20 min |  |  |  |  |
| 30 min |  |  |  |  |

## Post-growth package

- final diffraction frame id:
- microscopy bundle id:
- roughness estimate:
- off-target deposition estimate:
- contamination estimate:
- computed d_lab:

## Verdict block

- q_lab final:
- v_lab final:
- d_lab final:
- verdict class:
- ambiguity triggered: yes/no
- archive path:
- reviewer note:

## Sign-off

- operator signature:
- calibration reviewer:
- release eligible: yes/no