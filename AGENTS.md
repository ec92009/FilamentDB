# AGENTS.md

Working preferences for `~/Dev/FilamentDB`.

## Versioning

- Use visible app versions in the form `vX.Y`.
- `X` is the number of days since `2026-02-28`.
- `Y` increments with each build/change on that same day.
- Example: on `2026-03-31`, start at `v31.0`, then `v31.1`, `v31.2`, and so on.
- When updating the app UI version badge, always bump the minor version for each new build.
- Keep the visible app version badge in the top-right of the desktop app.

## Workflow

- Prefer small, clear commits.
- Default to committing and pushing each completed change unless the user asks otherwise.
- Refresh `README.md` and `PRD.md` as part of every commit when the work changes behavior, product direction, workflow, or user-facing expectations.
- Keep `README.md` and `PRD.md` written from an outsider's point of view:
  - explain what FilamentDB is, what it does, and where it is going
  - avoid assuming the reader already knows the project history or internal shorthand

## End-of-Cycle Checklist

Run these steps **in order** at the end of every development cycle:

1. **Build the app** — `python build_macos_app.py` (or `bash build_filamentdb_app.sh`)
2. **Dock the app** — add/replace FilamentDB in the macOS Dock from the freshly built bundle
3. **Update docs** — refresh `README.md`, `PRD.md`, and `AGENTS.md` to reflect any changes
4. **Bump the version** — patch-bump `version` in `pyproject.toml` AND update `VISIBLE_VERSION` in `filament_db_gui.py`
5. **Commit** — small, clear commit message
6. **Push** — push to remote so work can be resumed from another machine
7. **Restart the app** — kill any running FilamentDB instance, then open the freshly built `.app`
