# Publishing Knotr plugins

## Version bumps

1. Update `version` in:
   - `.cursor-plugin/marketplace.json` (metadata + plugin entry)
   - `.claude-plugin/marketplace.json`
   - `knotr-connect/.cursor-plugin/plugin.json`
   - `knotr-connect/.claude-plugin/plugin.json`
2. Commit and push to `main` on [Knotr-AI/knotr-plugins](https://github.com/Knotr-AI/knotr-plugins).

## Cursor Marketplace

1. Confirm manifests and frontmatter are valid ([plugins reference](https://cursor.com/docs/reference/plugins)).
2. Test locally (`~/.cursor/plugins/local/` or team marketplace import of this repo).
3. Submit or update at [cursor.com/marketplace/publish](https://cursor.com/marketplace/publish) with repo URL `https://github.com/Knotr-AI/knotr-plugins` and logo `knotr-connect/assets/logo.svg`.

## Optional community listing

- [cursor.directory/plugins/new](https://cursor.directory/plugins/new) — paste the GitHub repo URL.

## Keep copy in sync

When Integrations steps change in the Rails app (Cursor / Claude Code platforms), update:

- `knotr-connect/skills/connect-knotr-mcp/SKILL.md`
- `knotr-connect/commands/connect-knotr.md`
- Root and plugin READMEs if steps are summarized there

See the main product repo: `docs/public-knotr-plugins.md`.
