# Integration / Control Dossier v1

## Selected default policy
- adaptive mission default: **fatigue_aware**

## Stage-4 closeout evidence
- policy passes all scenarios: True
- average mission success rate = 0.974609
- average readiness = 0.991045
- worst route misclassification rate = 0.031250

## Integration rule
- soft array selects route/window
- hard bench executes composite transport
- adaptive controller manages fatigue and readiness

## Go / No-go
GO if one default policy clears all thresholds across all selected mission scenarios.
