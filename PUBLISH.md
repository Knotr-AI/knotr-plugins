# Publishing Knotr plugins

## Version bumps

1. Update `version` in:
   - `.cursor-plugin/marketplace.json` (metadata + plugin entry)
   - `.claude-plugin/marketplace.json`
   - `knotr-connect/.cursor-plugin/plugin.json`
   - `knotr-connect/.claude-plugin/plugin.json`
2. Commit and push to `main` on [Knotr-AI/knotr-plugins](https://github.com/Knotr-AI/knotr-plugins).

## Distribution

1. Confirm manifests and frontmatter are valid ([plugins reference](https://cursor.com/docs/reference/plugins)).
2. Test locally (`~/.cursor/plugins/local/` or a team marketplace import of this repo): install the plugin, authorize MCP at `https://knotr.ai/mcp/v1`, call `about-me`, and confirm the domain skills are still present.
3. Push to `main` on [Knotr-AI/knotr-plugins](https://github.com/Knotr-AI/knotr-plugins).

## Cursor Marketplace

Submit the public repo at [cursor.com/marketplace/publish](https://cursor.com/marketplace/publish).

## Optional community listing

- [cursor.directory/plugins/new](https://cursor.directory/plugins/new) — paste the GitHub repo URL.

## Keep copy in sync

The bundled MCP URL is `https://knotr.ai/mcp/v1` (OAuth at connect time; no tokens in this repo). When that URL or the install flow changes, update:

- `knotr-connect/mcp.json` (Cursor)
- `knotr-connect/.mcp.json` (Claude Code)
- `knotr-connect/commands/connect-knotr.md`
- Root and plugin READMEs

Domain skills stay: `use-knotr-skills`, `use-knotr-knowledge`, `use-knotr-artifacts`, `use-knotr-style`.

See the main product repo: `docs/public-knotr-plugins.md`.
