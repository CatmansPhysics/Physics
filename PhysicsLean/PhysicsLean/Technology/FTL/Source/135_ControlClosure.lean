import PhysicsLean.Technology.FTL.Source.«134_HardCalibration»

namespace PhysicsLean
namespace Technology.FTL.Source

structure SoftControlData where
  calibration : SoftCalibrationData
  memoryLifetime : Rat
  writeTime : Rat
  decodeTime : Rat
  deriving Repr

def softControlClosed (data : SoftControlData) : Prop :=
  softlyCalibratable data.calibration ∧
    softReadoutTimeLowerBound data.calibration + data.writeTime + data.decodeTime < data.memoryLifetime

structure HardControlData where
  calibration : HardCalibrationData
  switchingTime : Rat
  deriving Repr

def hardControlClosed (data : HardControlData) : Prop :=
  hardCalibrationRegionNonempty data.calibration ∧
    hardSwitchingTimeLowerBound data.calibration <= data.switchingTime

def unifiedControlClosure (soft : SoftControlData) (hard : HardControlData) : Prop :=
  softControlClosed soft ∧ hardControlClosed hard

def defaultSoftControlData : SoftControlData :=
  { calibration := defaultSoftCalibrationData
    memoryLifetime := 2
    writeTime := 1 / 10
    decodeTime := 1 / 10 }

def defaultHardControlData : HardControlData :=
  { calibration := defaultHardCalibrationData
    switchingTime := 10 }

end Technology.FTL.Source
end PhysicsLean
