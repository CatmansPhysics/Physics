# Lean Source-Aligned Formalization Backlogs

These backlog files replace generic package-level planning with source-aligned coverage plans.

Each backlog:

- names one source theory markdown file;
- gives its exact line count;
- partitions the file into contiguous inclusive ranges with no gaps;
- maps every covered range to concrete Lean files that should exist after formalization;
- distinguishes theorem files from audit, roadmap, toy-model, and computational-schema files.

Backlogs:

- `agt_lean_source_backlog.md`
- `ftl_lean_source_backlog.md`
- `materialization_lean_source_backlog.md`

Coverage rule used in all three files:

- line ranges are inclusive;
- every next range starts exactly one line after the previous one ends;
- duplicate section titles in the source files are still covered as separate source ranges;
- non-theorem prose is not discarded, but formalized as provenance, status, schema, audit, or hypothesis-bundle Lean files.