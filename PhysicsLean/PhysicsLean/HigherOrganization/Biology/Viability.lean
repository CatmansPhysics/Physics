import PhysicsLean.HigherOrganization.Chemistry.MaterialClass

namespace PhysicsLean

def Viable (energyBudget repairCapacity : Rat) : Prop :=
  energyBudget >= 0 ∧ repairCapacity >= 0

end PhysicsLean
