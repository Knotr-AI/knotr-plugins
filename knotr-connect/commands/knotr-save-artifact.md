---
name: knotr-save-artifact
description: >-
  Persist a durable shareable output to Knotr as an Artifact via
  create_or_update_artifact. Use when the user wants to save a canvas, doc, or
  page and get a present_url.
---

# Save artifact to Knotr

1. Confirm profile MCP is connected (`mcp_write`).
2. Map the source (Cursor canvas → `page`+`tsx`; long markdown → `document`;
   static HTML → `page`+`html`; interactive Claude/Gemini → rewrite to
   `page`+`tsx`). Call `list_artifact_types` if unsure.
3. Call `create_or_update_artifact` with title, `artifact_type`,
   `content_format`, body, and optional `source_kind` / `collection_ids`.
4. Paste **`present_url`** in chat. Mention `hosted_url` / `raw_url` if useful.
5. Do not save one-off chat notes here—use a knowledgebase document instead.
   Do not save reusable procedures here—use knotr-save-skill.
