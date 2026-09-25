---
name: knotr-check-style
description: >-
  Lint text against the profile’s active Knotr style guides via MCP check_style,
  then fix and re-check. Use when the user wants a style/voice pass on draft
  copy.
---

# Check style with Knotr

1. Confirm profile MCP is connected. Call `list_style_guides`—need an
   **active** guide for `check_style` to be available.
2. If no active guide, stop and tell the user to activate or create one (or
   offer `create_or_update_style_guide` if they ask).
3. Call `check_style` with the draft `content` (and optional `style_guide_id` /
   `format`).
4. Apply fixes from issues (message + suggested fix). Re-run until clean or
   the user accepts remaining findings.
5. Summarize what changed.
