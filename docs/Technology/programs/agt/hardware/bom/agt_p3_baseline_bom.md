# AGT P3 Baseline BOM

## Scope

This bill of materials defines the minimum hardware package required for the first AGT P3 strip, bubble, and mixed-medium proof-of-regime campaign.

## Material and fixture items

| Item ID | Item | Minimum specification | Role |
| --- | --- | --- | --- |
| AGT-BOM-01 | Candidate medium cartridge | Frozen AGT analog medium with fabrication lot tracking | Active bench medium |
| AGT-BOM-02 | Matched control cartridge | Attractive or null-response control medium with matched macro-geometry | Control comparison |
| AGT-BOM-03 | Strip fixture | Reproducible active and control strip mount with fixed spacing | Strip-resonance geometry |
| AGT-BOM-04 | Bubble or cavity cell | Reproducible shell or interface cell with documented dimensions | Capture and screening geometry |
| AGT-BOM-05 | Isolation stage | Vibration-damped and electrically grounded platform | Noise suppression |

## Instrumentation items

| Item ID | Instrument | Minimum specification | Role |
| --- | --- | --- | --- |
| AGT-BOM-06 | Programmable excitation chain | Timestamped amplitude and frequency control | Frozen drive schedule |
| AGT-BOM-07 | Detector chain | Multi-channel synchronized response capture | Raw trace acquisition |
| AGT-BOM-08 | Environmental logger | Temperature, vibration, and background-noise logging | Run qualification |
| AGT-BOM-09 | Timing controller | Run-phase timestamps and dwell control | Repetition discipline |
| AGT-BOM-10 | Analysis notebook or script package | Versioned extraction of W_sgn, W_spec, W_tr, and Delta_med | Derived observables |

## Record items

| Item ID | Record item | Minimum specification | Role |
| --- | --- | --- | --- |
| AGT-BOM-11 | Run sheet template | Versioned markdown or tabular record | Condition freeze |
| AGT-BOM-12 | Calibration sheet | Frozen detector and threshold package | Verdict assignment |
| AGT-BOM-13 | Geometry sheet | Recorded strip, cavity, and detector geometry revision | Reproducibility |
| AGT-BOM-14 | Trace archive path | Stable storage for raw and derived traces | Provenance |

## Acceptance gate

The AGT P3 BOM is release-ready only when items AGT-BOM-01 through AGT-BOM-14 are present or replaced by an approved equivalent with the same operational role.

## Out of scope

This BOM excludes any macroscopic levitation rig, free-flight platform, cosmological measurement system, or autonomous control stack beyond the first proof-of-regime bench family.

Revision date: 2026-04-16.