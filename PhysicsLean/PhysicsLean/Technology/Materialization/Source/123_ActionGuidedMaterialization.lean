import PhysicsLean.Technology.Materialization.Source.«122_PolicySelection»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure ActionGuidedMaterializationChannel where
  sensingLabels : List String
  updateLabels : List String
  choiceLabels : List String
  actionLabels : List String
  materializationLabels : List String
  deriving Repr

def actionGuidedMaterializationChannelAdmissible
    (channel : ActionGuidedMaterializationChannel) : Prop :=
  0 < channel.sensingLabels.length ∧
    0 < channel.updateLabels.length ∧
      0 < channel.choiceLabels.length ∧
        0 < channel.actionLabels.length ∧ 0 < channel.materializationLabels.length

def materiallyRelevantAction (actionLabel : String) : Prop :=
  actionLabel != ""

end Technology.Materialization.Source
end PhysicsLean
