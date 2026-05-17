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
- **Mandatory proactive re-journal after one hour:** if **more than 60 minutes have elapsed since your last `journal push` in this session**, you must write and push a new journal entry covering the work since that last entry **before doing anything else in your response**. This is the standing rule: the user should always be able to ask you to journal, but should never *have* to. Track your own last-push timestamp; do not wait for a clock-hour boundary, do not wait to be asked, and do not wait for a "natural stopping point." If you're past 60 minutes, journal first, then continue with the user's request.
- When the user says **"journal"** or **"log this"** — immediately write
  and push an entry covering work since the last entry (or session start).
  Do not wait for the 60-minute mark.
- At **end of session** if there's unjournaled work.

Even if the work is still ongoing, even if no code changed, and even if the user did not mention journaling, crossing the 60-minute mark since your last entry is still a journaling trigger. Conversation is work.

### Backfilling historical sessions

If the user explicitly asks you to journal a project/session and there is
clearly unjournaled work spanning prior Detroit calendar days, review the
full available conversation/work and create entries **bucketed by calendar
day**. Use one `journal push` per day, oldest first, so prior-day work lands
in the correct daily files instead of being collapsed into today.

This rule applies both to sessions that predate journaling and to later
catch-up requests where some work from prior day(s) never got journaled.
Use `--date YYYY-MM-DD` whenever you need to place an entry on a prior day.

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
when backfilling historical sessions or prior-day catch-up work to place
entries on the correct date.

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
- If a catch-up spans multiple Detroit dates, write multiple entries and push
  them separately with `--date`, oldest first.
- Don't skip journaling because "nothing happened" — conversation is work.
- If the command fails, save the entry to `.journal-pending.md` locally
  and tell the user.
