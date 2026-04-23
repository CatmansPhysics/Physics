import PhysicsLean.Technology.Materialization.Source.«062_UsefulInformation»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure WasteDecomposition where
  materialWaste : Rat
  defectWaste : Rat
  controlWaste : Rat
  deriving Repr

def totalIrrecoverableWaste (waste : WasteDecomposition) : Rat :=
  waste.materialWaste + waste.defectWaste + waste.controlWaste

def wasteEfficiency (value : Rat) (waste : WasteDecomposition) : Rat :=
  value / (totalIrrecoverableWaste waste + 1)

end Technology.Materialization.Source
end PhysicsLean
