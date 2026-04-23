import PhysicsLean.Technology.FTL.HardCarrier
import PhysicsLean.Technology.FTL.Source.«021_SuperluminalStatus»

namespace PhysicsLean
namespace Technology.FTL.Source

inductive ProtocolRegime
  | softReadout
  | hardTransport
  deriving DecidableEq, Repr

structure RegimeSummary where
  regime : ProtocolRegime
  ontology : String
  primaryLayer : String
  successCondition : String
  deriving Repr

def protocolSplit : List RegimeSummary :=
  [ { regime := ProtocolRegime.softReadout
      ontology := "Observer-level access to a remote coarse state through a non-factorizable composite sector"
      primaryLayer := "reduced states and detector readout"
      successCondition := "Local readout probabilities depend on the remote coarse variable without ordinary observer-space propagation" }
  , { regime := ProtocolRegime.hardTransport
      ontology := "Transport of a stable object sector through a superluminal carrier branch"
      primaryLayer := "poles, residues, and transport branches"
      successCondition := "A stable object branch exits and re-enters the luminal sector while preserving identity" } ]

def softBeforeHard : List ProtocolRegime :=
  [ProtocolRegime.softReadout, ProtocolRegime.hardTransport]

theorem protocolSplit_length : protocolSplit.length = 2 := by
  rfl

theorem softBeforeHard_length : softBeforeHard.length = 2 := by
  rfl

end Technology.FTL.Source
end PhysicsLean
