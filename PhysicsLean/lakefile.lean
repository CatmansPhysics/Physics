import Lake
open Lake DSL

package "PhysicsLean" where
  moreLeanArgs := #[
    "-DautoImplicit=false"
  ]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.29.0-rc8"

@[default_target]
lean_lib "PhysicsLean" where
  globs := #[.submodules `PhysicsLean]
