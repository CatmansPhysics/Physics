import PhysicsLean.Technology.Materialization.Source.«101_DeviceSubsystems»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure InputChannel where
  inputLabels : List String
  interface : InterfaceSubsystem
  deriving Repr

structure InternalTransferChannel where
  sourceLabels : List String
  output : OutputSector
  deriving Repr

def inputChannelAdmissible (channel : InputChannel) : Prop :=
  0 < channel.inputLabels.length ∧ interfaceSubsystemAdmissible channel.interface

def internalTransferChannelAdmissible (channel : InternalTransferChannel) : Prop :=
  0 < channel.sourceLabels.length ∧ outputSectorAdmissible channel.output

def outputReadoutPredicate (output : OutputSector) : Prop :=
  outputSectorAdmissible output

def functionallyAdmissibleThroughInterfaces
    (input : InputChannel)
    (transfer : InternalTransferChannel) : Prop :=
  inputChannelAdmissible input ∧ internalTransferChannelAdmissible transfer

end Technology.Materialization.Source
end PhysicsLean
