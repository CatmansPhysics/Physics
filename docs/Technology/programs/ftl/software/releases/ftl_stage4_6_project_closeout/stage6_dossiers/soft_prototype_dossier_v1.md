# Soft Prototype Dossier v1

## Prototype
S1-M1 array prototype on **glassy_chemical_memory_stack**.

## Architecture
- 16x16 medium-specific array
- shared read/reset bus
- binary metastable witness cells
- array-level export logic

## Required parameter window
- long mean array accuracy >= 0.95
- failed-cell fraction < 0.10
- memory criterion: tau_flip >> tau_read
- glass criterion: tau_relax >> tau_cycle

## Current numerical evidence
- long mean array accuracy = 0.967915
- long min array accuracy = 0.925781
- long max failed-cell fraction = 0.074219
- long worst margin = 0.858050

## Go / No-go
GO if array accuracy remains >= 0.95 and failed-cell fraction < 0.10 over 10^3 cycles.

## Minimal procurement classes
- glassy / chemical-memory medium samples
- local readout electronics
- reset/refresh driver
- persistence measurement instrumentation
