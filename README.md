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

Follow the installation guide, [`setup/installation.tex`](setup/installation.tex). It
covers macOS, Windows and Linux: Git, the GitHub CLI with SSH, VS Code, Julia and its
packages, and a quick test of your AI agent. Compile it with

```bash
latexmk -pdf -cd setup/installation.tex
```

or ask the instructor for the PDF. Plan for 45–60 minutes, most of it waiting while
Julia packages compile.

## Contents

| Folder | Content | Status |
|---|---|---|
| [`setup/`](setup/) | Installation guide and `setup_julia.jl` | Ready |
| [`slides/`](slides/) | Course slides | Not published yet |
| [`DrivenSpin/`](DrivenSpin/) | Hands-on Julia project | Not published yet |
| [`handout/`](handout/) | Summary and references to keep | Not published yet |

Until `DrivenSpin/` is published, `setup_julia.jl` skips its last step and ends with
"Packages ready, but the hands-on project was not prepared". That is expected. Run
`git pull` and the script again once the project is here.

## License

MIT; see [`LICENSE`](LICENSE).
