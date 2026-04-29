---
applyTo: "**"
---

## Journal Protocol

**IMPORTANT: On your VERY FIRST response in every new session, before doing
anything else, run `journal projects` and ask the user which project to journal
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
- **Mandatory hourly re-journal:** on the **first user message of each new clock hour** (e.g., first message after 2:00 PM, first after 3:00 PM), you must write and push a new journal entry **before doing anything else in that response**. Treat this as a hard requirement, not a natural-stopping-point suggestion. If the current hour is later than the last journaled hour, journal first, then continue with the user's request.
- When the user says **"journal"** or **"log this"** — immediately write
  and push an entry covering work since the last entry (or session start).
  Do not wait for the next hour.
- At **end of session** if there's unjournaled work.

Even if the work is still ongoing, even if no code changed, and even if the user did not mention journaling, the first message in a new hour is still a journaling trigger.

### Backfilling historical sessions

If the user asks you to journal a session that predates journaling (i.e.,
the conversation already has history but no journal entries were made),
review the full conversation and create entries **bucketed by calendar day**
(Detroit time). Use one `journal push` per day, with the heading spanning
the first and last message timestamps of that day. This captures historical
work that would otherwise be lost.

### Choosing a project

On the first message of each session:

1. Run `journal projects` to get active project slugs.
2. Use the `vscode/askQuestion` tool to present them as a multiple-choice
   question. Sort alphabetically, but put your best guess for the current
   workspace/repo at the top. Include a "skip" option at the end.
3. If the user says **"skip"** or **"none"**, stop journaling for this session.
4. Any slug works — they can also type a new slug not on the list.
5. Remember the choice for the rest of the session.

### How to journal

Pipe a Markdown entry to the journal command:

```bash
journal push <project-slug> [--date YYYY-MM-DD] <<'ENTRY'
<your entry here>
ENTRY
```

The `--date` flag is optional and defaults to today (Detroit time). Use it
when backfilling historical sessions to place entries on the correct date.

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

- Only use h3 (`###`) or higher (`####`, `#####`) headings in entries.
  Never use h1 or h2 — those are reserved for the entry heading.
- Do not include Markdown separators (`---`) in entries — the CLI appends
  those automatically.
- Be specific: "discussed JWT vs session tokens for internal API; leaning JWT"
  not "discussed auth options."
- Capture design conversations and reasoning, not just code changes.
- Each entry should be understandable in isolation.
- Don't skip journaling because "nothing happened" — conversation is work.
- If the command fails, save the entry to `.journal-pending.md` locally
  and tell the user.
