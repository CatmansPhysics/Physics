import PhysicsLean.Technology.FTL.Source.«130_FinalAudit»

namespace PhysicsLean
namespace Technology.FTL.Source

inductive PreEngineeringBlock
  | softCalibration
  | hardCalibration
  | controlClosure
  | resourceClosure
  | materialEmbedding
  | repeatability
  deriving DecidableEq, Repr

structure PreEngineeringBlockDescriptor where
  block : PreEngineeringBlock
  code : String
  description : String
  deriving Repr

def preEngineeringBlocks : List PreEngineeringBlockDescriptor :=
  [ { block := PreEngineeringBlock.softCalibration
      code := "E-C1"
      description := "Quantitative calibration theorem for soft FTL." }
  , { block := PreEngineeringBlock.hardCalibration
      code := "E-C2"
      description := "Quantitative calibration theorem for hard FTL." }
  , { block := PreEngineeringBlock.controlClosure
      code := "E-C3"
      description := "Control-theoretic closure for soft and hard FTL." }
  , { block := PreEngineeringBlock.resourceClosure
      code := "E-C4"
      description := "Resource and thermodynamic closure for soft and hard FTL." }
  , { block := PreEngineeringBlock.materialEmbedding
      code := "E-C5"
      description := "Material embedding theorems for soft and hard FTL." }
  , { block := PreEngineeringBlock.repeatability
      code := "E-C6"
      description := "Repeatability and protocol-composition closure." } ]

end Technology.FTL.Source
end PhysicsLean
