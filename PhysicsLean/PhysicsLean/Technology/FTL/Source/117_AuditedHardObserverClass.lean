import PhysicsLean.Technology.FTL.Source.«116_HardPhysicalAdmissibility»
import PhysicsLean.Technology.FTL.Source.«104_PoleSurvival»

namespace PhysicsLean
namespace Technology.FTL.Source

structure AuditedHardObserverClass where
  branchSelectionFixed : Prop
  poleIsolation : Prop
  residueNondegeneracy : Prop
  observerCompatibility : Prop

def memberOfAuditedHardObserverClass (cls : AuditedHardObserverClass) : Prop :=
  cls.branchSelectionFixed ∧
    cls.poleIsolation ∧
    cls.residueNondegeneracy ∧
    cls.observerCompatibility

def explicitHardObserverClass : AuditedHardObserverClass :=
  { branchSelectionFixed := True
    poleIsolation := selectedPoleSurvives defaultExplicitHardCarrierFamily
    residueNondegeneracy := projectedPoleResidueNonzero defaultExplicitHardCarrierFamily
    observerCompatibility := hardPhysicallyAdmissible defaultHardPhysicalAdmissibilityData }

end Technology.FTL.Source
end PhysicsLean
