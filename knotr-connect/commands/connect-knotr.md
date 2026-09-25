---
name: connect-knotr
description: >-
  Connect Knotr OAuth MCP for Cursor or Claude Code. Prefer executing tools over
  explaining UI. Profile skills stay on knotr.ai via MCP—do not require a full
  local skill sync. Optional light profile zip only for rules/behavior.
---

# Connect Knotr

Execute the connect-knotr-mcp skill procedure for this IDE.

1. Confirm knotr.ai profile exists.
2. Connect profile MCP via Integrations → Connect (OAuth; do not invent URLs
   or tokens). Call **about-me** to verify.
3. Use knotr-connect domain skills over MCP for skills, knowledge, artifacts,
   and style (`use-knotr-skills`, `use-knotr-knowledge`, `use-knotr-artifacts`,
   `use-knotr-style`).
4. Optional only: light profile zip via `get_ide_plugin_install` (default light)
   for on-disk rules/behavior—not for bulk skill bodies. Use
   `bundle_mode: "full"` only if the user asks for every skill on disk.
5. Reload window / `/reload-plugins` if a profile zip was installed.
