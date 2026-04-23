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