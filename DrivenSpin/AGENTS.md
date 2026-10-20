# AGENTS.md

Instructions for AI coding agents working in this project. Humans: this file is
also the shortest description of how the project works.

DrivenSpin simulates a driven two-level system (a spin, or a qubit) in Julia, as a
DrWatson project. Library code is in `src/DrivenSpin.jl`, scripts in `scripts/`,
tests in `test/runtests.jl`.

## Physics conventions
- ħ = 1; times in μs, angular frequencies in rad/μs
- Basis (|e⟩, |g⟩); H = (Δ/2)σz + (Ω/2)σx with Δ = ω_q - ω_d
- Never change a convention without asking

In detail:
- |e⟩ = [1, 0], |g⟩ = [0, 1] (spin up, spin down, as `SpinBasis(1//2)` in
  QuantumOptics.jl); σz|e⟩ = +|e⟩; σ₋ = |g⟩⟨e|.
- Ω is the Rabi frequency: on resonance, P_e oscillates at angular frequency Ω.
  Starting from |g⟩: P_e(t) = (Ω²/Ω_R²) sin²(Ω_R t/2), with Ω_R = √(Ω² + Δ²).
- Master equation: dρ/dt = −i[H, ρ] + Γ₁ D[σ₋]ρ + (Γ_φ/2) D[σz]ρ, with
  D[L]ρ = LρL† − ½{L†L, ρ}, Γ₁ = 1/T1, Γ_φ = 1/T_φ, 1/T2 = 1/(2T1) + 1/T_φ.
  T2 ≤ 2T1 always.
- Jaynes–Cummings: H = ω_c a†a + (ω_q/2)σz + g(a†σ₋ + aσ₊).

## How to work
- Run the tests: julia --project -e 'using Pkg; Pkg.test()'
- Every new function gets a test with a physical check
- Never weaken or delete a test to make it pass: ask first
- Never write to data/exp_raw

In detail:
- Tests first. When asked to write tests, write only tests. When asked to
  implement, do not modify anything in `test/`; if a test seems wrong, stop and
  explain why instead of changing it.
- Physics goes in `src/`; scripts in `scripts/` only call functions from `src/`,
  set parameters and save results with `produce_or_load`.
- Keep the whole test suite under one minute.
- Fix random seeds in tests.
- Do not add, remove or update packages (`Pkg.add`, `Pkg.update`) without asking:
  `Manifest.toml` pins the versions that produced our results. The project already
  depends on DrWatson, QuantumOptics, OrdinaryDiffEq, LsqFit, CairoMakie and JLD2.
- Plots: CairoMakie only.
- Small steps; the human commits after reading each diff. Do not commit unless asked.
