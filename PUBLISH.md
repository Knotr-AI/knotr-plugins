# Publishing Knotr plugins

## Version bumps

1. Update `version` in:
   - `.cursor-plugin/marketplace.json` (metadata + plugin entry)
   - `.claude-plugin/marketplace.json`
   - `knotr-connect/.cursor-plugin/plugin.json`
   - `knotr-connect/.claude-plugin/plugin.json`
2. Commit and push to `main` on [Knotr-AI/knotr-plugins](https://github.com/Knotr-AI/knotr-plugins).

The ChatGPT and Codex package is versioned on its own in `knotr/plugin.json`. Do not bump the Cursor or Claude manifests when only that package changes. `./scripts/zip-openai-plugin.sh` names the ZIP from `knotr/plugin.json`.

## Distribution

1. Confirm manifests and frontmatter are valid ([plugins reference](https://cursor.com/docs/reference/plugins)).
2. Test locally (`~/.cursor/plugins/local/` or a team marketplace import of this repo): install the plugin, authorize MCP at `https://knotr.ai/mcp/v1`, call `about-me`, and confirm the domain skills are still present.
3. Push to `main` on [Knotr-AI/knotr-plugins](https://github.com/Knotr-AI/knotr-plugins).

## ChatGPT and Codex plugin directory

The upload root is [`knotr/`](./knotr), not the git repository root and not `knotr-connect/`. Cursor still reads `knotr-connect/mcp.json`. Claude Code still reads `knotr-connect/.mcp.json`. Those files stay in their existing shapes.

`knotr/skills/` and `knotr/assets/logo.png` are symlinks to `knotr-connect`. Change the domain skills in `knotr-connect/skills/`.

From the repository root:

OpenAI requires `review.demo_recording_url` in the uploaded package before submit-for-review. Keep that URL (and any other non-public package fields) out of git:

```bash
cp knotr/plugin.local.json.example knotr/plugin.local.json
# edit demo_recording_url to a reviewer-accessible walkthrough
./scripts/zip-openai-plugin.sh
```

`knotr/plugin.local.json` is gitignored. The zip script deep-merges it into the committed `knotr/plugin.json` only in the staging copy. You can also pass a one-off URL:

```bash
KNOTR_DEMO_RECORDING_URL='https://…' ./scripts/zip-openai-plugin.sh
```

This writes `dist/knotr-plugin-<version>.zip`. The ZIP root contains `plugin.json`, `mcp.json`, `skills/`, and `assets/logo.png`. Symlinks are expanded to real files. `knotr/README.md` and `plugin.local.json*` are left out. The script refuses to pack `.app.json`, `apps/`, `hooks/`, `test_credentials`, or `reviewer_instructions`.

Upload the ZIP on the existing plugin at [platform.openai.com/plugins](https://platform.openai.com/plugins) (**Upload plugin to make changes**). Do not commit the ZIP, `plugin.local.json`, or any token.

Still enter these in the dashboard. They are not allowed in the ZIP:

- Reviewer credentials and sign-in instructions (dedicated test account, login URL, sample data). The form rejects `test_credentials` and `reviewer_instructions` in package metadata.
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
