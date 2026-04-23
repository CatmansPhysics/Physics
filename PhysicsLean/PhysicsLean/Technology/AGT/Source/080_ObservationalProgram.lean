import PhysicsLean.Technology.AGT.Source.«072_MixedMediumHydrodynamics»

namespace PhysicsLean
namespace Technology.AGT.Source

inductive VerificationLevel
  | microscopic
  | kernel
  | spectral
  | coarseField
  | transport
  | largeScale
  deriving DecidableEq, Repr

structure ObservableDictionary where
  microscopic : List String
  spectral : List String
  mesoscopic : List String
  transport : List String
  largeScale : List String
  deriving Repr

def agtObservableDictionary : ObservableDictionary :=
  { microscopic := ["q_g", "sigma_g", "N_comp^0", "N_comp^{+-}", "ell_shell", "h(x)"]
    spectral := ["Q_g^spec", "lambda_*", "E_rest", "M_in", "mu_scr"]
    mesoscopic := ["rho_g", "P_g", "nu_0", "phi_g", "S_g", "Sigma_w", "n_b(R)"]
    transport := ["C_capt", "C_refl", "C_transm", "C_scat", "C_trap"]
    largeScale := ["Pbar_g", "nubar_0", "Sigmabar_w", "Gamma_nuc", "L_w", "xi_dom"] }

structure Checkpoint where
  code : String
  statement : String
  deriving Repr

def immediateCheckpoints : List Checkpoint :=
  [ { code := "C1"
      statement := "Find a finite rule set with stable positive, negative, and neutral microscopic grav-charge sectors." }
  , { code := "C2"
      statement := "Verify spectral sign compatibility between Q_g^spec and q_g on a toy kernel family." }
  , { code := "C3"
      statement := "Show neutral composites suppress the leading monopole response while allowing higher grav response." }
  , { code := "C4"
      statement := "Find a numerically stable repulsive transport window." }
  , { code := "C5"
      statement := "Find a finite-range screening window with a branch shift or screening scale." }
  , { code := "C6"
      statement := "Show interface sectors have observable transport signatures." }
  , { code := "C7"
      statement := "Show mixed grav-medium dynamics differs from ordinary one-component attraction." } ]

end Technology.AGT.Source
end PhysicsLean
