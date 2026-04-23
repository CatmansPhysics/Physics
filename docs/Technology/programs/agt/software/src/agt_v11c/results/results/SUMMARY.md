# AGT-1 Toy Model v1.1c results

## Strip / double-wall resonance experiment
- Plus-sector dwell peaks above threshold: 0
- Minus-sector dwell peaks above threshold: 1
- Plus top peak q: None
- Minus top peak q: 0.6945606694560669
- Plus top dwell: None
- Minus top dwell: 43.642127833649496
- Max transmission (plus): 0.0000
- Max transmission (minus): 1.0000

Interpretation: the strip background produces a clearer, narrower resonance structure for the sector that sees a cavity-like effective well. In the chosen sign convention, this is the minus sector.

## Bubble resonance / capture-proxy experiment
- R=8: plus_A_peaks=0, minus_A_peaks=1, max_dwell_plus=0.001, max_dwell_minus=1.738, max_abs_plus=0.0000, max_abs_minus=0.0695
- R=12: plus_A_peaks=0, minus_A_peaks=1, max_dwell_plus=0.001, max_dwell_minus=1.738, max_abs_plus=0.0000, max_abs_minus=0.0695
- R=16: plus_A_peaks=0, minus_A_peaks=1, max_dwell_plus=0.001, max_dwell_minus=1.738, max_abs_plus=0.0000, max_abs_minus=0.0695

Interpretation: the bubble experiments use absorption A as the capture proxy in the presence of interface losses. The preferred well sector shows the stronger absorption/capture window in the tested parameter set.

## Notes
- The resonance layer is implemented as a 1D open-chain scattering problem on top of the local AGT spectral mass landscape.
- The effective defect potential is V_scale * (m_sigma(i) - m_bulk); V_scale is a phenomenological interface-coupling parameter in this toy realization.
- Capture is represented by absorption probability A when gamma_int > 0.