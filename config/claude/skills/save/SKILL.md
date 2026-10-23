---
name: save
description: Capture the CURRENT conversation/insight/decision and file it into the apo-brain knowledge vault as a structured note, linked to the relevant project. Use on "/save", "save this", "save this conversation", "file this", "save to the brain/vault", "keep this", "remember this in the vault". Works from ANY project or working directory — always writes to the apo-brain vault by absolute path.
---

# save — file this conversation into the apo-brain vault (from anywhere)

**Global skill.** Runs in any conversation, regardless of working directory, and always stores into the apo-brain vault. Most saves attach to a project.

**Vault:** `~/code/personal/apo-brain` (call it `VAULT`). If the vault ever moves, update this one path.

## Steps

1. **Load conventions (source of truth).** Read `VAULT/AGENTS.md` — especially §"Type-specific frontmatter → **note**", §**SAVE**, §**Provenance**, §"index.md & log.md rules" — and `VAULT/index.md` (for the existing **Projects** list). Follow the schema; do not duplicate its rules here.
2. **Worth saving?** Apply the skip test: skip mechanical Q&A, setup already documented, throwaway debugging with no lasting insight. If it's thin, say so and confirm before filing.
3. **Pick the project.** Infer the relevant project from the conversation (and the current repo / cwd if it maps to a known project). If unclear, ASK — offer the Projects listed in `VAULT/index.md`. If none fits, offer to create a stub `VAULT/projects/<slug>.md` or to file as an unlinked note.
4. **Name + extract.** Short kebab title. Rewrite the valuable content in **declarative present tense** ("X works by Y", not "the user asked…"). This is conversation-derived: tag any external/factual claim per §Provenance — `[model]` for unverified prior knowledge, a web footnote `[^wN]` if you checked it. Never present a guess as fact.
5. **Write the note** with the `Write` tool at the absolute path `VAULT/notes/YYYY-MM-DD-<slug>.md`. Frontmatter: `type: note`, `note_kind: conversation|decision|idea|braindump`, `created`, `updated`, `tags`; body must `[[link]]` the project + any entities/concepts mentioned (linking a not-yet-existing page is fine). If a near-duplicate note exists, UPDATE it instead of duplicating.
6. **Link the project.** Open `VAULT/projects/<project>.md` and add a pointer: a newest-first line under **## Iterations**, or — if a decision was made — a dated line under **## Decision log** (`- [YYYY-MM-DD] decision — rationale`). Bump that page's `updated:`.
7. **Catalog + log.** Add the note under the **## Notes** section of `VAULT/index.md`. Append `VAULT/log.md` (top-style per that file): `## [YYYY-MM-DD] save | <title>` with `Type`, `Location`, `Project`, and a one-line gist.
8. **Confirm:** "Saved → `notes/<slug>.md`, linked to `[[project]]`."

## Rules

- **Always absolute paths into VAULT** — your cwd is usually some *other* project. Never write the note into the current project by mistake.
- **Never touch `VAULT/raw/`** (immutable). A saved conversation is a generated note, not a raw source.
- If the conversation referenced external files/URLs/papers worth preserving as sources, suggest the user run `/ingest` (in the vault) rather than dumping raw material into a note.
- Other agents (Codex/Cursor): this skill is Claude-Code-specific, but the behavior is documented in `VAULT/AGENTS.md` §SAVE — follow that there.
