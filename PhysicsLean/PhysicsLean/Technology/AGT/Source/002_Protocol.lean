import PhysicsLean.Technology.AGT.Source.«003_StatusLabels»

namespace PhysicsLean
namespace Technology.AGT.Source

structure ProtocolStatement where
  code : String
  label : AGTStatementLabel
  description : String
  deriving Repr

structure ProtocolChapter where
  number : Nat
  title : String
  dependencies : List AGTImportedLayer
  statements : List ProtocolStatement
  deriving Repr

def chapter0 : ProtocolChapter :=
  { number := 0
    title := "Introduction and logical protocol"
    dependencies := baseImportedLayers
    statements :=
      [ { code := "AG0-Def"
          label := AGTStatementLabel.definitionAxiom
          description := "Project scope is separated from the book while reusing the shared structural core." }
      , { code := "AG0-Hyp"
          label := AGTStatementLabel.definitionAxiom
          description := "The grav-residue sector is introduced as a structural observable with observer-level image." }
      , { code := "AG0-Target"
          label := AGTStatementLabel.targetTheorem
          description := "A repulsive scaling window should emerge from the same gravity-like channel." }
      , { code := "AG0-Fail"
          label := AGTStatementLabel.failureMode
          description := "The project fails if grav-residue is not transfer-stable or disappears under admissible observer change." } ] }

def chapter1 : ProtocolChapter :=
  { number := 1
    title := "Grav-residue calculus and neutral composite sectors"
    dependencies :=
      [AGTImportedLayer.transfer,
        AGTImportedLayer.spectralControl,
        AGTImportedLayer.observer,
        AGTImportedLayer.geometricProjection,
        AGTImportedLayer.effectiveForce]
    statements :=
      [ { code := "AG1"
          label := AGTStatementLabel.definitionAxiom
          description := "Define the grav-residue set, observable, signed source, potential, and probe energy." }
      , { code := "AG13"
          label := AGTStatementLabel.derivedProposition
          description := "Like-sign pairs attract while opposite-sign pairs repel in the first scaling law." }
      , { code := "AGT1"
          label := AGTStatementLabel.targetTheorem
          description := "Like-sign attraction, opposite-sign repulsion, and neutral composite screening coexist in one observer-level regime." }
      , { code := "AGF1-4"
          label := AGTStatementLabel.failureMode
          description := "Chapter-level failure modes track transfer instability, composite failure, dipole leakage, and spectral mismatch." } ] }

def initialProtocol : List ProtocolChapter := [chapter0, chapter1]

theorem initialProtocol_length : initialProtocol.length = 2 := by
  rfl

theorem chapter1_depends_on_observer : AGTImportedLayer.observer ∈ chapter1.dependencies := by
  simp [chapter1]

end Technology.AGT.Source
end PhysicsLean
