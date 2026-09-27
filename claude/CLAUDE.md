- Never sequence logic using fixed delays; rely only on confirmed completion signals (events, async resolution, state) to run the next step

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
- Do not spawn subagents or run review loops unless explicitly requested.
- Stop after the smallest verified fix; do not implement adjacent findings.

## Fable orchestration

This section applies only when Fable is the session model. Fable remains the
lead agent and owns understanding intent, discovering unknowns, architecture,
task decomposition, quality decisions, user communication, and final acceptance.
Do not replace Fable with Sonnet plus a Fable advisor unless the user explicitly
asks for a budget-first session.

Use other models as bounded workers when doing so preserves Fable's judgment
while moving token-heavy mechanical work out of its context:

- Codex: well-specified implementation, codebase analysis, log or large-document
  processing, migrations, test execution, computer use, and other long mechanical
  work. Use `codex exec -C "$PWD" -s read-only` for investigation and
  `codex exec -C "$PWD" -s workspace-write` for explicitly delegated edits.
- Sonnet: bounded Claude-native exploration, routine edits, or a thin workflow
  wrapper when invoking Codex directly would add unnecessary overhead.
- Opus: independent review or implementation that needs strong judgment or taste
  but does not need Fable to hold the full conversational thread.
- Never use Haiku for work that affects a shipped result.

Give each worker a self-contained brief with one outcome, relevant context and
file paths, constraints, and a verifiable definition of done. Require a compact
report containing findings, changed files or diff summary, and verification
evidence; never return raw file, log, or webpage dumps to Fable.

Fable must inspect material findings and delegated diffs against the original
intent before accepting them. For user-facing UI, copy, API design, architecture,
ambiguous debugging, or cross-cutting decisions, keep judgment in Fable. If a
worker misses the bar, diagnose the gap and redirect, escalate, or redo the work
with a stronger model. Cost is only a tie-breaker; never ship mediocre work to
save tokens.

Avoid Ultracode, agent teams, and broad fan-out by default. Use them only when the
task genuinely benefits from parallel independent contexts or the user explicitly
asks for the extra compute.

@RTK.md
