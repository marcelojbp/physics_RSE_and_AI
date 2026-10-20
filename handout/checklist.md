# Before trusting AI output: a checklist

From the course *AI for Physics Projects* (course notes, Part II). Keep in sync with `handout/sections/21_checklist.tex`.

## Before the agent starts

- [ ] The project is under git and the last commit is clean (`git status`).
- [ ] The task is one task, in a fresh session.
- [ ] The prompt names the files, the conventions (or `AGENTS.md`), the tests that define "done", and what must not change.
- [ ] For anything non-trivial: the agent proposes a plan and you approve it.

## Tests

- [ ] The tests were written (or listed) *before* the implementation, read by you line by line, and committed.
- [ ] They check physics, not the implementation: analytic results, limiting cases, symmetries, conservation laws, bounds, units.
- [ ] At least one test checks every quantity you will publish, including phases and signs, not only populations.
- [ ] You broke the code on purpose, and the important tests failed.
- [ ] Approximate comparisons near zero have an absolute tolerance (`atol`).
- [ ] Random numbers have a fixed seed.

## Reading the change

- [ ] You read `git diff test/` first: no loosened tolerance, deleted assertion or special case.
- [ ] You read the rest of the diff, not the agent's summary of it.
- [ ] No unexpected change to `Manifest.toml`, conventions or units.
- [ ] You ran the tests yourself, or CI ran them on the pushed commit.

## Numbers and fits

- [ ] Converged: halving the step (or raising the cutoff) does not change the result beyond the tolerance; the observed order matches the method.
- [ ] Cross-checked by an independent route (another package, another method, a limit by hand).
- [ ] Injection–recovery: the pipeline recovers known parameters within error bars; over many seeds the pulls look like a unit Gaussian.
- [ ] Results saved with the commit hash (e.g. `produce_or_load`), from a clean repository (no `-dirty`).

## Text, derivations, references

- [ ] Every reference opened: it exists, and it says what is claimed.
- [ ] Every derivation checked numerically or symbolically by a script in the repository.
- [ ] Every claim has a status: verified, fixed, weakened, retracted or open.

## Responsibility

- [ ] No data left your machine that your institution or collaboration does not allow.
- [ ] The tool and model are recorded (commit trailer, README).
- [ ] The journal's AI policy is followed: disclosure of tool, role, direction and verification.
- [ ] You can defend every line as your own.
