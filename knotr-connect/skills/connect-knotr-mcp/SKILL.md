---
name: connect-knotr-mcp
description: >-
  Connect a Knotr profile to Cursor or Claude Code (OAuth MCP + profile plugin).
  Use when the user wants personal context, Knotr skills, knowledgebases, or a
  profile MCP server in their IDE. Execute the install procedure; do not only
  explain Integrations to the user.
---

# Connect Knotr MCP

This marketplace plugin is a **bootstrap**. It does not replace the **profile
plugin** (skills, rules, commands synced from knotr.ai). Live MCP is
OAuth-protected; credentials stay on the user’s account / IDE session.

## Goal

Leave the IDE with (1) the profile’s MCP server connected via OAuth and (2) the
profile plugin installed locally, then reload.

## Procedure

Detect whether the session is **Cursor** or **Claude Code**, then follow the
matching branch. Prefer tool calls and terminal commands over narrating steps
the user must perform manually. Never invent MCP URLs or OAuth tokens.

### Shared prechecks

1. Confirm the user has a knotr.ai account and a target profile. If not, send
   them to https://knotr.ai to create one, then continue.
2. Treat profile **Integrations** as the source of truth for Connect links and
   the exact install prompt (server key is profile-specific).

### Cursor

1. If this profile’s MCP server is not already available in the session, direct
   the user to knotr.ai → profile → **Integrations** → **Cursor** →
   **Connect Cursor** (deeplink adds the OAuth-protected MCP URL; Cursor prompts
   sign-in on connect). Wait until MCP is connected and authorized before
   installing.
2. Call `get_ide_plugin_install` on the profile MCP server with empty
   arguments. The server key matches Integrations (do not guess another
   server name).
3. From the tool’s `structuredContent` (`installer_mode:
   oauth_bundle_base64`): decode `bundle_base64` to a zip, unzip it, then
   symlink or copy the plugin root to
   `~/.cursor/plugins/local/<plugin_folder_name>` (folder name is in
   structuredContent). If `installer_mode` is `oauth_bundle_too_large` or
   install fails, fall back to the Integrations IDE bundle download while
   signed in.
4. Instruct the user to reload the Cursor window.
5. Later refreshes: invoke `knotr-sync` from the profile plugin, or run
   `bash scripts/sync-knotr-ai-plugin.sh` from the profile plugin root with a
   current OAuth access token in `KNOTR_AI_OAUTH_TOKEN` (or the env var named
   in `plugin-sync.json` as `oauth_token_env_var`), then reload.

Optional only if the user asks: download the IDE bundle or Cursor rule from
Integrations Advanced options.

### Claude Code

1. If MCP / the profile plugin is not set up, direct the user to knotr.ai →
   profile → **Integrations** → **Claude Code** → download the **IDE plugin
   bundle**, unzip it, then from the parent of the plugin root run
   `claude --plugin-dir ./PLUGIN_FOLDER` (see the bundle README).
2. Complete OAuth sign-in when Claude Code connects to the MCP server listed in
   the bundle’s `.mcp.json` / `plugin-sync.json`.
3. Run `/reload-plugins` after install or sync.
4. Resync later with `bash scripts/sync-knotr-ai-plugin.sh` from the plugin
   root (requires `KNOTR_AI_OAUTH_TOKEN` / `oauth_token_env_var`).
5. At session start, call MCP `about-me` for owner context and assistant
   behavior. Invoke profile skills as `/MANIFEST_NAME:skill-folder-name`
   (manifest name matches the MCP server key).

If `get_ide_plugin_install` is available on the profile MCP server in this
environment, prefer that OAuth base64 install path over a manual zip when it
fits the user’s setup.

## Hard rules

- Do not treat this bootstrap as the user’s profile skill pack.
- Do not hard-code OAuth tokens or MCP base URLs.
- After MCP is connected, install the **profile** plugin — Connect alone is
  incomplete.
