# Stage 5: stretch goals

Pick any.

**Push and watch CI.** Put your repository on GitHub and let it run the tests:

```bash
gh repo create DrivenSpin --private --source=. --push
```

The workflow `.github/workflows/CI.yml` is already in the project; look at the
*Actions* tab of the repository.

**Independent route.** Check your stage-2 solver against QuantumOptics.jl, an
independent implementation (its `SpinBasis(1//2)` uses the same basis order):

```julia
using QuantumOptics
b = SpinBasis(1//2)                                     # |e⟩ = spin up
H = Δ/2*sigmaz(b) + Ω/2*sigmax(b)
c_ops = [sqrt(1/T1)*sigmam(b), sqrt(1/(2Tφ))*sigmaz(b)]
_, ρt = timeevolution.master(ts, dm(spindown(b)), H, c_ops)
@test [real(expect(projector(spinup(b)), ρ)) for ρ in ρt] ≈ my_Pe  rtol = 1e-6
```

**Cavity.** The Jaynes–Cummings model of a spin coupled to a cavity mode:

    H = ω_c a†a + (ω_q/2) σz + g (a†σ₋ + a σ₊)

in a Fock space truncated at n_max photons. Tests:
- The excitation number a†a + σ₊σ₋ is conserved.
- On resonance, starting in |e, n⟩, P_e oscillates as cos²(g√(n+1) t): the
  vacuum Rabi splitting is 2g√(n+1).
- Results converge as the photon cutoff n_max grows (e.g. a coherent initial state).

**Convergence.** If you skipped it in stage 2: test the order of your time stepper.
