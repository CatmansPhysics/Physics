# PhysicsLean Experiment Results

Date: 2026-04-10

## Scope

This report records the current toy-experiment and validation results for the
`PhysicsLean/experiments` workspace.

These results are computational and illustrative. They do not replace the Lean
proof layer.

## Environment

- Workspace: `PhysicsLean/experiments`
- Python interpreter: `/home/catman/CatmansCode/Physics/.venv/bin/python`
- Report basis: direct rerun of the current pytest suite, audit report builder,
  and full toy pipeline

## Validation Summary

### Pytest suite

Command:

```bash
cd /home/catman/CatmansCode/Physics/PhysicsLean/experiments && \
PYTHONPATH=src /home/catman/CatmansCode/Physics/.venv/bin/python -m pytest -q
```

Result:

```text
17 passed in 0.03s
```

Covered test modules:

- `test_smoke.py`
- `test_core_examples.py`
- `test_observer_dynamics.py`
- `test_quantum_stat.py`
- `test_continuum_field.py`
- `test_higher_organization.py`
- `test_standard_model.py`
- `test_audit_pipeline.py`
- `test_full_pipeline.py`

## Audit Checkpoints

Source:

- `physics_experiments.audit.report_builder.build_report`

Result:

```json
{
  "checkpoints": {
    "anomaly": true,
    "singlet": true
  },
  "status": "ok"
}
```

Interpretation:

- anomaly checkpoint: passed
- singlet checkpoint: passed
- aggregate audit status: `ok`

## Full Toy Pipeline Output

Source:

- `physics_experiments.pipeline.run_full_pipeline.run_pipeline`

Result:

```json
{
  "branch": {
    "admissible": true,
    "charges": [
      1.0,
      -1.0
    ]
  },
  "dictionary": {
    "fields": [
      "mass_proxy",
      "singlet"
    ],
    "observables": {
      "mass_proxy": 2,
      "singlet": true
    },
    "terms": [
      "L[mass_proxy]",
      "L[singlet]"
    ]
  },
  "flavour_color": {
    "flavour_classes": 2,
    "singlet": true
  },
  "poles": {
    "count": 2,
    "poles": [
      1.0,
      -1.0
    ]
  },
  "structure": {
    "size": 2,
    "symbols": [
      "S",
      "P"
    ]
  }
}
```

Interpretation:

- structural initialization produced a 2-symbol toy system `['S', 'P']`
- pole-residue extraction produced 2 poles: `1.0` and `-1.0`
- internal observable extraction preserved a charge pair summing to zero
- electroweak/anomaly filter marked the branch as admissible
- flavour/color construction produced `2` flavour classes and a singlet outcome
- observer-level dictionary produced effective fields `mass_proxy` and `singlet`
- effective toy lagrangian terms are `L[mass_proxy]` and `L[singlet]`

## Coverage Notes

The current audit coverage snapshot in `PhysicsLean/docs/audit_coverage_matrix.md`
states:

- structural core: internal
- observer dictionary: internal to effective
- confinement: open target

This is consistent with the current experiment layer: the report shows working
toy computations and successful qualitative checkpoints, but it does not claim
closure of open targets such as confinement.

## Limitations

- All reported values come from toy models and placeholder experiment scaffolds.
- The pipeline demonstrates staged data flow, not calibrated phenomenology.
- A passing pytest suite confirms internal consistency of the current Python
  layer, not physical completeness of the theory.
- Open targets in the Lean/audit layer remain open even when the toy pipeline
  succeeds.

## Current Conclusion

The `PhysicsLean` experiment workspace is currently operational.

- the full Python suite passes;
- the audit checkpoint report returns `ok`;
- the toy end-to-end computational schema completes successfully;
- the outputs remain explicitly limited to the current staged skeleton.