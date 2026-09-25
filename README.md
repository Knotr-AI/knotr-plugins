# Knotr plugins

Official [Knotr](https://knotr.ai) plugins for **Cursor** and **Claude Code**.

## Plugins

| Plugin | Purpose |
|--------|---------|
| [`knotr-connect`](./knotr-connect) | Connect OAuth MCP + domain skills (skills, knowledge, artifacts, style). Complements in-app **Integrations**. |

## Equal paths (humans)

You can start in either place; both finish the same way:

1. **IDE first** — clone this repo and load **Knotr Connect** locally (Cursor) or via Claude `--plugin-dir`, then open knotr.ai → profile **Integrations** → Connect MCP.
2. **App first** — knotr.ai → profile **Integrations** → **Connect Cursor** (or Claude Code setup). Install this bootstrap anytime for domain skills/commands.

The `knotr-connect` skills and commands are written for the **agent to execute**, not as a human how-to. Human path explanation stays in this README and on knotr.ai Integrations.

Live profile content and OAuth credentials never live in this public repo. They come from your account via Integrations (OAuth MCP). Optional light profile IDE zips (rules/behavior) are separate; bulk skill sync is advanced only.

## Install (developers)

### Cursor

Clone this repo and load the plugin locally under `~/.cursor/plugins/local/` per [Cursor plugins docs](https://cursor.com/docs/plugins):

```bash
git clone https://github.com/Knotr-AI/knotr-plugins.git
# Then point Cursor at knotr-plugins/knotr-connect (or the repo marketplace manifest)
```

### Claude Code

```bash
git clone https://github.com/Knotr-AI/knotr-plugins.git
claude --plugin-dir ./knotr-plugins/knotr-connect
```

Or add this repo as a marketplace that lists `knotr-connect` via `.claude-plugin/marketplace.json`.

### Import into Knotr

In the Knotr app: **Skill marketplaces** → add GitHub repo `Knotr-AI/knotr-plugins` → sync. Imports draft skills from this marketplace (bootstrap content only).

## Layout

```text
.cursor-plugin/marketplace.json   # Cursor multi-plugin marketplace
.claude-plugin/marketplace.json   # Claude Code + Knotr importer
knotr-connect/                    # Bootstrap + domain workflow plugin
```

## Maintainers

See [PUBLISH.md](./PUBLISH.md). Keep skill/command copy aligned with knotr.ai Integrations UI (documented in the main app’s `docs/public-knotr-plugins.md`).

## License

[MIT](./LICENSE)
