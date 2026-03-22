# Daily bug scan memory

## 2026-03-14T04:02:33Z
- Scope scanned: commits since last run timestamp `2026-03-13T04:29:20Z` in `/Users/ddaniel/.codex/worktrees/2c55/superconductor`.
- Reviewed commits: `ca60b54f` (#423), `9f467128` (#424), `319f8b8b` (#422), `3e44334b` (#421), `7e08700e` (#420), `e201d4f2` (#419), `bc61dc0f` (#418), plus earlier same-day UI commits in range.
- Concrete signals:
  - `cargo nextest run -p sc_git` failed in sandbox due to `gpui` Metal shader build trying to write outside writable roots (`/Users/ddaniel/.cache/clang/ModuleCache/...`), so this was not treated as a product regression.
  - `cargo nextest run -p sc_git_types` completed build and reported no tests present.
- Findings: no confirmed, currently-unfixed bug backed by concrete repo evidence in the scanned range.
- Notes: commit `bc61dc0f` was reverted by `3e44334b`, so no residual action from that change.

## 2026-03-16T16:15:01Z
- Scope scanned: commits since last run timestamp `2026-03-14T04:00:29Z` in `/Users/ddaniel/.codex/worktrees/90e2/superconductor`.
- Commit evidence reviewed: `73da3531` (#428), `2615a06f` (#406), `db2dde78` (#444) for `crates/chat/tests/codex_adapter.rs` and Codex transport/session code paths.
- Concrete regression found:
  - `cargo nextest run -p sc_chat codex_interactive_transport_flag_off_uses_exec_transport codex_interactive_transport_failure_falls_back_to_exec_without_turn_loss` failed before fix.
  - Failures were tied to test harness/expectation drift in `crates/chat/tests/codex_adapter.rs`:
    - Harness only spoofed `PATH`, but production now routes through managed wrapper resolution; fake CLI could be bypassed or incur wrapper startup behavior.
    - Assertions required `contains(" exec ")` / `contains(" interactive ")`, which does not match observed command logs like `"exec --json hello"` and `"interactive --help"`.
- Minimal fix applied (test-only):
  - Updated fake Codex harness to isolate `HOME`, initialize managed wrapper once, then replace managed `codex` binary with the fake script in the managed bin dir.
  - Relaxed command assertions to accept `exec`/`interactive` token at command start (`==` or `starts_with("<cmd> ")`).
  - File changed: `crates/chat/tests/codex_adapter.rs`.
- Verification after fix:
  - `cargo fmt -p sc_chat`
  - `cargo nextest run -p sc_chat codex_interactive_transport_flag_off_uses_exec_transport codex_interactive_transport_failure_falls_back_to_exec_without_turn_loss` (pass)

## 2026-03-17T16:05:00Z
- Scope scanned: commits since last run timestamp `2026-03-16T16:06:25Z` in `/Users/ddaniel/.codex/worktrees/1c39/superconductor`.
- Commit evidence reviewed: `a7cb4b4a` (#463), `51423e2a` (#453), `21176a76` (#458), `957ebbfe` (#462), `65225551` (#460), `89a47bd3` (#461), `c2bc14a8` (#459), `ed72cd08` (#457), `d8c64b7a` (#456), `430f5594` (#455).
- Concrete verification:
  - `cargo nextest run -p sc_settings test_available_ai_tools_excludes_terminal test_default_ai_preset_returns_none_for_terminal` passed.
  - `cargo nextest run -p sc_git ...` and `cargo nextest run -p sc_workspace ...` were blocked in sandbox: `gpui` Metal shader compilation cannot write to `/Users/ddaniel/.cache/clang/ModuleCache/...`.
- Findings: no confirmed, currently-unfixed bug backed by concrete repo evidence in this window.
- Decision: no fix proposed this run (evidence for regressions is weak/absent).
- Run time: ~16 minutes.
