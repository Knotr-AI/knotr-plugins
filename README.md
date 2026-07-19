# Knotr plugins

Official [Knotr](https://knotr.ai) plugins for **Cursor** and **Claude Code**.

## Plugins

| Plugin | Purpose |
|--------|---------|
| [`knotr-connect`](./knotr-connect) | Bootstrap: connect your Knotr profile (MCP + profile plugin). Complements in-app **Integrations**. |

## Equal paths

You can start in either place; both finish the same way:

1. **IDE first** — install **Knotr Connect** from the [Cursor Marketplace](https://cursor.com/marketplace) (or clone this repo / Claude `--plugin-dir`), then open knotr.ai → profile **Integrations** → Connect → install your **profile** plugin.
2. **App first** — knotr.ai → profile **Integrations** → **Connect Cursor** (or Claude Code setup) → install profile plugin. Optionally install this bootstrap from the Marketplace anytime for the connect skill/command.

Live skills and MCP credentials never live in this public repo. They come from your account via Integrations and the profile IDE bundle.

## Install (developers)

### Cursor

- Prefer: [Cursor Marketplace](https://cursor.com/marketplace) → search **Knotr Connect** (after listing).
- Or clone and load locally under `~/.cursor/plugins/local/` per [Cursor plugins docs](https://cursor.com/docs/plugins).

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
knotr-connect/                    # Bootstrap plugin
```

## Maintainers

See [PUBLISH.md](./PUBLISH.md). Keep skill/command copy aligned with knotr.ai Integrations UI (documented in the main app’s `docs/public-knotr-plugins.md`).

## License

[MIT](./LICENSE)
