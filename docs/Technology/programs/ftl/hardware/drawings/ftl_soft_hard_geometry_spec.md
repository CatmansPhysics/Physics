# FTL Soft and Hard Geometry Specification

## Scope

This note records the frozen first-release geometry assumptions for the FTL soft-array, hard carrier-cycle, and integrated I0 bench families.

## Soft-array geometry

- one frozen detector-memory array topology per condition;
- cell addressing map and detector positions recorded explicitly;
- any change in array size or addressing map creates a new condition;
- hierarchical runs preserve a declared coarse-to-fine embedding map.

## Hard carrier geometry

- one frozen carrier-medium geometry revision per condition;
- entry, hold, exit, and verification ports retain the same relative placement across the repetition package;
- bound-sector runs must preserve the same constituent and composite verification geometry across repetitions.

## Integrated handoff geometry

- the soft export path and hard initialization path must share one declared clock reference;
- any change in handoff topology, cabling, or timing reference creates a new I0 condition.

## Coordinate convention

- origin: geometric center of the array or carrier bench under the active revision;
- x-axis: nominal control-flow or addressing direction;
- y-axis: transverse in-plane direction;
- z-axis: detector or interface height when present.

## Operator note

This file is a geometry freeze, not a CAD package. Later drawing sets must preserve these denominators unless the threshold package and route protocols are revised in the same release.

Revision date: 2026-04-16.