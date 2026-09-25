---
name: knotr-save-skill
description: >-
  Persist a reusable workflow to the connected Knotr profile as a skill via
  create_or_update_skill. Use when the user wants to save or update a Knotr
  skill from this session.
---

# Save skill to Knotr

1. Confirm the profile MCP server is connected and the token can use
   `mcp_write`.
2. Summarize the workflow to save. Confirm name and create vs update with the
   user if unclear.
3. Call `list_skills` (optional query)—reuse `skill_id` when updating; do not
   duplicate.
4. Choose `intended_use` (`skill` | `command` | `subagent`). Prefer
   `status: draft` on create unless the user wants `active`.
5. Call `create_or_update_skill` with clean markdown (no secrets or
   machine-only paths). Optional `reference_document_ids` for owned docs.
6. Report the skill UUID. It is live via MCP immediately—no full IDE skill
   sync or reload required for other MCP clients.
