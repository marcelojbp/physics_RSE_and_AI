---
name: fit-ramsey
description: Fit Ramsey fringes and report T2* with errors. Use when
  analysing Ramsey or free-induction-decay data.
---
1. Load the data from data/exp_raw; never modify the raw file.
2. Fit P(t) = A exp(-t/T2*) cos(Δt + φ) + B with LsqFit.
3. Check: residuals show no structure; T2* ≤ 2 T1 if T1 is known.
4. Save the fit with produce_or_load; plot data and fit; report T2* ± σ.
