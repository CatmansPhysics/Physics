import PhysicsLean.Technology.FTL.Source.«052_HardRecipe»

namespace PhysicsLean
namespace Technology.FTL.Source

structure ToyWorkedExample where
  code : String
  regime : ProtocolRegime
  purpose : String
  deriving Repr

def toyWorkedExamples : List ToyWorkedExample :=
  [ { code := "Soft-0", regime := ProtocolRegime.softReadout, purpose := "Minimal binary remote witness example." }
  , { code := "Hard-0", regime := ProtocolRegime.hardTransport, purpose := "Minimal branch-transfer transport example." } ]

theorem toyWorkedExamples_length : toyWorkedExamples.length = 2 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
