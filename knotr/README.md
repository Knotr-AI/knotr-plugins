# Knotr for ChatGPT and Codex

Portable [Agent Plugins](https://agent-plugins.org/schemas/1.0.0/plugin.schema.json) package for the ChatGPT and Codex plugin directory. Zip this folder and upload it. Do not zip the repository root.

Cursor and Claude Code keep using [`knotr-connect`](../knotr-connect). This package does not replace those manifests.

## What is in the upload

| Path | Role |
|------|------|
| `plugin.json` | Identity, OpenAI listing metadata, and review cases |
| `mcp.json` | Remote MCP at `https://knotr.ai/mcp/v1` (`streamable-http`) |
| `skills/` | The four domain skills from `knotr-connect` |
| `assets/logo.png` | Official solid 1:1 logo (white K on navy) |

`skills/` and `assets/logo.png` are symlinks to `knotr-connect`. Edit the skills there. There is no second skill set.

The package has no `.app.json`, no `apps` mapping, no hooks, and no reviewer credentials. Put the walkthrough URL in gitignored `plugin.local.json` (see `plugin.local.json.example`); the zip script merges it at pack time.

## Zip

From the repository root:

```bash
cp knotr/plugin.local.json.example knotr/plugin.local.json
# set review.demo_recording_url
./scripts/zip-openai-plugin.sh
```

That writes `dist/knotr-plugin-1.1.1.zip`. The archive root is the plugin (`plugin.json` at the top), with symlinks expanded to real files. The script leaves this README and `plugin.local.json*` out of the ZIP. It still rejects `test_credentials` and `reviewer_instructions` (dashboard-only).

Upload that ZIP at [platform.openai.com/plugins](https://platform.openai.com/plugins) with **Upload plugin to make changes** on the migrated plugin. See [PUBLISH.md](../PUBLISH.md).
