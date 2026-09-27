

@/Users/ddaniel/.codex/RTK.md

## Code style

- Never sequence logic using fixed delays; rely only on confirmed completion
  signals (events, async resolution, state) to run the next step.

## Comments

- Default to no comment. Add one only when the code cannot say it itself: a
  non-obvious "why", a constraint or invariant, or a workaround and its reason.
- Never restate what the code does, label obvious blocks, or narrate the change
  ("// now handles X", "// added guard", "// moved from Y").
- Prefer a clearer name or a smaller function over an explanatory comment.
- Avoid comments that go stale: no dates, tickets, authors, or new/old/legacy framing.
- Marker comments (`PERF:`, `REGRESSION:`, `SAFETY:`) record a proven invariant, not
  an intent. Use `REGRESSION:` only for behavior that shipped, broke, and was fixed
  with the cause identified — a bug introduced and fixed within the same branch or
  PR is never a regression.

## Minimal-change override

- Do not invoke `superpowers:*` skills unless I explicitly name one.
  This overrides their automatic trigger rules. Explicitly invoking
  `superpowers:using-superpowers` authorizes the normal Superpowers workflow,
  including invoking any other applicable Superpowers skills for that request.
- Never create or commit design/plan documents unless explicitly requested.
- Reviews and diagnoses do not authorize implementation.
- Performance and concurrency changes require concrete reproduction,
  measurements, logs, or a failing test before implementation.
- Prefer deletion and reuse over new abstractions.
- Complete the requested outcome, including appropriate verification and fixes
  for failures caused by the change. Prefer the simplest complete solution;
  leave unrelated findings untouched.
