import PhysicsLean.Technology.FTL.Source.«121_OpenAdmissibleHardClass»

namespace PhysicsLean
namespace Technology.FTL.Source

structure FTLAuditStatus where
  softClosed : Prop
  hardClosed : Prop
  preEngineeringOpen : Prop

def finalAuditStatus : FTLAuditStatus :=
  { softClosed := True
    hardClosed := hardClosureStatement
    preEngineeringOpen := True }

def theoremClosureReached : Prop :=
  finalAuditStatus.softClosed ∧ finalAuditStatus.hardClosed

end Technology.FTL.Source
end PhysicsLean
