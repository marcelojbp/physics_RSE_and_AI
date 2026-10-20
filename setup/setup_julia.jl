# Setup script for the "AI for Physics Projects" mini-course.
#
# Run it once from a terminal, inside the cloned course repository:
#     julia setup/setup_julia.jl
#
# It (1) installs DrWatson and Revise into your default Julia environment,
# (2) downloads and precompiles the packages used in the hands-on session,
# (3) checks that everything loads, and (4) installs the exact package versions
# of the hands-on project DrivenSpin/ and runs its tests.
# Expect 10-20 minutes on first run.

using Pkg

const GLOBAL_PKGS = ["DrWatson", "Revise"]
const COURSE_PKGS = ["DrWatson", "QuantumOptics", "OrdinaryDiffEq",
                     "LsqFit", "CairoMakie", "JLD2"]
const PROJECT_DIR = normpath(joinpath(@__DIR__, "..", "DrivenSpin"))

println("\n[1/4] Installing $(join(GLOBAL_PKGS, ", ")) into the default environment...")
Pkg.activate()
Pkg.add(GLOBAL_PKGS)

println("\n[2/4] Downloading and precompiling course packages (this is the slow part)...")
# A temporary environment fills the package cache without cluttering the
# default environment; the hands-on project reuses the cached packages.
Pkg.activate(; temp = true)
Pkg.add(COURSE_PKGS)
Pkg.precompile()

println("\n[3/4] Checking that every package loads...")
failed = String[]
for pkg in COURSE_PKGS
    try
        @eval using $(Symbol(pkg))
        println("  ok      $pkg")
    catch err
        push!(failed, pkg)
        println("  FAILED  $pkg: ", sprint(showerror, err))
    end
end

using LinearAlgebra, Test
@testset "sanity check" begin
    σx = ComplexF64[0 1; 1 0]
    U = exp(-im * π / 2 * σx)          # π-pulse about x
    @test U * [1, 0] ≈ [0, -im]        # |0⟩ → -i|1⟩
    @test U' * U ≈ I                   # unitarity
end

println("\n[4/4] Preparing the hands-on project DrivenSpin...")
project_found = isfile(joinpath(PROJECT_DIR, "Project.toml"))
if project_found
    # Same versions as on the day (Manifest.toml), so nothing is compiled then.
    try
        Pkg.activate(PROJECT_DIR)
        Pkg.instantiate()
        Pkg.precompile()
        Pkg.test()
        println("  ok      DrivenSpin tests pass")
    catch err
        push!(failed, "DrivenSpin")
        println("  FAILED  DrivenSpin: ", sprint(showerror, err))
    end
else
    println("  skipped: no DrivenSpin/ next to this script.")
    println("  Run the script from the cloned course repository: julia setup/setup_julia.jl")
end

println()
if isempty(failed) && project_found
    println("All good: Julia $(VERSION) is ready for the course.")
elseif isempty(failed)
    println("Packages ready, but the hands-on project was not prepared (see step 4).")
else
    println("Some steps failed: $(join(failed, ", ")).")
    println("Please send this output to the instructor before the course.")
end
