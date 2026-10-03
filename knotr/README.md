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

The package has no `.app.json`, no `apps` mapping, no hooks, and no reviewer credentials. `review.demo_recording_url` is omitted until a real walkthrough exists.

## Zip

From the repository root:

```bash
./scripts/zip-openai-plugin.sh
```

That writes `dist/knotr-plugin-1.1.1.zip`. The archive root is the plugin (`plugin.json` at the top), with symlinks expanded to real files. The script leaves this README out of the ZIP. It does not read or embed secrets.

Upload that ZIP at [platform.openai.com/plugins](https://platform.openai.com/plugins) with **Upload plugin to make changes** on the migrated plugin. See [PUBLISH.md](../PUBLISH.md).
