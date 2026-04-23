import PhysicsLean.Technology.Materialization.Precursor

namespace PhysicsLean

universe u

structure AssemblyHistory (alpha : Type u) where
  steps : List alpha

namespace AssemblyHistory

def empty {alpha : Type u} : AssemblyHistory alpha :=
  { steps := [] }

def singleton {alpha : Type u} (step : alpha) : AssemblyHistory alpha :=
  { steps := [step] }

theorem steps_empty {alpha : Type u} :
    (empty : AssemblyHistory alpha).steps = [] := by
  rfl

theorem steps_singleton {alpha : Type u} (step : alpha) :
    (singleton step).steps = [step] := by
  rfl

end AssemblyHistory

structure ControlledAssemblyChannel (alpha : Type u) where
  reaches : AssemblyHistory alpha -> alpha -> Prop

namespace ControlledAssemblyChannel

def Reaches {alpha : Type u}
    (channel : ControlledAssemblyChannel alpha)
    (history : AssemblyHistory alpha)
    (target : alpha) : Prop :=
  channel.reaches history target

theorem reaches_iff {alpha : Type u}
    (channel : ControlledAssemblyChannel alpha)
    (history : AssemblyHistory alpha)
    (target : alpha) :
    channel.Reaches history target <-> channel.reaches history target := by
  rfl

end ControlledAssemblyChannel

def TargetReachingChannel {alpha : Type u}
    (channel : ControlledAssemblyChannel alpha)
    (history : AssemblyHistory alpha)
    (target : alpha) : Prop :=
  channel.reaches history target

theorem targetReachingChannel_iff {alpha : Type u}
    (channel : ControlledAssemblyChannel alpha)
    (history : AssemblyHistory alpha)
    (target : alpha) :
    TargetReachingChannel channel history target <-> channel.reaches history target := by
  rfl

theorem targetReachingChannel_of_reaches {alpha : Type u}
    (channel : ControlledAssemblyChannel alpha)
    (history : AssemblyHistory alpha)
    (target : alpha)
    (hReaches : channel.reaches history target) :
    TargetReachingChannel channel history target := by
  exact hReaches

end PhysicsLean
