using DrivenSpin, Test
using LinearAlgebra

@testset "Rabi" begin
    Δ, Ω = 0.3, 2π                                  # rad/μs
    ΩR = sqrt(Ω^2 + Δ^2)
    H = hamiltonian(Δ, Ω)
    for t in range(0, 3, length = 31)               # μs
        @test excited_population(H, t) ≈ Ω^2 / ΩR^2 * sin(ΩR * t / 2)^2 atol = 1e-10
    end
    @test excited_population(hamiltonian(0.0, Ω), π / Ω) ≈ 1    # π-pulse
end

@testset "Hamiltonian" begin
    H = hamiltonian(0.7, 2.1)
    @test H ≈ H'                                     # Hermitian
    @test tr(H) ≈ 0 atol = 1e-14                     # no energy offset
    @test eigvals(Hermitian(H)) ≈ [-1, 1] * sqrt(0.7^2 + 2.1^2) / 2   # ±Ω_R/2
    @test hamiltonian(1.0, 0.0) * ket_e ≈ +0.5 * ket_e    # σz|e⟩ = +|e⟩
end

@testset "Unitarity and norm" begin
    H = hamiltonian(0.3, 2π)
    for t in (0.0, 0.1, 1.7, 25.0)
        U = propagator(H, t)
        @test U' * U ≈ I
        @test norm(U * ket_g) ≈ 1
    end
end

@testset "Density-matrix population" begin
    @test excited_population(ket_e * ket_e') ≈ 1
    @test excited_population(ket_g * ket_g') ≈ 0 atol = 1e-15
    ψ = propagator(hamiltonian(0.3, 2π), 0.4) * ket_g
    @test excited_population(ψ * ψ') ≈ excited_population(hamiltonian(0.3, 2π), 0.4)
end
