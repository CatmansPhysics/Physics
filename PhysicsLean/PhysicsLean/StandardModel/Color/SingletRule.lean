import PhysicsLean.StandardModel.Color.Charges

namespace PhysicsLean

def isSinglet (charges : List ColorCharge) : Prop :=
  (charges.map ColorCharge.value).sum = 0

end PhysicsLean
