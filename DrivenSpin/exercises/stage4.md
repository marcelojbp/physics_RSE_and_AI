# Stage 4: a synthetic experiment (15 min)

Simulate a Ramsey measurement as in the lab, then fit it. Fit model:

    P(τ) = B + A exp(−τ/T2) cos(Δτ + φ)

with amplitude A, offset B and phase φ.

**Data.** Use stage 3 for the probabilities; each point is the fraction of
|e⟩ outcomes in N single-shot measurements (binomial noise). Take a random-number
generator as an argument, so that tests can fix the seed.

**Fit.** With LsqFit, weighting each point by its binomial variance. Report every
parameter with its standard error.

**Tests** (write these first):
- Injection–recovery: with a fixed seed, the fitted T2 and Δ are within 3σ of the
  values used to make the data.
- Four times more measurements per point: error bars about half as large.

**Script.** `scripts/ramsey_fit.jl`: make the data, fit, and save the fit with
`produce_or_load`; the file then records the commit of the code. Plot data and fit
in `plots/`.
