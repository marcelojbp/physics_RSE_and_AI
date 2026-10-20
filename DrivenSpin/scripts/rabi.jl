using DrWatson
@quickactivate "DrivenSpin"          # this project's environment, from any folder
using DrivenSpin                     # the module in src/

for c in dict_list(Dict(:Δ => [0.0, 2π], :Ω => 2π))   # rad/μs; one run per Δ
    produce_or_load(c, datadir("sims", "rabi")) do c
        H = hamiltonian(c[:Δ], c[:Ω])
        t = range(0, 3, length = 301)                  # μs
        Dict("t" => t, "Pe" => excited_population.(Ref(H), t))
    end
end

# Plot every saved run. Results are loaded from data/sims/rabi: delete that
# folder to recompute them after changing src/.
using CairoMakie
fig = Figure()
ax = Axis(fig[1, 1]; xlabel = "t (μs)", ylabel = "Pₑ", title = "Rabi oscillations")
for c in dict_list(Dict(:Δ => [0.0, 2π], :Ω => 2π))
    data = wload(datadir("sims", "rabi", savename(c, "jld2")))
    lines!(ax, data["t"], data["Pe"]; label = "Δ = $(round(c[:Δ], digits = 2)) rad/μs")
end
Legend(fig[2, 1], ax; orientation = :horizontal, framevisible = false)
wsave(plotsdir("rabi.png"), fig)
println("Saved ", plotsdir("rabi.png"))
