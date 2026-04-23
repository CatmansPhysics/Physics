# SymSeq Port Manifest

This document records what may be copied from `SymSeq/` into `PhysicsLean/`.

## Allowed startup port scope

- `SymSeq/SymSeq/Foundations/*`
- `SymSeq/SymSeq/SEq/*`
- `SymSeq/SymSeq/SeqSEq/*`
- `SymSeq/SymSeq/Models/ZSym/*`
- `SymSeq/SymSeq/HPattern/*`
- `SymSeq/SymSeq/EFU/*`
- `SymSeq/SymSeq/Series/*`
- `SymSeq/SymSeq/Transfer/*`

## Explicitly excluded startup scope

- `SymSeq/SymSeq/Analytic/*`
- `SymSeq/SymSeq/Arithmetic/PrimeTransfer/*`
- `SymSeq/SymSeq/Models/ZSymPrime/*`
- `SymSeq/SymSeq/Mathlib/*`
- `SymSeq/SymSeq/Examples/RiemannObject.lean`
- `SymSeq/SymSeq/Examples/GoldbachSector.lean`

## Port policy

- Files are copied into the `PhysicsLean` namespace.
- Imports must be rewritten to point to `PhysicsLean.*`.
- Each copied module must be listed in the Phase 1 execution log in the master
  backlog.
- No new dependency on the RH branch may be introduced indirectly.