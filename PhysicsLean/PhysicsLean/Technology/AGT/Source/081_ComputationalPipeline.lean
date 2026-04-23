import PhysicsLean.Technology.AGT.Source.«080_ObservationalProgram»

namespace PhysicsLean
namespace Technology.AGT.Source

structure PipelineStep where
  level : VerificationLevel
  input : String
  operation : String
  output : String
  status : String
  mainFailureMode : String
  deriving Repr

def agtComputationalPipeline : List PipelineStep :=
  [ { level := VerificationLevel.microscopic
      input := "Structural data, rewrite rules, orientation rule, shell-load rule"
      operation := "Construct microscopic grav-charge q_g"
      output := "Microscopic grav-labelled state space"
      status := "Internal"
      mainFailureMode := "grav-charge collapses to zero or is not rewrite-stable" }
  , { level := VerificationLevel.kernel
      input := "Admissible events and grav increments"
      operation := "Construct grav-marked kernel K_g"
      output := "Grav-marked transfer kernel"
      status := "Internal"
      mainFailureMode := "no coherent kernel closure" }
  , { level := VerificationLevel.spectral
      input := "K_g"
      operation := "Extract dominant branch and marked moments"
      output := "Stable grav sectors and low-energy branches"
      status := "Internal to asymptotic low-energy"
      mainFailureMode := "no stable branch or wrong sign compatibility" }
  , { level := VerificationLevel.coarseField
      input := "Ensemble of microscopic or sectoral states"
      operation := "Reconstruct rho_g, P_g, nu_0, phi_g"
      output := "Observer-level antigravity field regime"
      status := "Internal to effective"
      mainFailureMode := "no stable coarse window" }
  , { level := VerificationLevel.transport
      input := "Test bodies and coarse backgrounds"
      operation := "Compute transport classes and interface responses"
      output := "Observer-level transport signatures"
      status := "Effective"
      mainFailureMode := "all signatures wash out" }
  , { level := VerificationLevel.largeScale
      input := "Mixed-medium and interface statistics"
      operation := "Coarse-grain voids, walls, and bubble populations"
      output := "Large-scale AGT signatures"
      status := "Quantitative target"
      mainFailureMode := "large-scale behavior is indistinguishable from ordinary attraction" } ]

theorem agtComputationalPipeline_length : agtComputationalPipeline.length = 6 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
