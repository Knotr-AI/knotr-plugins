---
name: connect-knotr
description: Run the Knotr Connect checklist for Cursor or Claude Code (account → Connect MCP → profile plugin → reload).
---

# Connect Knotr

Complete these steps so Cursor or Claude Code uses the user’s **Knotr profile** MCP and **profile plugin**. This marketplace plugin is only a bootstrap.

## Shared

1. Open [knotr.ai](https://knotr.ai) — sign in and open the target profile.
2. Go to **Integrations** for that profile.
3. Connect MCP, then install the **profile** plugin (not this bootstrap alone).
4. Reload the IDE. Later: `knotr-sync` or `bash scripts/sync-knotr-ai-plugin.sh` from the profile plugin root.

## Cursor branch

1. Integrations → **Cursor** → **Connect Cursor**.
2. Copy the **Install plugin** prompt into chat (calls `get_ide_plugin_install` on the profile MCP server).
3. Run the returned installer in the terminal; reload Cursor.

## Claude Code branch

1. Integrations → **Claude Code** → download IDE bundle; unzip.
2. `claude --plugin-dir ./PLUGIN_FOLDER` from the parent of the plugin root.
3. Set API key from `plugin-sync.json` (or `KNOTR_AI_API_KEY`).
4. `/reload-plugins`; call MCP `about-me` at session start.
