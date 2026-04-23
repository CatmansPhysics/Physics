# FTL I0 Baseline BOM

## Scope

This bill of materials defines the minimum hardware package required for the first FTL soft-array, hard carrier-cycle, and integrated I0 readiness campaigns.

## Soft-route items

| Item ID | Item | Minimum specification | Role |
| --- | --- | --- | --- |
| FTL-BOM-01 | Detector-memory array | Frozen finite array with addressable cells | Soft readout platform |
| FTL-BOM-02 | Memory-first medium | Stable medium state with documented reset procedure | Persistent local record |
| FTL-BOM-03 | Soft control chain | Coupling, classicalization, write, hold, and readback control | Soft schedule execution |

## Hard-route items

| Item ID | Item | Minimum specification | Role |
| --- | --- | --- | --- |
| FTL-BOM-04 | Carrier-active medium bench | Frozen medium state with documented disorder baseline | Hard route platform |
| FTL-BOM-05 | Entry/exit control chain | Timestamped entry, hold, exit, and verification control | Hard cycle execution |
| FTL-BOM-06 | Identity verification channel | Repeatable return and identity check package | Hard verdict assignment |

## Shared instrumentation and records

| Item ID | Item | Minimum specification | Role |
| --- | --- | --- | --- |
| FTL-BOM-07 | Timing reference | Shared clock for soft, hard, and integrated runs | Handoff discipline |
| FTL-BOM-08 | Environmental logger | Temperature, vibration, and background logging | Run qualification |
| FTL-BOM-09 | Versioned threshold package | Frozen route thresholds and ambiguity bands | Verdict assignment |
| FTL-BOM-10 | Run sheet template | Versioned markdown or tabular record | Condition freeze |
| FTL-BOM-11 | Geometry sheet | Array and carrier geometry revision record | Reproducibility |
| FTL-BOM-12 | Archive path | Stable storage for raw and derived records | Provenance |

## Acceptance gate

The FTL I0 BOM is release-ready only when items FTL-BOM-01 through FTL-BOM-12 are present or replaced by an approved equivalent with the same operational role.

## Out of scope

This BOM excludes autonomous navigation systems, mission-scale shielding, full material embedding hardware, or any claim-ready faster-than-light vehicle architecture.

Revision date: 2026-04-16.