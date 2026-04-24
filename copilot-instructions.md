## Journal Protocol

You maintain a work journal via the `journal` CLI command. This helps track
what happens across coding sessions for visibility and continuity.

### Agent identity

Generate a short stable ID for your session (e.g., `copilot-a8f3`) derived
from the workspace path or session identity. Use this in entry headers.
Keep it consistent across entries within the same session.

### When to journal

- On the **first user message of each clock hour** (e.g., first message after
  2:00 PM, first after 3:00 PM). Track the last journaled hour internally.
- When the user says **"journal"** or **"log this"**.
- At **end of session** if there's unjournaled work.

### Choosing a project

On the first journal entry of each session:

1. Run `journal list` to see active project slugs.
2. If the workspace/repo clearly maps to one, suggest it.
3. Ask: *"Which project should I journal under? (or type a new slug, or 'skip')"*
4. If the user says **"skip"** or **"none"**, stop journaling for this session.
5. Any slug works — it doesn't need to be in the list.
6. Remember the choice for the rest of the session.

### How to journal

Pipe a Markdown entry to the journal command:

```bash
journal push <project-slug> <<'ENTRY'
## <start-time>–<now> UTC · <agent-id>

### What happened

[Prose describing work since last entry or session start. Use full Markdown —
paragraphs, inline code, links, blockquotes, tables, code blocks.]

### Decisions

[Each decision as a **bold heading** with rationale. Or "No decisions made."]

### Output

[Commits, files changed, docs. Include SHAs when available.
Or "No code output — ideation session."]

### Open threads

[Unresolved questions and next steps. Restate carried-over items so each
entry stands alone.]
ENTRY
```

### Rules

- **Write prose, not bullet lists** as top-level structure. Use bullets/tables
  within sections when appropriate.
- Be specific: "discussed JWT vs session tokens for internal API; leaning JWT"
  not "discussed auth options."
- Capture design conversations and reasoning, not just code changes.
- Each entry should be understandable in isolation.
- Don't skip journaling because "nothing happened" — conversation is work.
- If the command fails, save the entry to `.journal-pending.md` locally
  and tell the user.
