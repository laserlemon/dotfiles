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
- When the user says **"journal"** or **"log this"** — immediately write
  and push an entry covering work since the last entry (or session start).
  Do not wait for the next hour.
- At **end of session** if there's unjournaled work.

### Choosing a project

On the first message of each session:

1. Run `journal list` to get active project slugs.
2. Use the `vscode/askQuestion` tool to present them as a multiple-choice
   question. Sort alphabetically, but put your best guess for the current
   workspace/repo at the top. Include a "skip" option at the end.
3. If the user says **"skip"** or **"none"**, stop journaling for this session.
4. Any slug works — they can also type a new slug not on the list.
5. Remember the choice for the rest of the session.

### How to journal

Pipe a Markdown entry to the journal command:

```bash
journal push <project-slug> <<'ENTRY'
<your entry here>
ENTRY
```

### Entry format

The entry heading is the only prescribed format:

```
## <emoji> H:MM am - H:MM pm
```

- All times are Detroit time (America/Detroit).
- Use 12-hour format, lowercase am/pm, no leading zeros.
- Example: `## 🦊 1:30 pm - 2:45 pm`
- If running in a GitHub Codespace, append the codespace name:
  `## 🦊 1:30 pm - 2:45 pm · curly-space-disco`
  (available via the `CODESPACE_NAME` environment variable)

**The body below the heading is freeform.** Structure it however best
captures the session's context. The goal is to preserve as much context
from the conversation as possible, as concisely as possible. Decisions,
reasoning, code changes, open questions — whatever matters. Use the full
range of Markdown (prose, bullets, tables, code blocks, links) as
appropriate. There is no required template.

### Rules

- Be specific: "discussed JWT vs session tokens for internal API; leaning JWT"
  not "discussed auth options."
- Capture design conversations and reasoning, not just code changes.
- Each entry should be understandable in isolation.
- Don't skip journaling because "nothing happened" — conversation is work.
- If the command fails, save the entry to `.journal-pending.md` locally
  and tell the user.
