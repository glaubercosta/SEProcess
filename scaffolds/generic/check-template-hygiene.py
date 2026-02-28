from __future__ import annotations

import re
import sys
from pathlib import Path


def main() -> int:
    sessions_path = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("seprocess/sessions")

    if not sessions_path.exists():
        print(f"Template hygiene check skipped: '{sessions_path}' not found.")
        return 0

    patterns = [
        r"TEMPLATE_ONLY",
        r"\[Step\]",
        r"\[Question\]",
        r"\[Objective\]",
        r"\[Out of scope item\]",
        r"\[value\]",
    ]
    compiled = [re.compile(pattern) for pattern in patterns]

    files = [path for path in sessions_path.rglob("*.md") if path.is_file()]
    if not files:
        print(f"Template hygiene check skipped: no markdown artifacts found in '{sessions_path}'.")
        return 0

    matches: list[str] = []
    for file_path in files:
        content = file_path.read_text(encoding="utf-8", errors="ignore")
        for pattern in compiled:
            if pattern.search(content):
                matches.append(f"{file_path} :: pattern '{pattern.pattern}'")
                break

    if matches:
        print("Template hygiene check failed. Unresolved template markers found:")
        print("\n".join(matches))
        return 1

    print("Template hygiene check passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
