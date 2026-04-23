import PhysicsLean.Technology.FTL.Source.«095_ScannerReadoutDynamics»

namespace PhysicsLean
namespace Technology.FTL.Source

structure SoftOperationalProtocol where
  dynamics : ScannerReadoutDynamics
  readoutTime : Rat
  memoryLabelPrefix : String
  deriving Repr

def operationalSoftProtocolSuccess (protocol : SoftOperationalProtocol) : Prop :=
  readoutVisible protocol.dynamics ∧ memoryPersistent protocol.dynamics

def selectiveReadoutLabel (protocol : SoftOperationalProtocol) (remoteLabel : String) : String :=
  protocol.memoryLabelPrefix ++ remoteLabel

end Technology.FTL.Source
end PhysicsLean
