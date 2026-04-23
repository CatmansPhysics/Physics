import Mathlib.CategoryTheory.Category.Basic
import Mathlib.CategoryTheory.Functor.Basic
import Mathlib.Data.Fintype.Basic
import Mathlib.Data.Int.Basic
import Mathlib.Data.List.Basic
import Mathlib.Data.Multiset.Basic
import Mathlib.Analysis.SpecialFunctions.Gamma.Basic
import Mathlib.Topology.Algebra.InfiniteSum.Basic

/-!
# PhysicsLean Foundations Prelude

This file is the shared import hub for the symbolic side of the project.
It fixes the baseline Mathlib dependencies used across `PhysicsLean` and introduces
the project-wide abbreviation `Word` for finite words over an alphabet.

## Main definition

- `Word α`: the basic finite-word container, implemented as `List α`.

## Role in the project

Almost every symbolic module imports this file, so it is the common vocabulary
layer beneath the `SEq`, `SeqSEq`, `HPattern`, `EFU`, and transfer packages.
-/

open CategoryTheory

namespace PhysicsLean

abbrev Word (α : Type _) := List α

end PhysicsLean
