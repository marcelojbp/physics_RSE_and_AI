# Hands-on: the driven spin

You start from stage 1 (coherent Rabi oscillations, with tests). In pairs, you add
stages 2–4 with your own AI agent; stage 5 is for those who finish early.

| Stage | Physics | Time | Instructions |
|---|---|---|---|
| 1 | Rabi oscillations | done | [stage1.md](stage1.md): how the starting point was built |
| 2 | Decoherence: T1 and T2 | 20 min | [stage2.md](stage2.md) |
| 3 | Ramsey fringes and spin echo | 15 min | [stage3.md](stage3.md) |
| 4 | Synthetic experiment and fit | 15 min | [stage4.md](stage4.md) |
| 5 | Stretch goals | — | [stage5.md](stage5.md) |
| — | The planted bug | 5 min | [planted_bug.md](planted_bug.md) |

## Getting started

```bash
cd ~/ai-course
cp -r course/DrivenSpin DrivenSpin
cd DrivenSpin
git init
git add .
git commit -m "Start from stage 1"
julia --project -e 'using Pkg; Pkg.instantiate(); Pkg.test()'
```

The stage-1 tests pass before you change anything. Start your agent *inside*
`DrivenSpin/`, so that it reads `AGENTS.md`.

## Each stage in four steps

1. Ask the agent for the tests only:

   > Read AGENTS.md and src/. Write ONLY the tests for stage 2 in
   > test/runtests.jl, from the checks in exercises/stage2.md. Do not implement anything.

2. Read the tests and commit them: now they are a fixed target.

   ```bash
   git diff test/
   git commit -am "Stage 2: tests for T1 and T2 decay"
   ```

   The new tests fail at this point: the functions do not exist yet.

3. Ask the agent for the implementation:

   > Implement stage 2 in src/ until all tests pass.
   > Do not modify anything in test/. If a test seems wrong, stop and tell me why.

4. Read the implementation, run the tests yourself, commit.

   ```bash
   git diff
   julia --project -e 'using Pkg; Pkg.test()'
   git commit -am "Stage 2: Lindblad evolution with T1 and T2"
   ```

Pairs: the person new to git types the git commands. Swap the keyboard after every
stage.

## When you are stuck

> The test "free decay" fails. Run only that testset, read the failing
> assertion, and explain the cause before changing any code.

Ask for an explanation before a fix. If the agent goes in circles, discard its
changes with `git restore .` and start a fresh session.
