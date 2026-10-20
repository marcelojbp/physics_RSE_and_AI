# Stage 1: Rabi oscillations (your starting point)

Already done. This is how it was built, so you can do the same in a new project.

1. Create the DrWatson layout:

   ```julia
   julia> using DrWatson
   julia> initialize_project("DrivenSpin"; authors = "Your Name")
   ```

   We then deleted the example files (`scripts/intro.jl`,
   `src/dummy_src_file.jl`) and turned the project into a package, so that
   `using DrivenSpin` and `Pkg.test()` work: a `name`, a `uuid` and a `version` in
   `Project.toml`, the module in `src/DrivenSpin.jl`, and `Test` as a test-only
   dependency (`[extras]` and `[targets]`). The packages of the later stages were
   added with `Pkg.add` right away, so that `Manifest.toml` pins them from the start.

2. Wrote `AGENTS.md`: the physics conventions and the working rules.

3. Wrote the tests first (`test/runtests.jl`):
   - `Rabi`: P_e(t) = (Ω²/Ω_R²) sin²(Ω_R t/2) from |g⟩, with Ω_R = √(Ω² + Δ²); a
     π-pulse at Δ = 0 inverts the spin.
   - `Hamiltonian`: H is Hermitian and traceless, its eigenvalues are ±Ω_R/2,
     and σz|e⟩ = +|e⟩ fixes the sign convention.
   - `Unitarity and norm`: U†U = 1 and the state stays normalised.
   - `Density-matrix population`: P_e = ⟨e|ρ|e⟩ agrees with the state-vector result.

4. Implemented `src/DrivenSpin.jl` until the tests passed:
   `hamiltonian(Δ, Ω)`, `propagator(H, t)`, `excited_population(H, t)` and
   `excited_population(ρ)`, plus the Pauli matrices `σx, σy, σz, σm` and the basis
   states `ket_e, ket_g`.

5. Wrote `scripts/rabi.jl`: a parameter scan saved with `produce_or_load` (every
   file records the git commit of the code) and a plot in `plots/rabi.png`.

6. Added `.github/workflows/CI.yml`, so that GitHub runs the tests on every push.
