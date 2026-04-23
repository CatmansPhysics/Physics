# P0 Summary Report

## Calibration
- q_star = 0.6328
- calibration states = 14
- best good F_cryst = 0.0000
- worst good F_cryst = 5.6326
- best bad F_cryst = 5.1500
- worst bad F_cryst = 56.7281

## Capacity sweep (seed S0)
- verdicts = {'HARD_SUCCESS': 5, 'FAIL_RESERVOIR': 3}

## Compatibility sweep (S0 + S2)
- verdicts = {'FAIL_GROWTH': 76, 'HARD_SUCCESS': 4, 'GLASS_CAPTURE': 4}
- mean Q = 0.1560
- mean d = 0.3028

## Metastability sweep
- barriers = [2.3722, 2.3722, 2.3722, 2.3722, 2.3722, 2.3722]
- escape probabilities = [0.9528, 0.6065, 0.2479, 0.0833, 0.0081, 0.0001]

## Verdict atlas
- verdict counts = {'FAIL_RESERVOIR': 36, 'FAIL_GROWTH': 36, 'SOFT_SUCCESS': 16, 'GLASS_CAPTURE': 12, 'HARD_SUCCESS': 8}

## Interpretation
The computational prototype differentiates between reservoir failure, growth failure, glass-like capture,
soft completion, and hard completion using the calibrated lower theorem chain.
