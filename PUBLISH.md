# Publishing Knotr plugins

## Version bumps

1. Update `version` in:
   - `.cursor-plugin/marketplace.json` (metadata + plugin entry)
   - `.claude-plugin/marketplace.json`
   - `knotr-connect/.cursor-plugin/plugin.json`
   - `knotr-connect/.claude-plugin/plugin.json`
   - `knotr/plugin.json` (ChatGPT and Codex directory package)
2. Rebuild the directory ZIP after a `knotr/` change: `./scripts/zip-openai-plugin.sh`. The script reads the version from `knotr/plugin.json`.
3. Commit and push to `main` on [Knotr-AI/knotr-plugins](https://github.com/Knotr-AI/knotr-plugins).

## Distribution

1. Confirm manifests and frontmatter are valid ([plugins reference](https://cursor.com/docs/reference/plugins)).
2. Test locally (`~/.cursor/plugins/local/` or a team marketplace import of this repo): install the plugin, authorize MCP at `https://knotr.ai/mcp/v1`, call `about-me`, and confirm the domain skills are still present.
3. Push to `main` on [Knotr-AI/knotr-plugins](https://github.com/Knotr-AI/knotr-plugins).

## ChatGPT and Codex plugin directory

The upload root is [`knotr/`](./knotr), not the git repository root and not `knotr-connect/`. Cursor still reads `knotr-connect/mcp.json`. Claude Code still reads `knotr-connect/.mcp.json`. Those files stay in their existing shapes.

`knotr/skills/` and `knotr/assets/logo.png` are symlinks to `knotr-connect`. Change the domain skills in `knotr-connect/skills/`.

From the repository root:

```bash
./scripts/zip-openai-plugin.sh
```

This writes `dist/knotr-plugin-<version>.zip`. The ZIP root contains `plugin.json`, `mcp.json`, `skills/`, and `assets/logo.png`. Symlinks are expanded to real files. `knotr/README.md` is left out. The script refuses to pack `.app.json`, `apps/`, `hooks/`, reviewer credential fields, or a `demo_recording_url`.

Upload the ZIP on the existing plugin at [platform.openai.com/plugins](https://platform.openai.com/plugins) (**Upload plugin to make changes**). Do not commit the ZIP or any token.

`review.demo_recording_url` is omitted. Add a real walkthrough URL in the dashboard, or in a later package, when a recording exists. Do not invent one.

Still enter these in the dashboard. They are not in the ZIP:

- Reviewer credentials and sign-in instructions (dedicated test account, login URL, sample data). The form rejects `test_credentials` and `reviewer_instructions` in package metadata.
- The video walkthrough URL, until a recording exists.
- MCP connect for `https://knotr.ai/mcp/v1`: domain-verification token and OAuth. Only one MCP server can be connected.
- Verified developer identity for the directory publisher name.
- Submit-for-review policy attestations.

## Cursor Marketplace

Submit the public repo at [cursor.com/marketplace/publish](https://cursor.com/marketplace/publish).

## Optional community listing

- [cursor.directory/plugins/new](https://cursor.directory/plugins/new) — paste the GitHub repo URL.

## Keep copy in sync

The bundled MCP URL is `https://knotr.ai/mcp/v1` (OAuth at connect time; no tokens in this repo). When that URL or the install flow changes, update:

- `knotr-connect/mcp.json` (Cursor)
- `knotr-connect/.mcp.json` (Claude Code)
- `knotr/mcp.json` (ChatGPT and Codex)
- `knotr-connect/commands/connect-knotr.md`
- Root and plugin READMEs

Domain skills stay: `use-knotr-skills`, `use-knotr-knowledge`, `use-knotr-artifacts`, `use-knotr-style`.

See the main product repo: `docs/public-knotr-plugins.md`.
