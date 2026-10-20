# The planted bug (5 min)

`planted_bug.patch` makes a small change to the code, of the kind an agent makes
while "tidying up". Apply it to your own repository, from inside `DrivenSpin/`:

```bash
git apply ../course/DrivenSpin/exercises/planted_bug.patch
```

If `git apply` complains that the patch does not apply (your agent edited the
lines around it), try `git apply -3 ../course/DrivenSpin/exercises/planted_bug.patch`.

Then:

1. Make the plot and look at it: does it look right?

   ```bash
   rm -r data/sims/rabi
   julia --project scripts/rabi.jl
   ```

   The first line deletes the saved results: `produce_or_load` recognises results
   by their parameters, not by the code that made them, so it would otherwise load
   the old, correct curves.

2. Run the tests. What do they say?

   ```bash
   julia --project -e 'using Pkg; Pkg.test()'
   ```

3. Find the change with `git diff`; undo it with `git restore .`
