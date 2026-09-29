# Knotr plugins

Official [Knotr](https://knotr.ai) plugins for **Cursor** and **Claude Code**.

## Plugins

| Plugin | Purpose |
|--------|---------|
| [`knotr-connect`](./knotr-connect) | Bundles the Knotr MCP server and domain skills (skills, knowledge, artifacts, style). |

## Install

Install **Knotr Connect**, then authorize the bundled MCP server. OAuth runs at connect time. This repo does not contain tokens.

MCP URL: `https://knotr.ai/mcp/v1`

### Cursor

Clone this repo and load the plugin locally under `~/.cursor/plugins/local/` per [Cursor plugins docs](https://cursor.com/docs/plugins), or install it from a marketplace that tracks this repo:

```bash
git clone https://github.com/Knotr-AI/knotr-plugins.git
# Then point Cursor at knotr-plugins/knotr-connect (or the repo marketplace manifest)
```

Cursor discovers `knotr-connect/mcp.json` and prompts you to authorize `https://knotr.ai/mcp/v1`. Call **about-me** to confirm the session.

### Claude Code

```bash
git clone https://github.com/Knotr-AI/knotr-plugins.git
claude --plugin-dir ./knotr-plugins/knotr-connect
```

Or add this repo as a marketplace that lists `knotr-connect` via `.claude-plugin/marketplace.json`.

Claude Code loads `knotr-connect/.mcp.json` (HTTP, same URL). Authorize when prompted, then call **about-me**.

### Domain skills

After MCP is authorized, these skills stay in the plugin:

- `use-knotr-skills`
- `use-knotr-knowledge`
- `use-knotr-artifacts`
- `use-knotr-style`

### Import into Knotr

In the Knotr app: **Skill marketplaces** → add GitHub repo `Knotr-AI/knotr-plugins` → sync. Imports draft skills from this marketplace.

## Layout

```text
.cursor-plugin/marketplace.json   # Cursor multi-plugin marketplace
.claude-plugin/marketplace.json   # Claude Code + Knotr importer
knotr-connect/                    # MCP config + domain skills
knotr-connect/mcp.json            # Cursor remote MCP (https://knotr.ai/mcp/v1)
knotr-connect/.mcp.json           # Claude Code remote MCP (same URL)
```

## Privacy and support

This repo only ships plugin config and skills. Profile data, knowledgebases, artifacts, and OAuth tokens live on knotr.ai (or in your client), not in this repository.

- Privacy: [https://knotr.ai/legal/privacy](https://knotr.ai/legal/privacy)
- Terms: [https://knotr.ai/legal/terms](https://knotr.ai/legal/terms)
- Support: [https://knotr.ai/support](https://knotr.ai/support) · `support@knotr.ai`
- Product: [https://knotr.ai](https://knotr.ai)

Plugin-level disclosure (what MCP runs and sends): [`knotr-connect/README.md`](./knotr-connect/README.md).

## Maintainers

See [PUBLISH.md](./PUBLISH.md).

## License

[MIT](./LICENSE)
