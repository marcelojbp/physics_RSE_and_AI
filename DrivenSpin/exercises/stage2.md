# Stage 2: decoherence (20 min)

Add energy relaxation (T1) and dephasing (T2) with the Lindblad master equation

    dρ/dt = −i[H, ρ] + Γ₁ D[σ₋]ρ + (Γ_φ/2) D[σz]ρ

with D[L]ρ = LρL† − ½{L†L, ρ}, σ₋ = |g⟩⟨e|, Γ₁ = 1/T1, Γ_φ = 1/T_φ and
1/T2 = 1/(2T1) + 1/T_φ.

**Function.** `lindblad(H, ρ0, ts; T1, T2, dt)` returns the density matrices at the
times `ts`, starting from `ρ0` at t = 0. Integrate with a fixed-step fourth-order
Runge–Kutta method of step at most `dt`. T1 = T2 = Inf is allowed.

**Tests** (write these first):
- At all times: tr ρ = 1, ρ = ρ†, eigenvalues ≥ 0.
- Ω = 0, start in |e⟩: P_e(t) = exp(−t/T1).
- Ω = Δ = 0, start in |+⟩ = (|e⟩ + |g⟩)/√2: |ρ_eg(t)| = ½ exp(−t/T2), where
  ρ_eg = ⟨e|ρ|g⟩.
- T2 > 2T1 is rejected with an `ArgumentError`.
- T1, T2 → ∞ gives stage 1: `excited_population(ρ)` equals
  `excited_population(H, t)`.

**Extra (convergence).** The error of RK4 scales as dt⁴. With T1 = 1 μs, Ω = 0,
start in |e⟩ and final time T = 2 μs:

```julia
ρT(dt) = last(lindblad(H, ρ0, [T]; T1, T2, dt))           # fixed-step RK4
err(dt) = abs(excited_population(ρT(dt)) - exp(-T / T1))  # free decay from |e⟩
@test log2(err(0.02) / err(0.01)) ≈ 4 atol = 0.2          # RK4: p = 4
```
