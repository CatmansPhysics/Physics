# AGT P3 Calibration Sheet

## Scope

This file freezes the first-release AGT P3 detector normalization, channel-isolation, ambiguity, and verdict thresholds used by the strip, bubble, and mixed-medium bench families.

## Calibration blocks

1. Background and null-medium baseline.
2. Candidate-versus-control channel matching.
3. Detector gain and attenuation normalization.
4. Branch-separation extraction check.
5. Mixed-medium distinction threshold check.

## Frozen thresholds

| Quantity | Symbol | Frozen value | Meaning |
| --- | --- | --- | --- |
| Signed response threshold | W_sgn* | 0.20 | Minimum normalized non-null signed response |
| Branch separation threshold | Delta_branch* | 0.15 | Minimum compatible branch separation |
| Transport threshold | T_rep* | 0.60 | Minimum repulsive-window or transport pass fraction |
| Mixed-medium threshold | Delta_med* | 0.25 | Minimum candidate-control distinction |
| Bubble capture threshold | C_cap* | 0.55 | Minimum capture proxy when tau_trap does not certify the run |
| Trapped dwell threshold | tau_trap* | 30 s | Minimum trapped-state dwell time for capture certification |

## Ambiguity bands

| Quantity | Ambiguity band |
| --- | --- |
| W_sgn | +/- 0.05 around W_sgn* |
| Delta_branch | +/- 0.03 around Delta_branch* |
| T_rep | +/- 0.05 around T_rep* |
| Delta_med | +/- 0.05 around Delta_med* |
| C_cap | +/- 0.05 around C_cap* |

Any run inside an ambiguity band is not eligible for release-grade interpretation until the condition is repeated after recalibration.

## Required fields

- date and bench identifier;
- geometry revision;
- hardware topology version;
- candidate medium lot and control medium lot;
- drive family identifier;
- detector gain and attenuation values;
- measured background noise;
- accepted operating window;
- rollback reference.

## Repetition and consistency rule

- repetitions per condition: 3
- no sign flip across repetitions
- no branch reassignment across repetitions
- maximum allowed spread in W_sgn: 0.06
- maximum allowed spread in Delta_med: 0.07

If any consistency rule fails, the condition is downgraded to unresolved and returned to the calibration queue.

## Verdict mapping

- null response: W_sgn below threshold after normalization
- sign-only witness: W_sgn passes but Delta_branch or transport layer fails
- branch-compatible witness: W_sgn and Delta_branch pass while later layers remain unresolved
- transport-supported local regime: W_tr passes but Delta_med fails
- mixed-medium distinction success: all frozen thresholds pass across the repetition package

## Linked protocol

- `docs/Technology/programs/agt/hardware/protocols/agt_p3_campaign_protocol.md`

Revision date: 2026-04-16.

Owner path: `docs/Technology/programs/agt/hardware/calibration/`.