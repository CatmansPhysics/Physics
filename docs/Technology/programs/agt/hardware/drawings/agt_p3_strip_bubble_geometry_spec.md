# AGT P3 Strip and Bubble Geometry Specification

## Scope

This note records the frozen first-release geometry assumptions for the AGT P3 strip, bubble, and mixed-medium bench families.

## Strip geometry

- one active strip and one matched control strip;
- equal strip length and width within one geometry revision;
- detector positions fixed relative to strip centerline;
- excitation port position fixed before the first run of a condition.

## Bubble or cavity geometry

- one frozen cavity or shell cell per geometry revision;
- interface thickness and detector radius logged explicitly;
- dwell-time measurement starts at the frozen end-of-drive timestamp.

## Mixed-medium comparison geometry

- candidate and control media must occupy the same macro-geometry class;
- detector positions, shielding, and drive wiring remain unchanged between the two runs;
- any geometry change creates a new condition and blocks direct comparison with the earlier record.

## Coordinate convention

- origin: geometric center of the active strip or cavity;
- x-axis: nominal excitation direction;
- y-axis: transverse in-plane direction;
- z-axis: detector height or out-of-plane direction when present.

## Operator note

This file is a geometry freeze, not a CAD drawing. Any later drawing package must preserve these denominators unless the calibration sheet and campaign protocol are revised in the same release.

Revision date: 2026-04-16.