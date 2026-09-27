#!/usr/bin/env python3
"""Make Superpowers skills manual-invoke only across Codex, Claude, Grok, and Kimi.

Plugin updates restore upstream auto-trigger copy. Re-run this script after updating
the Superpowers plugin on any of those tools.
"""

from __future__ import annotations

import json
import re
from pathlib import Path

EXPLICIT = (
    "Use only when the user explicitly invokes this exact superpowers skill "
    "by name or slash command."
)
USING_EXPLICIT = (
    "Use only when the user explicitly says to use superpowers or explicitly "
    "invokes a superpowers skill."
)

ROOTS = [
    Path("/Users/ddaniel/.codex/superpowers"),
    Path("/Users/ddaniel/.claude/plugins/cache/claude-plugins-official/superpowers/6.3.0"),
    Path("/Users/ddaniel/.grok/installed-plugins/superpowers-21e2a56d"),
    Path("/Users/ddaniel/.codex/plugins/cache/superpowers-dev/superpowers/6.3.0"),
]

NOOP_SESSION_START = """#!/usr/bin/env bash
# SessionStart hook disabled: Superpowers should not auto-inject using-superpowers.
# Re-apply with ~/dotfiles/agents/superpowers-manual-only.py after plugin updates.
set -euo pipefail
printf '{}\\n'
exit 0
"""


def unique_existing(paths: list[Path]) -> list[Path]:
    seen: set[Path] = set()
    out: list[Path] = []
    for path in paths:
        if not path.exists():
            continue
        resolved = path.resolve()
        if resolved in seen:
            continue
        seen.add(resolved)
        out.append(resolved)
    return out


def rewrite_frontmatter(text: str, skill_name: str) -> str | None:
    if not text.startswith("---"):
        return None
    end = text.find("\n---", 3)
    if end == -1:
        return None
    fm = text[3:end]
    body = text[end + 4 :]

    new_desc = USING_EXPLICIT if skill_name == "using-superpowers" else EXPLICIT
    if re.search(r"^description:\s*", fm, re.M):
        fm = re.sub(
            r'^description:\s*(?:"(?:\\.|[^"\\])*"|[^\n]*)$',
            f"description: {new_desc}",
            fm,
            count=1,
            flags=re.M,
        )
    else:
        fm = fm.rstrip() + f"\ndescription: {new_desc}\n"

    # Keep the skill user-invocable (slash command / $name) but stop model auto-load
    # on Grok and Claude. Codex/Kimi still honor the rewritten description.
    if re.search(r"^disable-model-invocation:\s*", fm, re.M):
        fm = re.sub(
            r"^disable-model-invocation:\s*.*$",
            "disable-model-invocation: true",
            fm,
            count=1,
            flags=re.M,
        )
    else:
        fm = fm.rstrip() + "\ndisable-model-invocation: true\n"

    return f"---{fm if fm.startswith(chr(10)) else chr(10) + fm.lstrip(chr(10))}\n---{body}"


def patch_skill(path: Path) -> bool:
    original = path.read_text()
    updated = rewrite_frontmatter(original, path.parent.name)
    if updated is None or updated == original:
        return False
    path.write_text(updated)
    return True


def write_json(path: Path, payload: dict) -> bool:
    new = json.dumps(payload, indent=2) + "\n"
    if path.exists() and path.read_text() == new:
        return False
    path.write_text(new)
    return True


def noop_session_start(path: Path) -> bool:
    if path.exists() and path.read_text() == NOOP_SESSION_START:
        return False
    path.write_text(NOOP_SESSION_START)
    path.chmod(path.stat().st_mode | 0o111)
    return True


def strip_kimi_session_start(path: Path) -> bool:
    data = json.loads(path.read_text())
    if "sessionStart" not in data:
        return False
    del data["sessionStart"]
    path.write_text(json.dumps(data, indent=2) + "\n")
    return True


def main() -> None:
    changed = 0
    for root in unique_existing(ROOTS):
        skills = root / "skills"
        if skills.is_dir():
            for skill_md in sorted(skills.glob("*/SKILL.md")):
                if patch_skill(skill_md):
                    print(f"skill  {skill_md}")
                    changed += 1

        hooks_json = root / "hooks" / "hooks.json"
        if hooks_json.exists() and write_json(hooks_json, {"hooks": {}}):
            print(f"hooks  {hooks_json}")
            changed += 1

        cursor_hooks = root / "hooks" / "hooks-cursor.json"
        if cursor_hooks.exists() and write_json(
            cursor_hooks, {"version": 1, "hooks": {}}
        ):
            print(f"hooks  {cursor_hooks}")
            changed += 1

        session_start = root / "hooks" / "session-start"
        if session_start.exists() and noop_session_start(session_start):
            print(f"hook   {session_start}")
            changed += 1

        kimi_plugin = root / ".kimi-plugin" / "plugin.json"
        if kimi_plugin.exists() and strip_kimi_session_start(kimi_plugin):
            print(f"kimi   {kimi_plugin}")
            changed += 1

    print(f"updated {changed} files")


if __name__ == "__main__":
    main()
