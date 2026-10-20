"""
    DrivenSpin

A driven two-level system (a spin, or a qubit) in the frame rotating with the drive.

Conventions (see AGENTS.md): ħ = 1; times in μs, angular frequencies in rad/μs;
basis order (|e⟩, |g⟩), so |e⟩ = [1, 0] and |g⟩ = [0, 1]; σz|e⟩ = +|e⟩;
σ₋ = |g⟩⟨e|; detuning Δ = ω_q − ω_d.
"""
module DrivenSpin

using LinearAlgebra

export σx, σy, σz, σm, ket_e, ket_g
export hamiltonian, propagator, excited_population

# Pauli matrices in the basis (|e⟩, |g⟩).
const σx = ComplexF64[0 1; 1 0]
const σy = ComplexF64[0 -im; im 0]
const σz = ComplexF64[1 0; 0 -1]
const σm = ComplexF64[0 0; 1 0]    # σ₋ = |g⟩⟨e|

const ket_e = ComplexF64[1, 0]
const ket_g = ComplexF64[0, 1]

"""
    hamiltonian(Δ, Ω)

Rotating-frame Hamiltonian H = (Δ/2) σz + (Ω/2) σx of a spin driven at Rabi
frequency `Ω` and detuning `Δ` (both in rad/μs).
"""
function hamiltonian(Δ, Ω)
    return Δ/2 * σz + Ω/2 * σx
end

"""
    propagator(H, t)

Time-evolution operator U(t) = exp(−iHt) of a time-independent Hamiltonian `H`.
"""
propagator(H, t) = exp(-im * H * t)

"""
    excited_population(H, t)

Probability P_e(t) = |⟨e|U(t)|g⟩|² to find the spin in |e⟩ at time `t` (μs),
starting from |g⟩ at t = 0.
"""
excited_population(H::AbstractMatrix, t::Real) = abs2(ket_e' * propagator(H, t) * ket_g)

"""
    excited_population(ρ)

Excited-state population ⟨e|ρ|e⟩ of the density matrix `ρ`.
"""
excited_population(ρ::AbstractMatrix) = real(ρ[1, 1])

end # module
