import PhysicsLean.Foundations.Prelude
import PhysicsLean.Foundations.Logic
import PhysicsLean.Foundations.List
import PhysicsLean.Foundations.Multiset
import PhysicsLean.Foundations.FiniteWord
import PhysicsLean.Foundations.Grading
import PhysicsLean.Foundations.Quotients
import PhysicsLean.StructuralCore.SEq.SymbolicStructure
import PhysicsLean.StructuralCore.SEq.Morphism
import PhysicsLean.StructuralCore.SEq.Category
import PhysicsLean.StructuralCore.SeqSEq.Object
import PhysicsLean.StructuralCore.SeqSEq.Reduction
import PhysicsLean.StructuralCore.SeqSEq.Normalization
import PhysicsLean.StructuralCore.SeqSEq.Category
import PhysicsLean.StructuralCore.Models.ZSym.Alphabet
import PhysicsLean.StructuralCore.Models.ZSym.Semantics
import PhysicsLean.StructuralCore.Models.ZSym.Reduction
import PhysicsLean.StructuralCore.Models.ZSym.Object
import PhysicsLean.StructuralCore.HPattern.Basic
import PhysicsLean.StructuralCore.HPattern.Extractor
import PhysicsLean.StructuralCore.HPattern.Quotient
import PhysicsLean.StructuralCore.HPattern.Category
import PhysicsLean.StructuralCore.EFU.Basic
import PhysicsLean.StructuralCore.EFU.Decomposition
import PhysicsLean.StructuralCore.EFU.CanonicalZSym
import PhysicsLean.StructuralCore.Series.Coefficients
import PhysicsLean.StructuralCore.Series.PatternSeries
import PhysicsLean.StructuralCore.Series.AssemblySeries
import PhysicsLean.StructuralCore.Transfer.Kernel
import PhysicsLean.StructuralCore.Transfer.Factorization
import PhysicsLean.StructuralCore.Transfer.Moments
import PhysicsLean.StructuralCore.Transfer.SpectralControl
import PhysicsLean.ObserverDynamics.Causal.Event
import PhysicsLean.ObserverDynamics.Causal.History
import PhysicsLean.ObserverDynamics.Observer.Basic
import PhysicsLean.ObserverDynamics.Observer.Projection
import PhysicsLean.ObserverDynamics.Observer.Invariance
import PhysicsLean.ObserverDynamics.Geometry.SpaceTimeImage
import PhysicsLean.ObserverDynamics.Geometry.GravityChannel
import PhysicsLean.ObserverDynamics.Dynamics.Action
import PhysicsLean.ObserverDynamics.Dynamics.EnergyMomentum
import PhysicsLean.ObserverDynamics.Dynamics.InertiaForce
import PhysicsLean.ObserverDynamics.Dynamics.EffectiveEquations
import PhysicsLean.ObserverDynamics.Dynamics.ToyModels
import PhysicsLean.QuantumStat.Amplitudes.HistoryAmplitude
import PhysicsLean.QuantumStat.Amplitudes.StateImage
import PhysicsLean.QuantumStat.Measurement.Records
import PhysicsLean.QuantumStat.Measurement.Decoherence
import PhysicsLean.QuantumStat.Information.Density
import PhysicsLean.QuantumStat.Information.Entropy
import PhysicsLean.QuantumStat.Thermo.PartitionResolvent
import PhysicsLean.QuantumStat.Thermo.Ensembles
import PhysicsLean.QuantumStat.Thermo.Potentials
import PhysicsLean.QuantumStat.Thermo.Irreversibility
import PhysicsLean.ContinuumField.Transport.Continuity
import PhysicsLean.ContinuumField.Transport.Diffusion
import PhysicsLean.ContinuumField.Transport.Conductivity
import PhysicsLean.ContinuumField.Transport.HydrodynamicLimit
import PhysicsLean.ContinuumField.Relativistic.EffectiveCone
import PhysicsLean.ContinuumField.Relativistic.FieldImage
import PhysicsLean.ContinuumField.QFT.Propagator
import PhysicsLean.ContinuumField.QFT.PoleResidue
import PhysicsLean.ContinuumField.QFT.Scattering
import PhysicsLean.ContinuumField.ManyBody.Phases
import PhysicsLean.ContinuumField.ManyBody.SymmetryBreaking
import PhysicsLean.ContinuumField.ManyBody.Topology
import PhysicsLean.HigherOrganization.Chemistry.BindingGraph
import PhysicsLean.HigherOrganization.Chemistry.ReactionNetwork
import PhysicsLean.HigherOrganization.Chemistry.MaterialClass
import PhysicsLean.HigherOrganization.Biology.Viability
import PhysicsLean.HigherOrganization.Biology.SelfReplication
import PhysicsLean.HigherOrganization.Biology.Adaptation
import PhysicsLean.HigherOrganization.Cognition.InternalModel
import PhysicsLean.HigherOrganization.Cognition.Learning
import PhysicsLean.HigherOrganization.Language.SymbolicCoordination
import PhysicsLean.HigherOrganization.FormalKnowledge.FormalSystem
import PhysicsLean.HigherOrganization.FormalKnowledge.ProofComputation
import PhysicsLean.StandardModel.Residue.Observable
import PhysicsLean.StandardModel.Residue.Sector
import PhysicsLean.StandardModel.Electroweak.Charges
import PhysicsLean.StandardModel.Electroweak.HiggsBridge
import PhysicsLean.StandardModel.Electroweak.WeakCurrent
import PhysicsLean.StandardModel.Flavour.FamilyCore
import PhysicsLean.StandardModel.Flavour.Mixing
import PhysicsLean.StandardModel.Color.Charges
import PhysicsLean.StandardModel.Color.SingletRule
import PhysicsLean.StandardModel.Color.ConfinementTarget
import PhysicsLean.StandardModel.Anomaly.Compatibility
import PhysicsLean.StandardModel.Anomaly.UniquenessTarget
import PhysicsLean.StandardModel.Dictionary.ObserverDecategorification
import PhysicsLean.StandardModel.Dictionary.EffectiveImage
import PhysicsLean.StandardModel.Dictionary.LagrangianMap
import PhysicsLean.Technology.AGT
import PhysicsLean.Technology.FTL
import PhysicsLean.Technology.Materialization
import PhysicsLean.Audit.Status.StatementStatus
import PhysicsLean.Audit.Status.Provenance
import PhysicsLean.Audit.Dependency.LayerGraph
import PhysicsLean.Audit.FailureModes.Core
import PhysicsLean.Audit.FailureModes.StandardModel
import PhysicsLean.Audit.Coverage.Matrix
import PhysicsLean.Audit.ComputationalSchema.Pipeline
import PhysicsLean.Audit.Targets.Wrappers

/-!
# PhysicsLean Main Aggregator

This project hosts the Lean formalization for the structural-physical theory
developed in `docs/book`. It is intentionally separate from `SymSeq`.

The current public import surface now spans the staged packages through the
audit layer plus the first applied-technology package skeletons: structural
core, observer/dynamics, quantum/statistical, continuum/field,
higher-organization, Standard Model, audit, and technology packages.
-/

namespace PhysicsLean

end PhysicsLean
