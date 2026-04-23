# Materialization Post-P0 Growth and Validation Protocol

## Scope

This protocol defines the first physical validation sequence downstream of the P0 computational prototype for the fixed H0 laboratory package: copper homoepitaxy on Cu(111) witness substrates under ultra-high-vacuum thermal evaporation.

## Objective

- translate the P0 verdict ladder into a disciplined Cu/Cu(111) growth-and-validation workflow;
- distinguish fail-before-growth, growth failure, soft success, glass-like capture, and hard success in a physical campaign;
- freeze the measurements, thresholds, and archival products required for the first release-grade laboratory line.

## Fixed baseline package

- material system: Cu on Cu(111);
- precursor source: 99.999% copper shot in thermal evaporator;
- target window: central 4 mm x 4 mm square inside an 8 mm x 8 mm witness coupon;
- admissible seed: central 1 mm x 1 mm pre-annealed seed patch aligned to substrate axes;
- growth temperature: 300 +/- 20 C nominal;
- hold temperature: 200 +/- 20 C nominal;
- hold duration: 30 min;
- baseline dose ratio: 1.1 relative to geometric fill estimate;
- low-reservoir control: 0.9 dose ratio;
- high-reservoir control: 1.5 dose ratio.

## Frozen acceptance thresholds

- order threshold: q_lab >= 0.65;
- completion threshold: v_lab >= 0.95;
- defect threshold: d_lab <= 0.10;
- hard-success persistence requirement: all thresholds remain satisfied through the full 30 min neutral hold.

## Required instruments

- UHV chamber with base pressure no worse than 1e-8 mbar;
- thermal evaporation source for copper;
- quartz-crystal microbalance for continuous dose logging;
- in situ diffraction channel: RHEED mandatory, LEED acceptable as confirmatory where available;
- post-growth microscopy: AFM or SEM mosaic over the full target window.

## Canonical execution sequence

1. Compile the target package and verify that the matching simulator-side package lies inside the ordered-growth pocket.
2. Verify chamber qualification, base pressure, source provenance, and clean-reference Cu(111) diffraction frame.
3. Prepare and qualify the central seed patch.
4. Freeze the run sheet, threshold package, and control schedule before deposition starts.
5. Execute one of the authorized run classes: baseline, no-seed, low-reservoir, high-reservoir, strict-control, or relaxed-control.
6. Record in situ dose, order, occupancy, and contamination flags during active growth.
7. Close the copper shutter and execute the neutral hold with scheduled persistence measurements.
8. Acquire the full post-growth microscopy and defect package.
9. Assign the verdict class from the frozen threshold package and archive the full trace.

## Run classes

### 1. Baseline seeded growth

- dose ratio: 1.1;
- growth band: 300 +/- 20 C;
- hold band: 200 +/- 20 C for 30 min.

### 2. No-seed control

- same as baseline, but no central seed patch is supplied;
- any ordered patch formation is logged as uncontrolled nucleation.

### 3. Low-reservoir control

- same geometry and thermal schedule as baseline;
- integrated copper dose fixed to 0.9 baseline-equivalent ratio.

### 4. High-reservoir control

- same geometry and thermal schedule as baseline;
- integrated copper dose fixed to 1.5 baseline-equivalent ratio.

### 5. Strict-control run

- growth band narrowed to 300 +/- 10 C;
- flux jitter must remain below 5 percent of nominal QCM rate.

### 6. Relaxed-control run

- growth band widened to 300 +/- 30 C;
- flux jitter may reach 15 percent of nominal QCM rate.

## Measurement cadence

### In situ growth phase

- QCM stream: continuous;
- diffraction order frame: every 30 s;
- occupancy estimate: every 60 s;
- contamination and parasitic-nucleation flags: event-driven and mandatory.

### Post-growth and hold phase

- one diffraction frame immediately at shutter closure;
- one diffraction frame at 10 min hold;
- one diffraction frame at 20 min hold;
- one diffraction frame at 30 min hold;
- one AFM or SEM mosaic after cooldown;
- optional LEED or XRD confirmatory readout where workflow permits.

## Derived observables

- q_lab = (I_spec - I_bg) / (I_ref - I_bg);
- v_lab = A_filled / A_target;
- d_lab = phi_void + 2 phi_rough + 3 phi_off + 4 phi_cont.

## Verdict rules

### Fail before growth

Recorded when no admissible seed-supported front or precursor sufficiency is achieved before ordered growth begins.

### Growth fail

Recorded when deposition proceeds but q_lab, v_lab, and d_lab never jointly cross the active thresholds.

### Glass-like or amorphous capture

Recorded when the run reaches a trapped disordered or polycrystalline state distinct from the intended single-domain Cu(111) patch.

### Soft success

Recorded when the target satisfies the thresholds during active control but violates at least one threshold during the 30 min neutral hold.

### Hard success

Recorded only when q_lab >= 0.65, v_lab >= 0.95, and d_lab <= 0.10 remain satisfied throughout the full hold interval.

## Repetition rule

No release-grade verdict is accepted from a single run. Every condition must be repeated three times. A public verdict claim is blocked when between-run spread exceeds 0.05 in q_lab, 0.03 in d_lab, or 0.03 in v_lab.

## Required archival products

- target specification sheet;
- reservoir and seed inventory;
- full run sheet;
- QCM time series;
- diffraction image stack;
- microscopy bundle;
- threshold evaluation sheet;
- final verdict record.

## File crosswalk

- BOM: `hardware/bom/h0_cu111_baseline_bom.md`
- calibration package: `hardware/calibration/h0_cu111_threshold_package.md`
- anchor library: `hardware/calibration/h0_cu111_anchor_library.md`
- geometry note: `hardware/drawings/h0_cu111_geometry_spec.md`
- run-sheet template: `hardware/protocols/h0_cu111_run_sheet_template.md`

## Numerical anchor

- canonical simulator subtree: `docs/Technology/programs/materia/software/src/p0_prototype/`

## Non-claim boundary

This protocol defines the first laboratory bridge for the H0 regime. It does not certify theorem closure, arbitrary-object fabrication, or transfer beyond the frozen Cu/Cu(111) baseline package.

## Release status

Status: active baseline protocol for the first Cu/Cu(111) proof-of-regime campaign.

Revision date: 2026-04-16.

Owner path: `docs/Technology/programs/materia/hardware/`.

*** Add File: /home/catman/CatmansCode/Physics/docs/Technology/programs/materia/hardware/bom/h0_cu111_baseline_bom.md
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