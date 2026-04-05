# CLAUDE.md — FilamentDB

Persistent instructions for Claude Code working in this repo.

## End-of-Cycle Checklist

Run these steps **in order** at the end of every development cycle:

1. **Build the app** — `python build_macos_app.py` (or `bash build_filamentdb_app.sh`)
2. **Dock the app** — add/replace FilamentDB in the macOS Dock from the freshly built bundle
3. **Update docs** — refresh `README.md`, `PRD.md`, and `AGENTS.md` to reflect any behavior, product, or workflow changes; keep them written from an outsider's perspective
4. **Bump the version** — patch-bump `version` in `pyproject.toml` AND update `VISIBLE_VERSION` in `filament_db_gui.py` (follow the `vX.Y` scheme in AGENTS.md)
5. **Commit** — small, clear commit message describing what changed
6. **Push** — push to remote so work can be resumed from another machine
7. **Restart the app** — kill any running FilamentDB instance (`pkill -f filament_db_gui` or `pkill -f FilamentDB`), then open the freshly built `.app`

## See Also

- `AGENTS.md` — versioning scheme and general working preferences
- `PRD.md` — product direction and roadmap
