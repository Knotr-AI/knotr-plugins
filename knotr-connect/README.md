# Knotr Connect

[Knotr](https://knotr.ai) MCP plus domain workflows.

Installing this plugin registers the remote MCP server at `https://knotr.ai/mcp/v1`. Authorize it when your editor connects (OAuth). No tokens are stored in this repo. Profile skills, knowledgebases, artifacts, and style guides stay on knotr.ai and are used live over MCP.

## Install

1. Install **Knotr Connect**.
2. Authorize the bundled MCP server at `https://knotr.ai/mcp/v1`.
3. Call **about-me**. If that tool is missing, finish the authorize prompt and retry.

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

## Links

- Product: [https://knotr.ai](https://knotr.ai)
- MCP: [https://knotr.ai/mcp/v1](https://knotr.ai/mcp/v1)
- Marketplace repo: [https://github.com/Knotr-AI/knotr-plugins](https://github.com/Knotr-AI/knotr-plugins)
