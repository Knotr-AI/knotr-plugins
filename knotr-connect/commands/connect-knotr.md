---
name: connect-knotr
description: >-
  Run the Knotr connect procedure for Cursor or Claude Code (MCP + profile
  plugin install). Prefer executing tools and installers over explaining UI.
---

# Connect Knotr

Execute the connect-knotr-mcp skill procedure for this IDE. Bootstrap only —
finish with the **profile** plugin installed, not this marketplace plugin alone.

1. Confirm knotr.ai profile exists.
2. Connect profile MCP (Integrations → Connect; do not invent keys/URLs).
3. Install profile plugin: call `get_ide_plugin_install` when available (Cursor),
   or use the Integrations IDE bundle path (Claude Code).
4. Run the installer / `claude --plugin-dir` as returned or documented in the
   bundle; reload plugins / window.
5. Later: `knotr-sync` or `bash scripts/sync-knotr-ai-plugin.sh` from the
   profile plugin root.
