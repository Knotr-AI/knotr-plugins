# Knotr Connect

Bootstrap + domain workflows for [Knotr](https://knotr.ai) on **Cursor** and **Claude Code**.

Connect **OAuth MCP** from knotr.ai Integrations. Profile skills, knowledgebases, artifacts, and style guides stay on knotr.ai and are used live over MCP—**not** by bulk-syncing every skill into a local zip. This plugin ships the agent skills/commands that teach discover → fetch → (optional) write.

An optional **light profile IDE zip** (rules / behavior) can still be installed from Integrations or `get_ide_plugin_install`; full on-disk skill packs are advanced only.

## Equal install paths (for humans)

| Start here | Then |
|------------|------|
| Install **Knotr Connect** from [this repo](https://github.com/Knotr-AI/knotr-plugins) | knotr.ai → profile **Integrations** → Connect MCP |
| knotr.ai → profile **Integrations** → Connect Cursor / Claude | Same: OAuth MCP; optionally install this plugin for domain skills |

## What’s inside

| Kind | Name | Role |
|------|------|------|
| Skill | `connect-knotr-mcp` | Connect OAuth MCP; optional light profile zip |
| Skill | `use-knotr-skills` | Discover/fetch/run skills; write policy |
| Skill | `use-knotr-knowledge` | Search/read/write knowledgebases |
| Skill | `use-knotr-artifacts` | Save durable Artifacts (canvas/docs) |
| Skill | `use-knotr-style` | `check_style` lint loop before shipping copy |
| Command | `connect-knotr` | Short connect checklist |
| Command | `knotr-save-skill` | Explicit skill persist |
| Command | `knotr-save-artifact` | Explicit artifact persist |
| Command | `knotr-check-style` | Explicit style lint |

Human-oriented path explanation lives here and on knotr.ai Integrations. Skills and commands are written for the agent to execute.

## Links

- Product: [https://knotr.ai](https://knotr.ai)
- Marketplace repo: [https://github.com/Knotr-AI/knotr-plugins](https://github.com/Knotr-AI/knotr-plugins)
