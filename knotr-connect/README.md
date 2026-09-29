# Knotr Connect

[Knotr](https://knotr.ai) MCP plus domain workflows for Cursor and Claude Code.

Installing this plugin registers the remote MCP server at `https://knotr.ai/mcp/v1`. Authorize it when your editor connects (OAuth). No tokens or credentials are stored in this repo. Profile skills, knowledgebases, artifacts, and style guides stay on knotr.ai and are used live over MCP.

## Install

1. Install **Knotr Connect** from this repository (or a marketplace that tracks it).
2. Authorize the bundled MCP server at `https://knotr.ai/mcp/v1` when prompted.
3. Call **about-me**. If that tool is missing, finish the authorize prompt and retry.

You can also connect the same MCP URL from [knotr.ai](https://knotr.ai) → profile **Integrations**, then install this plugin for the domain skills and commands below.

## What this plugin runs and sends

- **Runs:** remote HTTP MCP only (no local servers, no package launchers, no hooks).
- **Connects to:** `https://knotr.ai/mcp/v1` (owned by Knotr AI, LLC).
- **Sends:** OAuth-authenticated tool arguments you approve in chat (for example profile reads, skill/knowledge/artifact writes). Claude or Cursor holds the OAuth token; this plugin never embeds secrets.
- **Does not:** read undeclared env vars, phone home to other hosts, or ship compiled binaries.

Privacy and data retention: [https://knotr.ai/legal/privacy](https://knotr.ai/legal/privacy). Terms: [https://knotr.ai/legal/terms](https://knotr.ai/legal/terms). Support: [https://knotr.ai/support](https://knotr.ai/support) or `support@knotr.ai`.

## What’s inside

| Kind | Name | Role |
|------|------|------|
| MCP | `knotr` | Remote HTTP server at `https://knotr.ai/mcp/v1` |
| Skill | `use-knotr-skills` | Discover/fetch/run skills; write policy |
| Skill | `use-knotr-knowledge` | Search/read/write knowledgebases |
| Skill | `use-knotr-artifacts` | Save durable Artifacts (canvas/docs) |
| Skill | `use-knotr-style` | `check_style` lint loop before shipping copy |
| Command | `connect-knotr` | If MCP looks disconnected, authorize the bundled server and verify with `about-me` |
| Command | `knotr-save-skill` | Explicit skill persist |
| Command | `knotr-save-artifact` | Explicit artifact persist |
| Command | `knotr-check-style` | Explicit style lint |

## Example prompts

- Call **about-me** and summarize how you should respond for this profile.
- Search my Knotr knowledgebases for onboarding docs and summarize what you find.
- Save this workflow as a draft Knotr skill named Meeting Follow-up.

## Links

- Product: [https://knotr.ai](https://knotr.ai)
- MCP: [https://knotr.ai/mcp/v1](https://knotr.ai/mcp/v1)
- Privacy: [https://knotr.ai/legal/privacy](https://knotr.ai/legal/privacy)
- Support: [https://knotr.ai/support](https://knotr.ai/support)
- Marketplace repo: [https://github.com/Knotr-AI/knotr-plugins](https://github.com/Knotr-AI/knotr-plugins)

## License

[MIT](./LICENSE)
