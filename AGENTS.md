# AGENTS.md

Working preferences for `~/Dev/FilamentDB`.

## Versioning

- Use visible app versions in the form `vX.Y`.
- `X` is the number of days since `2026-02-28`.
- `Y` increments with each build/change on that same day.
- Example: on `2026-03-31`, start at `v31.0`, then `v31.1`, `v31.2`, and so on.
- When updating the app UI version badge, always bump the minor version for each new build.

## Workflow

- Prefer small, clear commits.
- Default to committing and pushing each completed change unless the user asks otherwise.
- Refresh `README.md` and `PRD.md` as part of every commit when the work changes behavior, product direction, workflow, or user-facing expectations.
- Keep `README.md` and `PRD.md` written from an outsider's point of view:
  - explain what FilamentDB is, what it does, and where it is going
  - avoid assuming the reader already knows the project history or internal shorthand
