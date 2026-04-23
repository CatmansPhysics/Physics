# AGT P3 Resonance and Mixed-Medium Campaign Protocol

## Scope

This protocol defines the first release-grade AGT hardware campaign downstream of the P3 emulator and computational witness layers. It freezes the strip-resonance, bubble-capture, and mixed-medium distinction families used to test proof-of-regime AGT signatures on a laboratory bench.

## Campaign objective

- verify a reproducible non-null signed response on a frozen strip or interface bench;
- attach that response to a stable compatible branch rather than an instrumentation artifact;
- separate AGT candidate media from matched attractive controls under the same geometry and drive schedule.

## Fixed baseline package

- release family: P3 bench package with strip, bubble, and mixed-medium runs;
- candidate medium class: frozen AGT analog medium with recorded composition and fabrication lot;
- control medium class: matched attractive or null-response medium with the same macro-geometry;
- strip geometry: one active strip and one matched control strip with fixed detector spacing;
- bubble geometry: one cavity or shell cell with fixed interface thickness and detector positions;
- drive policy: predeclared sweep over one frozen excitation family per condition;
- repetition rule: three identical runs per condition before any release-grade verdict.

## Frozen verdict thresholds

- signed response threshold: |W_sgn| >= 0.20 after detector normalization;
- branch compatibility threshold: Delta_branch >= 0.15 together with a stable sign flag across all three repetitions;
- transport discrimination threshold: T_rep >= 0.60 with no repetition below 0.50;
- mixed-medium distinction threshold: Delta_med >= 0.25 between candidate and matched attractive control;
- bubble capture threshold: either C_cap >= 0.55 or tau_trap >= 30 s under the frozen dwell rule.

## Required instruments

- programmable excitation chain with timestamped amplitude and frequency logging;
- synchronized detector chain for strip and interface response capture;
- geometry fixture for strip spacing, cavity radius, and detector locations;
- environmental isolation and logging for temperature, vibration, and background noise;
- archived analysis notebook or script package that computes W_sgn, W_spec, W_tr, and Delta_med from raw traces.

## Canonical execution sequence

1. Freeze the medium lot, geometry sheet, detector state, and calibration-sheet revision before any run begins.
2. Verify matched candidate and control benches under the same detector gain and background subtraction rule.
3. Execute the strip-resonance family for the declared excitation window.
4. Execute the bubble-capture family when the strip family yields a non-null signed response.
5. Execute the mixed-medium distinction family with blinded candidate/control labels.
6. Compute the verdict package from the frozen threshold sheet without changing extraction rules.
7. Archive all traces, derived observables, and incident notes together with the repetition ledger.

## Run classes

### 1. Strip-resonance baseline

- matched candidate and control strips;
- standard excitation sweep;
- full signed-response and branch-compatibility extraction.

### 2. Bubble-capture baseline

- frozen cavity or shell geometry;
- standard dwell schedule;
- capture and trapped-state logging.

### 3. Mixed-medium distinction baseline

- candidate and control media under identical geometry and drive schedule;
- blinded first-pass verdict;
- distinction score Delta_med computed only after label reveal.

### 4. Null-medium control

- control medium only;
- same drive and detector state as the baseline;
- used to estimate residual false-positive response.

### 5. Relaxed-noise challenge

- same geometry as the baseline;
- environmental noise band widened to the maximum admitted for the first release;
- used only after baseline success has been established.

## Measurement cadence

### During each sweep or dwell interval

- raw detector stream: continuous;
- drive-state log: continuous;
- extracted response estimate: every declared sweep step or 1 s dwell interval;
- incident flags: event-driven and mandatory.

### Post-run package

- derived observable sheet immediately after the run;
- matched-control comparison after each candidate/control pair;
- final repetition ledger after the third run of the condition.

## Derived observables

- W_sgn = S_plus - S_minus;
- W_spec = (omega_star, Delta_branch, sigma_sgn);
- W_tr = (T_rep, R_int, C_cap, tau_trap);
- Delta_med = O_AGT - O_attr.

## Verdict rules

### Null response

Recorded when the candidate medium is operationally indistinguishable from the control or from background noise under the frozen extraction rule.

### Sign-only witness

Recorded when W_sgn is non-null but branch compatibility or transport discrimination is unresolved.

### Branch-compatible witness

Recorded when the signed response is stable and branch-compatible, but the transport or mixed-medium layer remains unresolved.

### Transport-supported local regime

Recorded when the strip or bubble family produces stable local transport or capture evidence, but the mixed-medium distinction layer is not yet release-grade.

### Mixed-medium distinction success

Recorded only when W_sgn, W_spec, W_tr, and Delta_med all pass their frozen thresholds across the full three-run repetition package.

## Repetition rule

No public release-grade claim is accepted from one run. Every condition must be repeated three times with identical geometry, detector state, drive family, and calibration-sheet revision. Any sign flip, branch reassignment, or failed control comparison downgrades the condition to unresolved.

## Required archival products

- geometry sheet;
- medium composition and fabrication record;
- full run sheet;
- raw trace bundle;
- derived observable sheet;
- matched-control comparison sheet;
- final verdict record.

## File crosswalk

- BOM: `hardware/bom/agt_p3_baseline_bom.md`
- calibration sheet: `hardware/calibration/agt_p3_calibration_sheet.md`
- anchor library: `hardware/calibration/agt_p3_anchor_library.md`
- geometry note: `hardware/drawings/agt_p3_strip_bubble_geometry_spec.md`
- run-sheet template: `hardware/protocols/agt_p3_run_sheet_template.md`

## Non-claim boundary

This protocol defines the first disciplined AGT bench bridge. It does not certify theorem closure, observer-independent grav charge reconstruction, or a macroscopic engineering antigravity platform.

## Release status

Status: active baseline protocol for the first P3 strip, bubble, and mixed-medium proof-of-regime campaign.

Revision date: 2026-04-16.

Owner path: `docs/Technology/programs/agt/hardware/`.