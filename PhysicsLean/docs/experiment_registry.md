# Experiment Registry

This file tracks Python experiments associated with the Lean packages.

## Registered experiments

- `smoke.project_layout` -> Phase 0 workspace sanity check
- `core.rewrite_toy_model` -> toy rewriting and semantic-preservation checks for Chapters 1-2
- `core.efu_examples` -> toy EFU-style run-length decomposition for Chapter 2
- `core.resolvent_toy` -> finite 2x2 resolvent example for Chapter 3
- `observer.causal_histories` -> toy causal histories for Chapter 4
- `observer.projection_compare` -> two-observer comparison for Chapters 4-5
- `dynamics.action_toy_models` -> toy structural action and coarse energy/momentum shadows for Chapters 6-7
- `quantum.history_amplitudes` -> toy history amplitudes for Chapter 8
- `quantum.decoherence_records` -> toy record/decoherence filter for Chapter 9
- `thermo.partition_resolvent_demo` -> finite partition-resolvent toy for Chapter 11
- `thermo.entropy_tracking` -> entropy-shadow toy for Chapters 10-11
- `continuum.transport_toy` -> continuity/diffusion toy for Chapter 12
- `continuum.hydrodynamic_limit` -> coarse hydrodynamic toy for Chapter 12
- `qft.pole_residue_demo` -> pole/residue toy for Chapters 13-14
- `qft.scattering_channels` -> scattering-channel toy for Chapter 14
- `many_body.phase_toy_model` -> phase classification toy for Chapter 16
- `chemistry.reaction_graphs` -> reaction-network toy for Chapter 17
- `biology.self_replication_toy` -> self-replication/adaptation toy for Chapter 18
- `cognition.agent_projection` -> internal-model update toy for Chapter 19
- `language.symbolic_coordination` -> symbolic coordination toy for Chapter 19
- `standard_model.residue_branch_scan` -> residue-branch toy for Chapter 21
- `standard_model.anomaly_checks` -> anomaly toy checks for Chapter 25
- `standard_model.flavour_blocks` -> flavour-mixing toy for Chapter 23
- `standard_model.color_singlets` -> color singlet toy for Chapter 24
- `standard_model.dictionary_translation` -> low-energy dictionary toy for Chapter 26
- `audit.checkpoint_runner` -> qualitative checkpoint runner for Chapter 27
- `audit.report_builder` -> audit report builder for Chapter 27
- `pipeline.*` -> staged computational schema runner for backlog phases 8-9
- `reporting.coverage_export` -> markdown export helper for coverage reporting

## Planned additions

- observer projection comparisons
- toy quantum/decoherence calculations
- toy transport and pole-residue pipelines
- toy residue-to-dictionary pipeline