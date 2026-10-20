# Stage 3: Ramsey fringes and spin echo (15 min)

**Ramsey.** Start in |g⟩; π/2 pulse; free evolution (Ω = 0) for a time τ with
dephasing; π/2 pulse; measure P_e. Pulses are ideal (instantaneous):
R(θ) = exp(−iθσx/2). With T1 → ∞:

    P_e(τ) = ½ [1 + exp(−τ/T2) cos(Δτ)]

**Spin echo.** π/2 – τ/2 – π – τ/2 – π/2. The π pulse in the middle undoes the
phase acquired from a static detuning δ.

**Functions.** `pulse(θ)`, `ramsey(Δ, τ; T2)` and `echo(δ, τ)`, all returning
P_e (or the unitary, for `pulse`). Reuse `lindblad` from stage 2 for the free
evolution.

**Tests** (write these first):
- Ramsey fringes oscillate at angular frequency Δ, under the envelope exp(−τ/T2)
  (compare with the formula above).
- Echo: the result does not depend on a static detuning δ.
- Average over random static detunings δ (fixed seed): Ramsey decays, echo does not.
