# AI for Physics Projects

Material for a one-afternoon mini-course on using AI coding agents in physics research,
taught as research software engineering.

AI makes code cheap to write. Checking that the code is right then becomes the
bottleneck. The practices that make human-written research code trustworthy (version
control, a clear project structure, tests, continuous integration) also make
agent-written code trustworthy. The course teaches these practices, with Git as the
safety net that makes it safe to let an agent edit your files.

All examples are in [Julia](https://julialang.org), in a
[DrWatson](https://juliadynamics.github.io/DrWatson.jl/) project. The hands-on problem
is a driven spin: Rabi oscillations, decoherence, Ramsey and spin echo, and a fit to
synthetic data. You can use any AI agent that runs on your own computer, such as
Claude Code or Codex.

## Before the course

Follow the installation guide,
**[`setup/installation.pdf`](setup/installation.pdf)** (open it on GitHub, or use the
download button there). It covers macOS, Windows and Linux: Git, the GitHub CLI with
SSH, VS Code, Julia and its packages, and a quick test of your AI agent. Plan for 45–60 minutes, most of it waiting while
Julia packages compile.

## Contents

| Folder | Content | Status |
|---|---|---|
| [`setup/`](setup/) | Installation guide (PDF and LaTeX source) and `setup_julia.jl` | Ready |
| [`slides/`](slides/) | Course slides ([PDF](slides/main.pdf)) and Beamer source | Draft |
| [`DrivenSpin/`](DrivenSpin/) | Hands-on Julia project, stage 1, with the [exercises](DrivenSpin/exercises/README.md) | Ready |
| [`handout/`](handout/) | Course notes: background per block, git cheat sheet, verification checklist, annotated references ([PDF](handout/notes.pdf)) | Draft |

If you ran `setup_julia.jl` before `DrivenSpin/` was published, it ended with
"Packages ready, but the hands-on project was not prepared". Update your copy and run
it again; it now installs the project's exact package versions and runs its tests:

```bash
git pull
julia setup/setup_julia.jl
```

## License

MIT; see [`LICENSE`](LICENSE).
