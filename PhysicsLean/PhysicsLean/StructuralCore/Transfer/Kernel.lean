import PhysicsLean.StructuralCore.Series.AssemblySeries

/-!
# Transfer Kernels

This file defines the stateful kernel machines acting on assembly words. A
transfer kernel has a state space, a step rule, and a weight extracted from the
final state.

## Role in the project

This is the basic computational object underlying the prime-transfer formalism.
-/

namespace PhysicsLean

structure TransferKernel (X : SeqSEqObject) (E : HPatternExtractor X) (ι : Type _)
    [AddMonoid ι] where
  State : Type
  initial : State
  step : State → HPatternQuotient E → State
  weight : State → ι

namespace TransferKernel

variable {X : SeqSEqObject} {E : HPatternExtractor X} {ι : Type _}
variable [AddMonoid ι]

def run (K : PhysicsLean.TransferKernel X E ι) (state : K.State) (word : AssemblyWord E) : K.State :=
  word.foldl K.step state

def transferWeight (K : PhysicsLean.TransferKernel X E ι) (word : AssemblyWord E) : ι :=
  K.weight (K.run K.initial word)

def transferSupport (K : PhysicsLean.TransferKernel X E ι) (words : List (AssemblyWord E)) : List ι :=
  words.map K.transferWeight

@[simp] theorem run_nil (K : PhysicsLean.TransferKernel X E ι) (state : K.State) :
    K.run state [] = state := rfl

@[simp] theorem run_cons (K : PhysicsLean.TransferKernel X E ι) (state : K.State)
    (head : HPatternQuotient E) (tail : AssemblyWord E) :
    K.run state (head :: tail) = K.run (K.step state head) tail := rfl

@[simp] theorem transferWeight_nil (K : PhysicsLean.TransferKernel X E ι) :
    K.transferWeight [] = K.weight K.initial := rfl

end TransferKernel

end PhysicsLean
