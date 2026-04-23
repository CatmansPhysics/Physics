import PhysicsLean.Technology.AGT.Source.«104_ToyV10SanityWindows»

namespace PhysicsLean
namespace Technology.AGT.Source

structure DataContract where
  name : String
  fields : List String
  deriving Repr

def toyV10DataContracts : List DataContract :=
  [ { name := "GraphData"
      fields := ["adjacency", "degree", "laplacian", "longEdges"] }
  , { name := "SectorKernelData"
      fields := ["q", "eta", "marker", "projectedKernelValue"] }
  , { name := "BranchData"
      fields := ["sector", "eta(q)", "Q_g^spec(q)", "M_in"] }
  , { name := "FieldData"
      fields := ["rho_g", "phi_g", "backgroundCode"] }
  , { name := "TransportRun"
      fields := ["probeCode", "sourceCode", "x(t)", "q(t)", "summaryMetrics"] } ]

structure PipelineContract where
  step : String
  inputs : List String
  outputs : List String
  deriving Repr

def toyV10PipelineContracts : List PipelineContract :=
  [ { step := "Build graph"
      inputs := ["GraphProtocol"]
      outputs := ["GraphData"] }
  , { step := "Build sector kernels"
      inputs := ["ToyParameters", "ParameterPack", "q grid", "marker grid"]
      outputs := ["SectorKernelData"] }
  , { step := "Extract on-shell branches"
      inputs := ["SectorKernelData"]
      outputs := ["BranchData"] }
  , { step := "Solve coarse field"
      inputs := ["GraphData", "SourceConfiguration"]
      outputs := ["FieldData"] }
  , { step := "Run transport experiments"
      inputs := ["BranchData", "FieldData", "ProbeConfiguration"]
      outputs := ["TransportRun"] } ]

structure OutputSchema where
  outputName : String
  requiredMetrics : List String
  deriving Repr

def toyV10OutputSchema : List OutputSchema :=
  [ { outputName := "Spectral sheet"
      requiredMetrics := ["m_plus", "m_minus", "m_zero", "M_plus_in", "M_minus_in", "M_zero_in", "Q_plus_spec", "Q_minus_spec", "Q_zero_spec"] }
  , { outputName := "Field sheet"
      requiredMetrics := ["maxPhiS1", "maxPhiS3", "maxPhiS5"] }
  , { outputName := "Transport sheet"
      requiredMetrics := ["deltaXPlusS1", "deltaXMinusS1", "deltaXZeroS1", "repulsionIndex", "screeningIndex"] } ]

theorem toyV10PipelineContracts_length : toyV10PipelineContracts.length = 5 := by
  rfl

end Technology.AGT.Source
end PhysicsLean
