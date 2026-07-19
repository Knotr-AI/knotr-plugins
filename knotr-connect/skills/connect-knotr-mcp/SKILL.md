---
name: connect-knotr-mcp
description: >-
  Connect a Knotr profile to Cursor or Claude Code (MCP + profile plugin).
  Use when the user wants personal context, Knotr skills, or a profile MCP
  server in their IDE. Guides equal paths: start in Marketplace or knotr.ai
  Integrations; both finish with Connect and the profile plugin install.
---

# Connect Knotr MCP

This plugin (`knotr-connect`) is a **bootstrap only**. It does **not** replace
your **profile plugin** (skills, rules, commands synced from your Knotr
account). Live MCP and profile content stay on [knotr.ai](https://knotr.ai).

## Equal paths (same destination)

Users may start in either place:

| Start | Next (shared) |
|-------|----------------|
| **IDE:** Install Knotr Connect (this plugin) from Cursor Marketplace or Claude plugin dir | Open profile **Integrations** on knotr.ai → **Connect MCP** → **Install profile plugin** |
| **In-app:** Profile **Integrations** → Connect Cursor / Claude setup | Same: MCP connected → install profile plugin |

Canonical steps:

1. Have a Knotr account and profile ([knotr.ai](https://knotr.ai)).
2. **Connect MCP** for that profile (Integrations).
3. **Install profile plugin** (agent prompt → `get_ide_plugin_install`, or zip download).
4. Reload the IDE; refresh later with `knotr-sync` or `bash scripts/sync-knotr-ai-plugin.sh` from the profile plugin root.

## Cursor

1. On knotr.ai, open your profile → **Integrations** → **Cursor**.
2. **Step 1: Connect Cursor** — click **Connect Cursor** (adds this profile’s MCP server; API key is embedded in the link).
3. **Step 2: Install plugin** — copy the install prompt from Integrations into a Cursor chat. Typical prompt:

   > Install my Knotr plugin. Call the `get_ide_plugin_install` tool on the `<profile-mcp-server>` MCP server with empty arguments, then run the returned installer script in the terminal. After install, reload the Cursor window.

   Use the exact prompt shown in Integrations (it includes your MCP server key).
4. Reload the Cursor window.
5. To refresh skills after changes on knotr.ai, invoke `knotr-sync` from the profile plugin or run `bash scripts/sync-knotr-ai-plugin.sh` from the profile plugin root, then reload.

Optional advanced: download the IDE bundle or Cursor rule from Integrations.

## Claude Code

1. On knotr.ai, open your profile → **Integrations** → **Claude Code**.
2. Download and unzip the **IDE plugin bundle**.
3. From the parent of the plugin root, run: `claude --plugin-dir ./PLUGIN_FOLDER` (see the bundle README).
4. Set the profile API key env var from `plugin-sync.json` (same as MCP Authorization), or `KNOTR_AI_API_KEY`.
5. Run `/reload-plugins` after changes; resync with `bash scripts/sync-knotr-ai-plugin.sh` from the plugin root.
6. Invoke skills as `/MANIFEST_NAME:skill-folder-name` (manifest name matches your MCP server key).
7. At session start, call MCP `about-me` for full owner context and assistant behavior.

## Agent checklist

When helping the user connect:

1. Confirm they have (or create) a knotr.ai profile.
2. Prefer the in-app Integrations flow for Connect + install prompt (source of truth).
3. After MCP is connected, install the **profile** plugin via `get_ide_plugin_install` — do not treat this marketplace bootstrap as the profile skill pack.
4. Do not invent or hard-code API keys or MCP URLs; those come from Integrations / the profile.
