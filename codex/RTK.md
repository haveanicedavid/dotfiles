# RTK - Rust Token Killer (Codex CLI)

**Usage**: Token-optimized CLI proxy for shell commands.

## Rule

Always prefix shell commands with `rtk`.

Examples:

```bash
rtk git status
rtk cargo test
rtk npm run build
rtk pytest -q
```

## Performance-Preserving Output Discipline

Save tokens by retrieving evidence in stages, never by withholding context that
could affect correctness.

1. Locate relevant files and symbols with `rtk rg -n`.
2. Inspect exact, unfiltered source windows around matches (normally 100-200
   lines), for example `rtk proxy sed -n '120,220p' <file>`.
3. Expand adjacent windows whenever a definition, control-flow path, caller,
   test, or other relevant context crosses the current boundary.
4. Read the whole file when its complete structure is materially relevant or
   when staged inspection would create uncertainty.

- Use `rtk read -l aggressive` only as a navigational overview. Do not rely on
  lossy summaries for final implementation, debugging, or review decisions.
- Plain `rtk read` is appropriate for known-small files. For large files, first
  locate the relevant region and then read exact source.
- Avoid repeating source regions already inspected unless the file changed or
  the earlier output is no longer available in context.
- For generated files, dependencies, minified output, or long matching lines,
  first use file lists, match limits, or `--max-columns`; inspect the complete
  relevant content if the task depends on it.
- Start with compact failure output, but retrieve the saved full output whenever
  the summary is ambiguous or omits actionable evidence.
- Prefer bounded `rtk proxy` output, but use complete raw output whenever exact
  fidelity is required for correctness.
- Do not run `rtk env` in an agent session because it may print secret values.

## Meta Commands

```bash
rtk gain            # Token savings analytics
rtk gain --history  # Recent command savings history
rtk proxy <cmd>     # Run raw command without filtering
```

## Verification

```bash
rtk --version
rtk gain
which rtk
```
