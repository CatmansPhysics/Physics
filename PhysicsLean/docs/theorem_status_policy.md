# Theorem Status Policy

This project follows the status discipline stated in the book and in the final
audit chapter.

## Lean declaration policy

- `def` for definitions, canonical maps, and concrete constructions.
- `abbrev` for notational compression only.
- `theorem` for closed internal results.
- `axiom` only in clearly isolated imported-background layers.
- `conjecture` for open target theorems and explicit target wrappers.

## Provenance discipline

- Internal results stay separate from imported continuum identifications.
- Effective observer-level translations must say when they are only valid in an
  asymptotic or coarse-grained regime.
- Open targets must never be restated as completed proofs.