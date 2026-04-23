import PhysicsLean.Technology.Materialization.Source.«155_SeededHardMaterializationV1»
import PhysicsLean.Technology.Materialization.Source.«022_CrystallineReservoirs»
import PhysicsLean.Technology.Materialization.Source.«030_MonatomicTargets»

namespace PhysicsLean
namespace Technology.Materialization.Source

structure ReservoirSufficiency where
  reservoir : CrystallineReservoir
  target : MonatomicTarget
  availableCapacity : Rat
  targetDeficit : Rat
  lossMargin : Rat
  deriving Repr

def reservoirSufficiencyCriterion (criterion : ReservoirSufficiency) : Prop :=
  crystallineReservoirReady criterion.reservoir ∧
    monatomicTargetAdmissible criterion.target ∧
    0 <= criterion.availableCapacity ∧
    0 <= criterion.targetDeficit ∧
      0 <= criterion.lossMargin ∧ criterion.targetDeficit + criterion.lossMargin <= criterion.availableCapacity

def reservoirCapacityCoversTarget (criterion : ReservoirSufficiency) : Prop :=
  criterion.targetDeficit <= criterion.availableCapacity

theorem reservoirReadyOfSufficiency
    (criterion : ReservoirSufficiency)
    (h : reservoirSufficiencyCriterion criterion) :
    crystallineReservoirReady criterion.reservoir := by
  exact h.1

end Technology.Materialization.Source
end PhysicsLean
