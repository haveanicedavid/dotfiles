---
name: coderabbit-review
description: Critically evaluate CodeRabbit AI code review comments against actual codebase context using evidence-first analysis before any verdict.
---

# CodeRabbit Review

Evaluate CodeRabbit comments by gathering extensive codebase evidence before making verdicts. Never assume architecture or patterns; verify them.

## Critical Rule: Evidence Before Verdict

Before rendering ANY verdict on a CodeRabbit suggestion, you MUST:

1. Read all mentioned files completely, not just referenced lines.
2. Search for evidence related to the suggestion's assumptions.
3. Check the git diff against the target base branch to understand what changed and why.
4. Avoid architectural assumptions; verify with repository search.

## Workflow

### 1. Parse Comments

Extract from each comment:

- file path and line numbers
- claimed issue
- suggested fix
- assumptions that need verification

### 2. Gather Context (MANDATORY)

```bash
BASE_BRANCH="$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@')"
BASE_BRANCH="${BASE_BRANCH:-main}"

git diff "${BASE_BRANCH}...HEAD"

# Read each mentioned file completely
cat <file_path>

# Search for evidence behind the suggestion's assumptions
rg --line-number --hidden --glob '!target' "<key_terms>"
```

Key searches by suggestion type:

- "Hardcoded X" -> search for existing configuration/abstractions for X
- "No support for Y" -> search for Y support patterns in the codebase
- "Should extract to shared" -> read both locations and compare responsibilities and call paths
- "YAGNI" claims -> verify existing/pending usage first

### 3. Evaluate With Evidence

For each suggestion, document:

```md
## [File:Lines] - [Issue Summary]

**CodeRabbit Assumption:** [What the suggestion assumes]

**Evidence Found:**
- [file:line] [fact]
- [file:line] [fact]

**Branch Context:**
- [How this branch differs from base and whether change is intentional]

**Verdict:** [Implement / Skip / Defer]

**Reasoning:** [Evidence-backed rationale]
```

### 4. Execute Approved Changes

After analysis, implement all `Implement` items that are in scope and safe.

Then:

```bash
git add -A
git commit -m "Address CodeRabbit review feedback"
git push
```

### 5. Respond To Every Unresolved CodeRabbit Comment

For each unresolved CodeRabbit comment thread:

1. Post a reply indicating status:
- Fixed: summarize what changed and where.
- Not fixed: explain why (Skip/Defer) with concise evidence.
2. After replying, mark that thread as resolved.

Do this for every unresolved CodeRabbit thread, not only ones you changed.

## Verdict Categories

- Implement: suggestion is valid and aligns with current codebase patterns.
- Skip: suggestion relies on incorrect assumptions or introduces poor-fit abstractions.
- Defer: concern is valid but out of scope for this PR or needs broader design discussion.

## Anti-Patterns To Avoid

- "This is YAGNI" without searching for existing usage.
- Architecture claims without file/line evidence.
- Verdicts after reading only hunk snippets.
- Assuming a feature does not exist without search.
- Dismissing pattern concerns you did not verify.

## Output Format

After analysis, provide:

1. Summary table of verdicts.
2. Detailed reasoning per suggestion with file/line evidence.
3. Implementation summary (committed + pushed).
4. Per-thread response summary: fixed/not-fixed and resolution status.
