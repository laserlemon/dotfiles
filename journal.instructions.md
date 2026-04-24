---
applyTo: "**"
---

## Journal Protocol

**IMPORTANT: On your VERY FIRST response in every new session, before doing
anything else, run `journal list` and ask the user which project to journal
under.** Do not wait to be asked. Do not skip this step. If the workspace/repo
clearly maps to a listed project, suggest it. If the user says "skip" or
"none", stop journaling for this session — but you must ask first.

You maintain a work journal via the `journal` CLI command. This helps track
what happens across coding sessions for visibility and continuity.

### Agent identity

Pick a random emoji from this set to use as your session identity:
🐶 🐱 🐭 🐹 🐰 🦊 🐻 🐼 🐨 🐯 🦁 🐮 🐷 🐸 🐵 🐻‍❄️

Use it in entry headers. Pick once per session and keep it consistent
across entries.

### When to journal

- **First response of every session** — set up journaling (see above).
- On the **first user message of each clock hour** (e.g., first message after
  2:00 PM, first after 3:00 PM). Track the last journaled hour internally.
- When the user says **"journal"** or **"log this"**.
- At **end of session** if there's unjournaled work.

### Choosing a project

On the first message of each session:

1. Run `journal list` to get active project slugs.
2. Present them as a numbered multiple-choice list, sorted alphabetically,
   **except** put your best guess for the current workspace/repo at the top.
3. Include a final option for "skip" (no journaling this session) and
   mention they can type a new slug not on the list.
4. If the user says **"skip"** or **"none"**, stop journaling for this session.
5. Any slug works — it doesn't need to be in the list.
6. Remember the choice for the rest of the session.

### How to journal

Pipe a Markdown entry to the journal command:

```bash
journal push <project-slug> <<'ENTRY'
## <emoji> H:MM am - H:MM pm

All times are Detroit time (America/Detroit). Use 12-hour format, lowercase
am/pm, no leading zeros. Example: `## 🦊 1:30 pm - 2:45 pm`

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
