---
name: connect-knotr-mcp
description: >-
  Connect a Knotr profile to Cursor or Claude Code via OAuth MCP. Use when the
  user wants personal context, Knotr skills, knowledgebases, artifacts, or style
  checks in their IDE. Execute the connect procedure; do not only explain
  Integrations. Profile skill bodies stay on knotr.ai (MCP)—do not bulk-sync them.
---

# Connect Knotr MCP

This marketplace plugin (`knotr-connect`) is the **bootstrap + domain workflows**
for Knotr. Live profile content (skills, KB, artifacts, style guides) stays on
knotr.ai and is reached through **OAuth MCP**—not by syncing every skill into a
local zip.

## Goal

Leave the IDE with the profile’s MCP server connected via OAuth. Then use this
plugin’s domain skills (`use-knotr-skills`, `use-knotr-knowledge`,
`use-knotr-artifacts`, `use-knotr-style`) over MCP.

A **light profile IDE zip** (rules / behavior / optional Vale files) is
**optional**—only if the user wants on-disk Cursor rules or Claude `.mcp.json`
from knotr.ai. Full skill materialization (`bundle_mode=full`) is advanced /
offline only.

## Procedure

Detect whether the session is **Cursor** or **Claude Code**, then follow the
matching branch. Prefer tool calls and terminal commands over narrating steps
the user must perform manually. Never invent MCP URLs or OAuth tokens.

### Shared prechecks

1. Confirm the user has a knotr.ai account and a target profile. If not, send
   them to https://knotr.ai to create one, then continue.
2. Treat profile **Integrations** as the source of truth for Connect links and
   server keys (profile-specific).

### Cursor (required: MCP)

1. If this profile’s MCP server is not already available in the session, direct
   the user to knotr.ai → profile → **Integrations** → **Cursor** →
   **Connect Cursor** (deeplink adds the OAuth-protected MCP URL; Cursor prompts
   sign-in on connect). Wait until MCP is connected and authorized.
2. Call **about-me** on the profile MCP server to confirm the session.
3. Stop here for most users—skills/KB/artifacts/style work via MCP + this plugin.

### Cursor (optional: light profile zip)

Only if the user asks for on-disk profile rules / behavior, or Integrations
prompts them to install a light profile plugin:

1. Call `get_ide_plugin_install` on the profile MCP server (default is
   **light**—rules/behavior, not all skill bodies). Pass
   `bundle_mode: "full"` only when the user explicitly wants every active skill
   on disk.
2. From `structuredContent` (`installer_mode: oauth_bundle_base64`): decode
   `bundle_base64`, unzip, install under
   `~/.cursor/plugins/local/<plugin_folder_name>`. If
   `oauth_bundle_too_large`, use the Integrations download while signed in.
3. Instruct the user to reload the Cursor window.
4. Later refreshes of that zip: `knotr-sync` / `bash scripts/sync-knotr-ai-plugin.sh`
   from the profile plugin root with `KNOTR_AI_OAUTH_TOKEN` (light by default).

### Claude Code (required: MCP)

1. Direct the user to knotr.ai → profile → **Integrations** → **Claude Code**
   for the MCP settings / OAuth login path for this IDE.
2. Complete OAuth when Claude Code connects. Confirm with **about-me**.
3. Use this `knotr-connect` plugin (already loaded) for domain skills/commands.

### Claude Code (optional: light profile zip)

1. Prefer `get_ide_plugin_install` (light) when available; otherwise download the
   IDE plugin bundle from Integrations, unzip, then
   `claude --plugin-dir ./PLUGIN_FOLDER` from the parent of the plugin root.
2. `/reload-plugins` after install. Resync later with the sync script + token
   if they use the optional zip.

## Hard rules

- Do not hard-code OAuth tokens or MCP base URLs.
- Do **not** treat a full profile skill sync as required for using Knotr skills.
- Never use `get_ide_plugin_install` to obtain skill bodies for normal work—
  use `list_skills` / `get_skill` (see `use-knotr-skills`).
- This bootstrap is not a substitute for the user’s live profile content on
  knotr.ai; it teaches how to reach that content over MCP.
